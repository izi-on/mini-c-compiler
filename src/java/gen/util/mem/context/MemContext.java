package gen.util.mem.context;

import ast.ClassType;
import ast.Decl;
import ast.PointerType;
import ast.VarDecl;
import gen.MemAllocCodeGen;
import gen.asm.AssemblyProgram;
import gen.asm.Label;
import gen.util.mem.FuncStackFrame;
import gen.util.mem.StackFrame;
import gen.util.value_holder.ValueHolder;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

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

    @FunctionalInterface
    public interface ClassVarAction {
        ValueHolder apply(int offsetOfVar);
    }

    public static MemAllocCodeGen newAllocator(AssemblyProgram asmProg) {
        MemAllocCodeGen memAllocCodeGen = new MemAllocCodeGen(asmProg);
        setAllocator(memAllocCodeGen);
        return memAllocCodeGen;
    }

    public static void setObjectLayouts(Map<ClassType, Map<String, Integer>> mapClassToObjectLayout) {
        INSTANCE.mapClassToObjectLayout = mapClassToObjectLayout;
    }

    public static Map<ClassType, Map<String, Integer>> getObjectLayouts() {
        return INSTANCE.mapClassToObjectLayout;
    }

    public static void setVirtualMaps(Map<ClassType, Map<String, List<Label>>> mapClassToVirtualTable) {
        INSTANCE.mapClassToVirtualTable = mapClassToVirtualTable;
    }

    public static void setVirtualMapMethodOrder(Map<ClassType, List<String>> mapToMethodOrder) {
        INSTANCE.mapToMethodOrder = mapToMethodOrder;
    }

    public static List<String> getVirtualMapMethodOrder(ClassType classType) {
        return mapToMethodOrder.get(classType);
    }

    public static Map<ClassType, Map<String, List<Label>>> getVirtualMaps() {
        return INSTANCE.mapClassToVirtualTable;
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

        public Var computeIfClassField(ClassVarAction r) {
            if (
                 MemContext.getAllocator().getGlobalVarLabel(decl).isEmpty()
                    && MemContext.getFuncStackFrame().offsetOf(decl).isEmpty()
            ) {
                FuncStackFrame funcStackFrame = MemContext.getFuncStackFrame();
                VarDecl pointerToObject = funcStackFrame.func.params.get(0);
                int offsetOfVar = funcStackFrame.offsetOf(pointerToObject).orElseThrow();
                Map<String, Integer> objectLayout = MemContext.getObjectLayouts().get(((PointerType)pointerToObject.type).pointerizedType);
                int offsetInObjectLayout = objectLayout.get(decl.name);
                int offsetOfField = offsetOfVar + offsetInObjectLayout;
                value = r.apply(offsetOfField);
            }
            return this;
        }

        public ValueHolder getValue() {
            return value;
        }
    }

    public static void mapToVTable(ClassType classType, Label label) {
        INSTANCE.mapClassToVTableLabel.put(classType, label);
    }

    public static Label getVTableLabel(ClassType classType) {
        return INSTANCE.mapClassToVTableLabel.get(classType);
    }

    public static boolean setMethodLabelWritten(Label label) {
        return implementedLabels.add(label);
    }
    public static boolean isMethodLabelWritten(Label label) {
        return implementedLabels.contains(label);
    }

    static HashSet<Label> implementedLabels = new HashSet<>();
    static Map<ClassType, List<String>> mapToMethodOrder;
    static MemContext INSTANCE;
    private MemAllocCodeGen allocator;
    private StackFrame stackFrame;
    private Map<ClassType, Label> mapClassToVTableLabel = new HashMap<>();
    private Map<ClassType, Map<String, List<Label>>> mapClassToVirtualTable;
    private Map<ClassType, Map<String, Integer>> mapClassToObjectLayout;
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
