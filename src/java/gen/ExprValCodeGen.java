package gen;

import ast.*;
import gen.asm.AssemblyProgram;
import gen.asm.Label;
import gen.asm.OpCode;
import gen.asm.Register;
import gen.util.context.MemContext;


/**
 * Generates code to evaluate an expression and return the result in a register.
 */
public class ExprValCodeGen extends CodeGen {

    public ExprValCodeGen(AssemblyProgram asmProg) {
        this.asmProg = asmProg;
    }

    public Register visit(Expr e) {
        AssemblyProgram.TextSection ts = asmProg.getCurrentTextSection();
        switch (e) {
            case BinOp binop -> {
                Register leftReg = visit(binop.lhs);
                Register rightReg = visit(binop.rhs);
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
                    case OR ->
                            ts.emit(OpCode.OR, result, leftReg, rightReg);
                    case AND ->
                            ts.emit(OpCode.AND, result, leftReg, rightReg);
                    default ->
                            throw new IllegalStateException("Unknown binary operator: " + binop.op);
                }
                return result;
            }

            case Assign a -> {
                Register r = visit(a.rhs);
                switch (a.lhs) {
                    case VarExpr v -> {
                        if (v.vd == null) {
                            throw new IllegalStateException("VarExpr " + v.name + " is referencing a null VarDecl" );
                        }
                        MemContext.Var.of(v.vd)
                            .computeIfGlobal(labelOfVar -> {
                                ts.emit(OpCode.LA, Register.Arch.t0, labelOfVar);
                                ts.emit(OpCode.SW, r, Register.Arch.t0, 0);
                            })
                            .computeIfLocal(offsetOfVar -> {
                                ts.emit(OpCode.SW, r, Register.Arch.fp, offsetOfVar);
                            });

                    }
                    default -> throw new IllegalStateException("Unexpected value: " + a.lhs);
                }
                return r;
            }

            case IntLiteral i -> {
                Register r = Register.Virtual.create();
                ts.emit(OpCode.ADDI, r, Register.Arch.zero, i.value);
                return r;
            }

            case VarExpr ve -> {
                if (ve.vd == null) {
                    throw new IllegalStateException("VarExpr " + ve.name + " is referencing a null VarDecl" );
                }
                Register r = Register.Virtual.create();
                MemContext.Var.of(ve.vd)
                    .computeIfGlobal(labelOfVar -> {
                        ts.emit(OpCode.LA, Register.Arch.t0, labelOfVar);
                        ts.emit(OpCode.LW, r, Register.Arch.t0, 0);
                    })
                    .computeIfLocal(offsetOfVar -> {
                        ts.emit(OpCode.LW, r, Register.Arch.fp, offsetOfVar);
                    });
                return r;
            }

            case FunCallExpr f -> {
                // put args on stack
                f.args.forEach(arg -> {
                    ts.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, -TypeSizeGetter.getSize( (arg.type != null) ? arg.type : BaseType.VOID));
                    Register argReg = visit(arg);
                    ts.emit(OpCode.SW, argReg, Register.Arch.sp, 0);
                });

                // space for return value
                ts.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, -TypeSizeGetter.getSize(f.type));
                ts.emit(OpCode.JAL, Label.get(f.name));

                // store return value in a register
                Register r = Register.Virtual.create();
                ts.emit(OpCode.LW, r, Register.Arch.sp, 0);

                // clean up stack
                int cleanupSpDecrement = TypeSizeGetter.getSize(f.type) + f.args.stream().mapToInt(arg -> TypeSizeGetter.getSize( (arg.type != null) ? arg.type : BaseType.VOID)).sum();
                ts.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, cleanupSpDecrement);

                return r;
            }

            default -> throw new IllegalStateException("Unexpected value: " + e);
        }
    }
}
