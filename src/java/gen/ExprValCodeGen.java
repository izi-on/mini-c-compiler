package gen;

import ast.*;
import gen.asm.AssemblyProgram;
import gen.asm.Label;
import gen.asm.OpCode;
import gen.asm.Register;
import gen.util.mem.FuncStackFrame;
import gen.util.mem.context.MemContext;
import gen.util.rules.PassByRef;
import gen.util.value_holder.ValueHolder;

import java.awt.*;
import java.util.List;


/**
 * Generates code to evaluate an expression and return the result in a register.
 */
public class ExprValCodeGen extends CodeGen {

    public ExprValCodeGen(AssemblyProgram asmProg) {
        this.asmProg = asmProg;
    }

    public ValueHolder visit(Expr e) {
        AssemblyProgram.TextSection ts = asmProg.getCurrentTextSection();
        switch (e) {
            case BinOp binop -> {
                switch (binop.op) {
                    case AND -> {
                        Label falseEval = Label.create("false_and");
                        Label endLbl = Label.create("end_and");

                        // eval left
                        Register leftReg = visit(binop.lhs).getValRegister();
                        ts.emit(OpCode.BEQ, leftReg, Register.Arch.zero, falseEval);

                        // eval right
                        Register rightReg = visit(binop.rhs).getValRegister();
                        ts.emit(OpCode.BEQ, rightReg, Register.Arch.zero, falseEval);

                        Register result = Register.Virtual.create();

                        // if here, then true
                        ts.emit(OpCode.ADDI, result, Register.Arch.zero, 1);
                        ts.emit(OpCode.J, endLbl);

                        // false branch
                        ts.emit(falseEval);
                        ts.emit(OpCode.ADDI, result, Register.Arch.zero, 0);

                        // end
                        ts.emit(endLbl);

                        return new ValueHolder.OnRegister(asmProg, binop, result);
                    }
                    case OR -> {
                        Label falseEval = Label.create("false_or");
                        Label trueEval = Label.create("true_or");
                        Label endLbl = Label.create("end_or");

                        // eval left
                        Register leftReg = visit(binop.lhs).getValRegister();
                        ts.emit(OpCode.BNEZ, leftReg, trueEval);

                        // eval right
                        Register rightReg = visit(binop.rhs).getValRegister();
                        ts.emit(OpCode.BNEZ, rightReg, trueEval);

                        Register result = Register.Virtual.create();

                        // if no branching here, false
                        ts.emit(OpCode.J, falseEval);

                        // true branch
                        ts.emit(trueEval);
                        ts.emit(OpCode.ADDI, result, Register.Arch.zero, 1);
                        ts.emit(OpCode.J, endLbl);

                        // false branch
                        ts.emit(falseEval);
                        ts.emit(OpCode.ADDI, result, Register.Arch.zero, 0);

                        // end
                        ts.emit(endLbl);

                        return new ValueHolder.OnRegister(asmProg, e, result);
                    }
                }

                Register leftReg = visit(binop.lhs).getValRegister();
                Register rightReg = visit(binop.rhs).getValRegister();

                Register result = Register.Virtual.create();

                switch (binop.op) {
                    case ADD ->
                            ts.emit(OpCode.ADD, result, leftReg, rightReg);
                    case SUB ->
                            ts.emit(OpCode.SUB, result, leftReg, rightReg);
                    case MUL ->
                            ts.emit(OpCode.MUL, result, leftReg, rightReg);
                    case DIV -> {
                        ts.emit(OpCode.DIV, leftReg, rightReg);
                        ts.emit(OpCode.MFLO, result);
                    }
                    case MOD -> {
                        ts.emit(OpCode.DIV, leftReg, rightReg);
                        ts.emit(OpCode.MFHI, result);
                    }
                    case LT ->
                            ts.emit(OpCode.SLT, result, leftReg, rightReg);
                    case GT ->
                            ts.emit(OpCode.SLT, result, rightReg, leftReg);
                    case LE -> {
                        // left <= right  <=>  not (left > right)
                        Register temp = Register.Virtual.create();
                        ts.emit(OpCode.SLT, temp, rightReg, leftReg); // temp = 1 if left > right
                        Register one = Register.Virtual.create();
                        ts.emit(OpCode.ADDI, one, Register.Arch.zero, 1); // one = 1
                        ts.emit(OpCode.SUB, result, one, temp); // result = 1 - temp
                    }
                    case GE -> {
                        // left >= right  <=>  not (left < right)
                        Register temp = Register.Virtual.create();
                        ts.emit(OpCode.SLT, temp, leftReg, rightReg); // temp = 1 if left < right
                        Register one = Register.Virtual.create();
                        ts.emit(OpCode.ADDI, one, Register.Arch.zero, 1);
                        ts.emit(OpCode.SUB, result, one, temp);
                    }
                    case EQ -> {
                        // left == right  <=>  not ((left < right) or (right < left))
                        Register lt = Register.Virtual.create();
                        Register gt = Register.Virtual.create();
                        ts.emit(OpCode.SLT, lt, leftReg, rightReg);
                        ts.emit(OpCode.SLT, gt, rightReg, leftReg);
                        Register diff = Register.Virtual.create();
                        ts.emit(OpCode.OR, diff, lt, gt); // diff is 1 if values differ, 0 if equal
                        Register one = Register.Virtual.create();
                        ts.emit(OpCode.ADDI, one, Register.Arch.zero, 1);
                        ts.emit(OpCode.SUB, result, one, diff); // result = 1 if equal, 0 if not
                    }
                    case NE -> {
                        // left != right  <=>  (left < right) or (right < left)
                        ts.emit(OpCode.SLT, result, leftReg, rightReg);
                        Register temp = Register.Virtual.create();
                        ts.emit(OpCode.SLT, temp, rightReg, leftReg);
                        ts.emit(OpCode.OR, result, result, temp);
                    }
                    default ->
                            throw new IllegalStateException("Unknown binary operator: " + binop.op);
                }
                return new ValueHolder.OnRegister(asmProg, binop, result);
            }

            case ArrayAccessExpr arrAccess -> {
                Register addrOfArr = (new ExprAddrCodeGen(asmProg)).visit(arrAccess);
                return PassByRef.ifIs(arrAccess.type).then(subtype -> {
                    return new ValueHolder.OnRegister(asmProg, new PointerType(subtype), addrOfArr);
                }).orElse(new ValueHolder.OnMemoryAddr(asmProg, arrAccess, addrOfArr));
            }

            case Assign a -> {
                ValueHolder r = visit(a.rhs);
                Register addrL = (new ExprAddrCodeGen(asmProg)).visit(a.lhs);
                r.setTargetAddr(addrL).loadToTargetAddr();
                return r;
            }

            case IntLiteral i -> {
                Register r = Register.Virtual.create();
                ts.emit(OpCode.ADDI, r, Register.Arch.zero, i.value);
                return new ValueHolder.OnRegister(asmProg, i, r);
            }

            case ChrLiteral c -> {
                Register r = Register.Virtual.create();
                ts.emit(OpCode.ADDI, r, Register.Arch.zero, (int) c.value);
                return new ValueHolder.OnRegister(asmProg, c, r);
            }

            case StrLiteral s -> {
                return new ValueHolder.OnRegister(asmProg, s, new ExprAddrCodeGen(asmProg).visit(s));
            }

            case TypecastExpr te -> {
                return new ValueHolder.OnRegister(asmProg, te, visit(te.expr).getValRegister());
            }

            case FieldAccessExpr fa -> {
                Register toAccessAddr = (new ExprAddrCodeGen(asmProg)).visit(fa);
                return PassByRef.ifIs(fa.type).then(subtype -> {
                    return new ValueHolder.OnRegister(asmProg, new PointerType(subtype), toAccessAddr);
                }).orElse(new ValueHolder.OnMemoryAddr(asmProg, fa, toAccessAddr));
            }

            case SizeOfExpr sof -> {
                Register r = Register.Virtual.create();
                if (sof.sizeOfType instanceof ClassType) {
                    ts.emit(OpCode.ADDI, r, Register.Arch.zero, TypeSizeGetter.WORD_SIZE);
                    return new ValueHolder.OnRegister(asmProg, sof, r);
                }
                ts.emit(OpCode.ADDI, r, Register.Arch.zero, TypeSizeGetter.getSize(sof.sizeOfType));
                return new ValueHolder.OnRegister(asmProg, sof, r);
            }

            case VarExpr ve -> {
                return MemContext.Var.of(ve.vd)
                        .computeIfGlobal(labelOfVar -> {
                            Register addr = Register.Virtual.create();
                            ts.emit(OpCode.LA, addr, labelOfVar);
                            return PassByRef.ifIs(ve.type).then(subtype -> {
                                return new ValueHolder.OnRegister(asmProg, new PointerType(subtype), addr);
                            }).orElse(new ValueHolder.OnMemoryAddr(asmProg, ve, addr));
                        })
                        .computeIfLocal(offsetOfVar -> {
                            Register addr = Register.Virtual.create();
                            ts.emit(OpCode.ADDIU, addr, Register.Arch.fp, offsetOfVar);
                            return PassByRef.ifIs(ve.type).then(subtype -> {
                                if (offsetOfVar >= 0) { // this means it was passed to the function, so pointer
                                    ts.emit("Is pointer type, so load from the address");
                                    ts.emit(OpCode.LW, addr, addr, 0);
                                }
                                return new ValueHolder.OnRegister(asmProg, new PointerType(subtype), addr);
                            }).orElse(new ValueHolder.OnMemoryAddr(asmProg, ve, addr));
                        })
                        .computeIfClassField(offsetOfField -> {
                            Register addr = Register.Virtual.create();
                            ts.emit(OpCode.ADDIU, addr, Register.Arch.fp, offsetOfField);
                            return PassByRef.ifIs(ve.type).then(subtype -> {
                                return new ValueHolder.OnRegister(asmProg, new PointerType(subtype), addr);
                            }).orElse(new ValueHolder.OnMemoryAddr(asmProg, ve, addr));
                        })
                        .getValue();
            }

            case FunCallExpr f -> {
                if (f.isMethodCall()) {
                    // get the object ref (passed as first arg) then
                    VarDecl objectInstance = ((FuncStackFrame) MemContext.getStackFrame()).func.params.get(0);
                    // create a new InstanceFunCallExpr with the fun call expr
                    InstanceFunCallExpr instanceFunCallExpr = new InstanceFunCallExpr(
                            new VarExpr(objectInstance.name, objectInstance),
                            f
                    );
                    return visit(instanceFunCallExpr);
                }

                ts.emit("BEGIN FUNCALL EXPR FOR " + f.fd.name);
                // put args on stack
                f.args.forEach(arg -> {
                    ts.emit("LOADING ARG: " + arg.type);

                    ts.emit("GETTING  VALUE");
                    ValueHolder value = visit(arg);
                    ts.emit("VALUE CAUGHT");

                    // move stack
                    ts.emit(OpCode.ADDIU, Register.Arch.sp, Register.Arch.sp, -TypeSizeGetter.getSizeWordAlignmentForFunc(arg.type));

                    // create register for the destination addr
                    Register destinationAddr = Register.Virtual.create();
                    ts.emit(OpCode.ADDI, destinationAddr, Register.Arch.sp, 0);

                    // get the value and put it on the stack
                    value.setTargetAddr(destinationAddr).loadToTargetAddr();
                });

                // space for return value
                ts.emit("SPACE FOR RETURN VALUE");
                ts.emit(OpCode.ADDIU, Register.Arch.sp, Register.Arch.sp, -TypeSizeGetter.getSizeWordAlignmentForFunc(f.type));

                // call function
                ts.emit("GO TO FUNCTION");
                ts.emit(OpCode.JAL, Label.get(f.name));
                ts.emit("BACK FROM FUNCTION");

                // store return value in a register
                Register returnValAddr = Register.Virtual.create();
                ts.emit(OpCode.ADDI, returnValAddr, Register.Arch.sp, 0);
                return new ValueHolder.OnMemoryAddr(asmProg, f, returnValAddr);
            }

            case AddressOfExpr a -> {
                return new ValueHolder.OnRegister(asmProg, a, new ExprAddrCodeGen(asmProg).visit(a.expr));
            }

            case ValueAtExpr v -> {
                return new ValueHolder.OnMemoryAddr(asmProg, v, (new ExprAddrCodeGen(asmProg)).visit(v));
            }

            case NewInstanceExpr newInstanceExpr -> {
                ClassType classType = newInstanceExpr.classType;
                Label label = MemContext.getVTableLabel(classType);
                Register labelAddr = Register.Virtual.create();
                ts.emit(OpCode.LA, labelAddr, label);
                return new ValueHolder.OnRegister(asmProg, newInstanceExpr, labelAddr);
            }

            case InstanceFunCallExpr instanceFunCallExpr -> {
                ts.emit("BEGIN INSTANCE FUNCALL EXPR FOR " + instanceFunCallExpr.funCallExpr.name);

                // get the address of the object to implicitly pass
                Register addrOfObj = (new ExprAddrCodeGen(asmProg)).visit(instanceFunCallExpr.instanceExpr);

                // get the virtual table of the object
                Register vtableAddr = Register.Virtual.create();
                ts.emit(OpCode.LW, vtableAddr, addrOfObj, 0);

                // get the offset of the method to call in the table
                int methodOrder = MemContext.getVirtualMapMethodOrder((ClassType) instanceFunCallExpr.instanceExpr.type).indexOf(instanceFunCallExpr.funCallExpr.name);
                if (methodOrder == -1) {
                    throw new IllegalStateException("Method " + instanceFunCallExpr.funCallExpr.name + " not found in virtual table");
                }

                Register methodAddr = Register.Virtual.create();
                ts.emit(OpCode.LW, methodAddr, vtableAddr, methodOrder * TypeSizeGetter.WORD_SIZE); // each entry is 4 bytes

                // get the function expression for easier access
                FunCallExpr f = instanceFunCallExpr.funCallExpr;

                // _________________ COPIED MOST OF THIS FROM FUNCALL EXPR ________________
                // first arg is a pointer to the object layout
                ts.emit("Pass the pointer as first arg");
                ts.emit(OpCode.ADDIU, Register.Arch.sp, Register.Arch.sp, -TypeSizeGetter.getSizeWordAlignmentForFunc(new PointerType()));
                ts.emit(OpCode.SW, addrOfObj, Register.Arch.sp, 0); // store the pointer to the object on the stack

                // put args on stack
                f.args.subList(1, f.args.size()).forEach(arg -> {
                    ts.emit("LOADING ARG: " + arg.type);

                    ts.emit("GETTING  VALUE");
                    ValueHolder value = visit(arg);
                    ts.emit("VALUE CAUGHT");

                    // move stack
                    ts.emit(OpCode.ADDIU, Register.Arch.sp, Register.Arch.sp, -TypeSizeGetter.getSizeWordAlignmentForFunc(arg.type));

                    // create register for the destination addr
                    Register destinationAddr = Register.Virtual.create();
                    ts.emit(OpCode.ADDI, destinationAddr, Register.Arch.sp, 0);

                    // get the value and put it on the stack
                    value.setTargetAddr(destinationAddr).loadToTargetAddr();
                });

                // space for return value
                ts.emit("SPACE FOR RETURN VALUE");
                ts.emit(OpCode.ADDIU, Register.Arch.sp, Register.Arch.sp, -TypeSizeGetter.getSizeWordAlignmentForFunc(f.type));

                // call function
                ts.emit("GO TO FUNCTION");
                ts.emit(OpCode.JALR, methodAddr);
                ts.emit("BACK FROM FUNCTION");

                // store return value in a register
                Register returnValAddr = Register.Virtual.create();
                ts.emit(OpCode.ADDI, returnValAddr, Register.Arch.sp, 0);

                ts.emit("END INSTANCE FUNCALL EXPR FOR " + instanceFunCallExpr.funCallExpr.name);
                return new ValueHolder.OnMemoryAddr(asmProg, f, returnValAddr);
                // _____________________ END OF COPIED CODE ______________________
            }

            default -> throw new IllegalStateException("Unexpected value: " + e);
        }
    }
}
