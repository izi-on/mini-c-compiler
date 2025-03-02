package gen;

import ast.*;
import gen.asm.*;
import gen.util.context.MemContext;
import gen.util.mem.FuncStackFrame;
import gen.util.mem.StackFrame;
import gen.util.mem.StackItem;

public class StmtCodeGen extends CodeGen {

    public StmtCodeGen(AssemblyProgram asmProg) {
        this.asmProg = asmProg;
    }

    void visit(Stmt s) {
        FuncStackFrame currentFrame = MemContext.getFuncStackFrame();
        AssemblyProgram.TextSection ts = asmProg.getCurrentTextSection();
        switch (s) {
            case Block b -> {
                b.stmts.forEach((innerStmt) -> {
                    visit(innerStmt);
                });
            }

            case ExprStmt e -> {
                ExprValCodeGen exprValCodeGen = new ExprValCodeGen(asmProg);
                exprValCodeGen.visit(e.expr);
            }

            case Return r -> {
                ts.emit(new Comment("Return statement start"));
                ExprValCodeGen exprValCodeGen = new ExprValCodeGen(asmProg);
                r.expr.ifPresent(expr -> {
                    Register exprVal = exprValCodeGen.visit(expr);
                    ts.emit(OpCode.SW, exprVal,
                            Register.Arch.fp, currentFrame.offsetOf(StackItem.RETURN_VAL).orElseThrow());
                });
                ts.emit(OpCode.JAL, Label.get(FunCodeGen.functionEndLabel(currentFrame.func.name)));
                ts.emit(new Comment("Return statement end"));
            }

            // To complete other cases
            default -> throw new IllegalStateException("Unexpected value: " + s);
        }
    }
}
