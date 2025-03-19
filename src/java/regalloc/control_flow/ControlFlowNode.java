package regalloc.control_flow;

import gen.asm.AssemblyItem;
import gen.asm.AssemblyProgram;
import gen.asm.Label;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ControlFlowNode {
    private int id;
    static Map<AssemblyProgram.TextSection, Integer> idCount = new HashMap<>();
    private ControlFlowNode() {}
    public static ControlFlowNode create(AssemblyProgram.TextSection ts) {
        ControlFlowNode node = new ControlFlowNode();
        // increment idCount for text section
        int id = idCount.getOrDefault(ts, 0);
        idCount.put(ts, id + 1);
        node.id = id;
        return node;
    }
    public int id() {return id;}

    public List<ControlFlowNode> successors = new ArrayList<>();
    public List<ControlFlowNode> predecessors = new ArrayList<>();
    public List<Label> labelledBy = new ArrayList<>();
    public AssemblyItem item;
}
