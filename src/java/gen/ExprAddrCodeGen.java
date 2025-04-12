package gen;

import ast.*;
import gen.asm.AssemblyProgram;
import gen.asm.Label;
import gen.asm.OpCode;
import gen.asm.Register;
import gen.error.UnexpectedExpressionError;
import gen.util.emit.Emitter;
import gen.util.mem.context.MemContext;
import gen.util.rules.PassByRef;
import gen.util.struct.StructUtils;
import gen.util.value_holder.ValueHolder;

import java.util.Map;

/**
 * Generates code to calculate the address of an expression and return the result in a register.
 */
public class ExprAddrCodeGen extends CodeGen {

    private Register getAddressAtIndex(Register addr, Register index, Type arrayedType) {
        Register result = Register.Virtual.create();
        Register indexOffset = Register.Virtual.create();
        new Emitter(asmProg.getCurrentTextSection()).emitMultiplicationByImm(indexOffset, index, TypeSizeGetter.getSize(arrayedType));
        asmProg.getCurrentTextSection().emit(OpCode.ADD, result, addr, indexOffset);
        return result;
    }

    public ExprAddrCodeGen(AssemblyProgram asmProg) {
        this.asmProg = asmProg;
    }

    public Register visit(Expr e) {
        AssemblyProgram.TextSection ts = asmProg.getCurrentTextSection();
        switch (e) {
            case VarExpr v -> {
                if (v.vd == null) {
                    throw new IllegalStateException("VarExpr " + v.name + " is referencing a null VarDecl");
                }
                return MemContext.Var.of(v.vd)
                        .computeIfGlobal(labelOfVar -> {
                            Register r = Register.Virtual.create();
                            ts.emit(OpCode.LA, r, labelOfVar);
                            return new ValueHolder.OnRegister(asmProg, new IntLiteral(), r); // same for references or variables
                        })
                        .computeIfLocal(offsetOfVar -> {
                            Register r = Register.Virtual.create();
                            ts.emit(OpCode.ADDIU, r, Register.Arch.fp, offsetOfVar);

                            PassByRef.ifIs(v.type).then(subtype -> {
                                if (offsetOfVar >= 0) {
                                    ts.emit(OpCode.LW, r, r, 0);
                                }
                                return null;
                            });
                            return new ValueHolder.OnRegister(asmProg, new IntLiteral(), r);
                        })
                        .computeIfClassField((offsetOfObjRef, offsetOfFieldInLayout) -> {
                            Register r = Register.Virtual.create();
                            ts.emit(OpCode.ADDIU, r, Register.Arch.fp, offsetOfObjRef);
                            ts.emit(OpCode.LW, r, r, 0); // we have pointer to beginning of object layout
                            ts.emit(OpCode.ADDIU, r, r, offsetOfFieldInLayout);
                            return new ValueHolder.OnRegister(asmProg, new IntLiteral(), r);
                        })
                        .getValue()
                        .getValRegister();
            }

            case StrLiteral str -> {
                Label strLabel = MemContext.getAllocator().getStrLiteralLabel(str).orElseThrow(() -> new IllegalStateException("StrLiteral " + str + " has no label"));
                Register r = Register.Virtual.create();
                ts.emit(OpCode.LA, r, strLabel);
                return r;
            }

            case ArrayAccessExpr arrAccess -> {
                // Must behave like a pointer, so the "expression" is technically a pointer.
                // For example: p[5] = 6; Here, p is a pointer. So, expr val for p to get address.
                Register addr = visit(arrAccess.array);
                if (arrAccess.array.type instanceof PointerType) { // pointer type points to actual array address beginning
                    ts.emit(OpCode.LW, addr, addr, 0);
                }
                Type arrayedType = switch (arrAccess.array.type) {
                    case ArrayType at -> at.arrayedType;
                    case PointerType pt -> pt.pointerizedType;
                    default -> {throw new IllegalStateException("Attempting to access from a type that cannot be an array");}
                };
                Register index = new ExprValCodeGen(asmProg).visit(arrAccess.index).getValRegister();
                return getAddressAtIndex(addr, index, arrayedType);
            }

            case ValueAtExpr v -> {
                Register addr = new ExprValCodeGen(asmProg).visit(v.expr).getValRegister();
                return addr;
            }

            case FieldAccessExpr fa -> {
                // get the offset of the field
                if (fa.structOrClass.type instanceof StructType) {
                    StructType strctType = (StructType) fa.structOrClass.type;
                    Decl fieldDecl = StructUtils.getDeclOfField(strctType, fa.field).orElseThrow(() -> new IllegalStateException("field decl access not associated with decl in struct decl"));
                    int fieldOffset = MemContext
                            .getAllocator()
                            .getFrameOf(strctType.structTypeDecl)
                            .orElseThrow()
                            .offsetOf(fieldDecl)
                            .orElseThrow();

                    // get the address of the struct
                    Register addr = visit(fa.structOrClass);

                    // calculate address
                    Register r = Register.Virtual.create();
                    ts.emit(OpCode.ADDIU, r, addr, fieldOffset);
                    return r;
                } else if (fa.structOrClass.type instanceof ClassType) {
                    Map<String, Integer> objectLayout = MemContext.getObjectLayouts().get(fa.structOrClass.type);
                    int fieldOffset = objectLayout.get(fa.field);

                    Register addr = visit(fa.structOrClass); // we get the address of the object REFERENCE
                    ts.emit(OpCode.LW, addr, addr, 0); // now, we have pointer to beginning of object layout

                    // calculate address
                    Register r = Register.Virtual.create();
                    ts.emit(OpCode.ADDIU, r, addr, fieldOffset);
                    return r;
                }
                throw new IllegalStateException("Field access not associated with struct or class");
            }

            default -> throw new UnexpectedExpressionError(e);
        }
    }

}
