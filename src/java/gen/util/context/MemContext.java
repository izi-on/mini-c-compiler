package gen.util.context;

import ast.Decl;
import gen.MemAllocCodeGen;
import gen.asm.Label;
import gen.util.mem.FuncStackFrame;
import gen.util.mem.StackFrame;

public class MemContext {

    @FunctionalInterface
    public interface GlobalVarAction {
        void apply(Label label);
    }

    @FunctionalInterface
    public interface LocalVarAction {
        void apply(int offset);
    }

    public static class Var {
        Decl decl;

        private Var(Decl decl) {
            this.decl = decl;
        }

        public static Var of(Decl decl) {
            return new Var(decl);
        }

        public Var computeIfGlobal(GlobalVarAction r) {
            r.apply(MemContext.getAllocator().getGlobalVarLabel(decl).orElseThrow());
            return this;
        }

        public Var computeIfLocal(LocalVarAction r) {
            r.apply(MemContext.getStackFrame().offsetOf(decl).orElseThrow());
            return this;
        }
    }
    static MemContext INSTANCE;
    private MemAllocCodeGen allocator;
    private StackFrame stackFrame;
    private MemContext() { }

    static {
        INSTANCE = new MemContext();
    }

    public Var decl(Decl decl) {
        return new Var(decl);
    }

    static public void setAllocator(MemAllocCodeGen allocator) {
        INSTANCE.allocator = allocator;
    }

    static public void setStackFrame(StackFrame stackFrame) {
        INSTANCE.stackFrame = stackFrame;
    }

    static public MemAllocCodeGen getAllocator() {
        return INSTANCE.allocator;
    }

    static public StackFrame getStackFrame() {
        return INSTANCE.stackFrame;
    }

    static public FuncStackFrame getFuncStackFrame() {
        if (INSTANCE.stackFrame instanceof FuncStackFrame) {
            return (FuncStackFrame) INSTANCE.stackFrame;
        }
        throw new IllegalStateException("Not in a function stack frame");
    }

    static public void withStackFrame(StackFrame stackFrame, Runnable r) {
        StackFrame old = getStackFrame();
        setStackFrame(stackFrame);
        r.run();
        setStackFrame(old);
    }

}
