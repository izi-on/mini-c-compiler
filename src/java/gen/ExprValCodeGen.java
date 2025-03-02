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
