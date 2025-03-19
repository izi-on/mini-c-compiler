package regalloc.control_flow;

import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

public class ControlFlowNodePrinter {

    Set<ControlFlowNode> visited = new HashSet<>();

    public void visit(ControlFlowNode node) {
        if (visited.contains(node)) {
            return;
        }
        System.out.println("__________________");
        System.out.println("Node: " + node.id());
        System.out.println("Item: " + node.item);
        System.out.println("Successors: " + node.successors.stream()
                .map(ControlFlowNode::id)
                .collect(Collectors.toList()));
        System.out.println("Predecessors: " + node.predecessors.stream().map(ControlFlowNode::id).collect(Collectors.toList()));
        System.out.println("__________________");
        visited.add(node);
        node.successors.forEach(this::visit);
    }
}
