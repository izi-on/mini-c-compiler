package gen.util.mem.context;

import ast.Decl;
import gen.MemAllocCodeGen;
import gen.asm.AssemblyProgram;
import gen.asm.Label;
import gen.util.mem.FuncStackFrame;
import gen.util.mem.StackFrame;
import gen.util.value_holder.ValueHolder;

public class MemContext {

    public static void reset() {
        INSTANCE = new MemContext();
    }

    @FunctionalInterface
    public interface GlobalVarAction {
        ValueHolder apply(Label label);
    }

    @FunctionalInterface
    public interface LocalVarAction {
        ValueHolder apply(int offset);
    }

    public static MemAllocCodeGen newAllocator(AssemblyProgram asmProg) {
        MemAllocCodeGen memAllocCodeGen = new MemAllocCodeGen(asmProg);
        setAllocator(memAllocCodeGen);
        return memAllocCodeGen;
    }

    public static class Var {
        Decl decl;
        ValueHolder value;

        private Var(Decl decl) {
            this.decl = decl;
        }

        public static Var of(Decl decl) {
            return new Var(decl);
        }

        public Var computeIfGlobal(GlobalVarAction r) {
            if (MemContext.getAllocator().getGlobalVarLabel(decl).isPresent()) {
                value = r.apply(MemContext.getAllocator().getGlobalVarLabel(decl).get());
            }
            return this;
        }

        public Var computeIfLocal(LocalVarAction r) {
            if (MemContext.getFuncStackFrame().offsetOf(decl).isPresent()) {
                value = r.apply(MemContext.getStackFrame().offsetOf(decl).orElseThrow());
            }
            return this;
        }

        public ValueHolder getValue() {
            return value;
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
