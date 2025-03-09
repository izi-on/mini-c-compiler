package gen;

import ast.*;
import gen.asm.*;
import gen.util.mem.access.AccessType;
import gen.util.mem.access.AccessTypeGetter;
import gen.util.mem.context.MemContext;
import gen.util.mem.FuncStackFrame;
import gen.util.mem.StackItem;
import gen.util.value_holder.ValueHolder;

public class StmtCodeGen extends CodeGen {

    static StmtCodeGen firstVisitor;
    class IfStmnt {
        If i;
        AssemblyProgram.TextSection ts;
        IfStmnt(If i, AssemblyProgram.TextSection ts) {
            this.i = i;
            this.ts = ts;
        }

        public void emit() {
            Label elseLabel = Label.create("else");
            Label endLabel = Label.create("end");
            ts.emit(OpCode.BEQZ, (new ExprValCodeGen(StmtCodeGen.this.asmProg)).visit(i.condition).getValRegister(), elseLabel);
            StmtCodeGen.this.visit(i.thenStmt);
            ts.emit(OpCode.J, endLabel);
            ts.emit(elseLabel);
            i.elseStmt.ifPresent(elseStmt -> {
                StmtCodeGen.this.visit(elseStmt);
            });
            ts.emit(endLabel);
        }
    }

    public class StmtCodeGenWithWhileWrapper extends StmtCodeGen {
        While w;
        Label startLabel;
        Label endLabel;
        StmtCodeGen fallbackTo;
        public StmtCodeGenWithWhileWrapper(AssemblyProgram asmProg, While w, Label startLabel, Label endLabel, StmtCodeGen fallbackTo) {
            super(asmProg);
            this.w = w;
            this.startLabel = startLabel;
            this.endLabel = endLabel;
            this.fallbackTo = fallbackTo;
        }

        @Override
        void visit(Stmt s) {
            AssemblyProgram.TextSection ts = asmProg.getCurrentTextSection();
            switch (s) {
                case Break b -> {
                    ts.emit(OpCode.J, endLabel);
                }
                case Continue c -> {
                    ts.emit(OpCode.J, startLabel);
                }
                default -> fallbackTo.visit(s);
            }
        }
    }

    public StmtCodeGen(AssemblyProgram asmProg) {
        this.asmProg = asmProg;
        if (firstVisitor == null) {
            firstVisitor = this;
        }
    }

    void visit(Stmt s) {
        FuncStackFrame currentFrame = MemContext.getFuncStackFrame();
        AssemblyProgram.TextSection ts = asmProg.getCurrentTextSection();
        switch (s) {
            case Block b -> {
                b.stmts.forEach(firstVisitor::visit);
            }

            case ExprStmt e -> {
                ExprValCodeGen exprValCodeGen = new ExprValCodeGen(asmProg);
                exprValCodeGen.visit(e.expr);
            }

            case If i -> {
                new IfStmnt(i, ts).emit();
            }

            case Return r -> {
                ts.emit(new Comment("Return statement start"));
                ExprValCodeGen exprValCodeGen = new ExprValCodeGen(asmProg);
                r.expr.ifPresent(expr -> {
                    // set the target address
                    Register targetAddr = Register.Virtual.create();
                    ts.emit(OpCode.ADDIU, targetAddr, Register.Arch.fp, currentFrame.offsetOf(StackItem.RETURN_VAL).orElseThrow());

                    // get the value and set it
                    ValueHolder value = exprValCodeGen.visit(expr);
                    value.setTargetAddr(targetAddr).loadToTargetAddr();
                });
                ts.emit(OpCode.JAL, Label.get(FunCodeGen.functionEndLabel(currentFrame.func.name)));
                ts.emit(new Comment("Return statement end"));
            }

            case While w -> {
                Label startLabel = Label.create("while_start");
                Label endLabel = Label.create("while_end");

                ts.emit(startLabel);
                ts.emit(OpCode.BEQZ, (new ExprValCodeGen(asmProg)).visit(w.cond).getValRegister(), endLabel);
                withNewFirstVisitor(new StmtCodeGenWithWhileWrapper(asmProg, w, startLabel, endLabel, this), () -> {
                    firstVisitor.visit(w.body);
                });
                ts.emit(OpCode.J, startLabel);
                ts.emit(endLabel);
            }

            default -> { throw new IllegalStateException("Unexpected statement: " + s.toString()); }
        }
    }

    private void withNewFirstVisitor(StmtCodeGen newVisitor, Runnable r) {
        StmtCodeGen oldVisitor = firstVisitor;
        firstVisitor = newVisitor;
        r.run();
        firstVisitor = oldVisitor;
    }
}
