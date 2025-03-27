package regalloc.control_flow;

import gen.asm.*;

import java.util.*;
import java.util.stream.Collectors;

public class ControlFlowNode {
    @FunctionalInterface
    public interface Callback {
        void run(ControlFlowNode node);
    }

    public static boolean RegFilter(Register r) {
        return r.isVirtual();
    }

    private int id;
    static Map<AssemblyProgram.TextSection, Integer> idCount = new IdentityHashMap<>();
    static void visitLastFirst(ControlFlowNode node, Callback callback, Set<ControlFlowNode> visited) {
        if (node == null) return;
        if (visited.contains(node)) return;
        visited.add(node);
        for (ControlFlowNode succ : node.successors) {
            visitLastFirst(succ, callback, visited);
        }
        callback.run(node);
    }

    public static void visitWithMaxVisits(ControlFlowNode node, Callback callback, int maxVisits, Map<ControlFlowNode, Integer> visited) {
        if (node == null) return;
        if (visited.getOrDefault(node, 0) >= maxVisits) return;
        visited.put(node, visited.getOrDefault(node, 0) + 1);
        callback.run(node);
        for (ControlFlowNode succ : node.successors) {
            visitWithMaxVisits(succ, callback, maxVisits, visited);
        }
    }

    public static void visitWithMaxVisits(ControlFlowNode node, int maxVisits,Callback callback) {
        visitWithMaxVisits(node, callback, maxVisits, new HashMap<>());
    }

    public List<Register> uses() {
        if (item == null) return new ArrayList<>();
        switch (item) {
            case Instruction i -> {
                return Optional.ofNullable(i.
                        uses()
                        .stream()
                        .filter(ControlFlowNode::RegFilter).collect(Collectors.toList()))
                        .orElse(new ArrayList<>());
            }
            default -> {
                return new ArrayList<>();
            }
        }
    };

    public List<Register> defs() {
        if (item == null) return new ArrayList<>();
        switch (item) {
            case Instruction i -> {
                return Optional.ofNullable(i.def()).map(List::of).orElse(new ArrayList<>()).stream().filter(ControlFlowNode::RegFilter).collect(Collectors.toList());
            }
            default -> {
                return new ArrayList<>();
            }
        }
    }

    public static void visitLastFirst(ControlFlowNode node, Callback callback) {
        visitLastFirst(node, callback, new HashSet<>());
    }

    private ControlFlowNode() {}

    public static ControlFlowNode create(AssemblyProgram.TextSection ts) {
        ControlFlowNode node = new ControlFlowNode();
        // increment idCount for text section
        int id = idCount.getOrDefault(ts, 0);
        idCount.put(ts, id + 1);
        node.id = id;
        return node;
    }

    public boolean isInstruction() {
        return item instanceof Instruction;
    }

    public int id() {return id;}

    public Set<ControlFlowNode> successors = new HashSet<>();
    public Set<ControlFlowNode> predecessors = new HashSet<>();
    public Set<Label> labelledBy = new HashSet<>();
    public AssemblyItem item = null;
}
