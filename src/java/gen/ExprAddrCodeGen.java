package gen;

import ast.*;
import gen.asm.AssemblyProgram;
import gen.asm.Label;
import gen.asm.OpCode;
import gen.asm.Register;
import gen.error.UnexpectedExpressionError;
import gen.util.mem.context.MemContext;
import gen.util.struct.StructUtils;
import gen.util.value_holder.ValueHolder;

/**
 * Generates code to calculate the address of an expression and return the result in a register.
 */
public class ExprAddrCodeGen extends CodeGen {

    private Register getAddressAtIndex(Register addr, Register index, ArrayType arrType) {
        Register result = Register.Virtual.create();
        Register indexOffset = Register.Virtual.create();
        asmProg.getCurrentTextSection().emitMultiplicationByImm(indexOffset, index, TypeSizeGetter.getSize(arrType.arrayedType));
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
                            return new ValueHolder.OnRegister(asmProg, new IntLiteral(), r);
                        })
                        .computeIfLocal(offsetOfVar -> {
                            Register r = Register.Virtual.create();
                            ts.emit(OpCode.ADDIU, r, Register.Arch.fp, offsetOfVar);
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
                Register arrAddress = visit(arrAccess.array);
                Register index = new ExprValCodeGen(asmProg).visit(arrAccess.index).getValRegister();
                return getAddressAtIndex(arrAddress, index, (ArrayType) arrAccess.array.type);
            }

            case ValueAtExpr v -> {
                Register addr = new ExprValCodeGen(asmProg).visit(v.expr).getValRegister();
                return addr;
            }

            case FieldAccessExpr fa -> {
                // get the offset of the field
                StructType strctType = (StructType) fa.struct.type;
                Decl fieldDecl = StructUtils.getDeclOfField(strctType, fa.field).orElseThrow(() -> new IllegalStateException("field decl access not associated with decl in struct decl"));
                int fieldOffset = MemContext
                        .getAllocator()
                        .getFrameOf(strctType.structTypeDecl)
                        .orElseThrow()
                        .offsetOf(fieldDecl)
                        .orElseThrow();

                // get the address of the struct
                Register addr = visit(fa.struct);

                // calculate address
                Register r = Register.Virtual.create();
                ts.emit(OpCode.ADDIU, r, addr, fieldOffset);
                return r;
            }

            default -> throw new UnexpectedExpressionError(e);
        }
    }

}
