package regalloc;

import gen.asm.*;
import regalloc.control_flow.ControlFlowNode;

import javax.naming.ldap.Control;
import java.util.*;
import java.util.stream.Collectors;

public class GraphColouringRegAlloc implements AssemblyPass {

    public static final GraphColouringRegAlloc INSTANCE = new GraphColouringRegAlloc();

    public static final ControlFlowNode buildControlFlowGraph(AssemblyProgram.TextSection textSection) {
        ControlFlowNode entry = ControlFlowNode.create(textSection);
        Map<AssemblyItem, List<Label>> itemLabelListMap = new HashMap<>();
        Map<AssemblyItem, ControlFlowNode> itemControlFlowNodeMap = new HashMap<>();
        Map<Label, ControlFlowNode> labelControlFlowNodeMap = new HashMap<>();

        // remove comments
        List<AssemblyItem> items = textSection.items.stream().filter(item -> !(item instanceof Comment)).collect(Collectors.toList());

        // remove items that are: jump-and-link registers or jump registers (those are epilogues or function calls, irrelevant)
        items = items.stream().filter(item -> {
            if (item instanceof Instruction) {
                Instruction i = (Instruction) item;
                return switch (i) {
                    case Instruction.Jump j -> {
                        if (j.opcode.mnemonic.equals("jal")) {
                            yield false;
                        } else {
                            yield true;
                        }
                    }
                    case Instruction.JumpRegister jr -> false;
                    default -> true;
                };
            }
            return true;
        }).collect(Collectors.toList());

        // first pass: map labels to control nodes
        List<Label> accumulatedLabels = new ArrayList<>(); // store labels, then set them to instruction
        for (AssemblyItem item: items) {
            switch (item) {
                case Label l -> {accumulatedLabels.add(l);}
                default -> {
                    itemLabelListMap.put(item, new ArrayList<>(accumulatedLabels));
                    accumulatedLabels.clear();
                }
            }
        }

        // remove labels
        items = items.stream().filter(item -> !(item instanceof Label)).collect(Collectors.toList());

        // second pass: create a control flow node for each item and link to next item
        ControlFlowNode current = entry;
        for (AssemblyItem item: items) {
            // create node
            ControlFlowNode node = ControlFlowNode.create(textSection);
            itemControlFlowNodeMap.put(item, node);

            // set data
            node.item = item;
            node.labelledBy = itemLabelListMap.get(item);
            node.labelledBy.forEach(label -> labelControlFlowNodeMap.put(label, node));

            // link
            current.successors.add(node);
            node.predecessors.add(current);

            current = node;
        }

        // before third pass, remove unlink nodes with jump instructions from the successors
        for (AssemblyItem item : items) {
            ControlFlowNode currentNode = itemControlFlowNodeMap.get(item);
            switch (item)  {
                case Instruction.Jump j -> {
                    // clear both ways
                    for (ControlFlowNode successor : currentNode.successors) {
                        successor.predecessors.remove(currentNode);
                    }
                    currentNode.successors.clear();
                }
                default -> {}
            }
        }

        // third pass, build control flow graph
        for (AssemblyItem item : items) {
            ControlFlowNode currentNode = itemControlFlowNodeMap.get(item);
            switch (item) {
                case Instruction.ControlFlow controlFlow -> {
                    List<ControlFlowNode> targets = new ArrayList<>();
                    switch (controlFlow) {
                        case Instruction.BinaryBranch bb -> {
                            targets.add(labelControlFlowNodeMap.get(bb.label));
                        }
                        case Instruction.UnaryBranch ub -> {
                            targets.add(labelControlFlowNodeMap.get(ub.label));
                        }
                        case Instruction.Jump j -> {
                            targets.add(labelControlFlowNodeMap.get(j.label));
                        }
                        default -> {throw new RuntimeException("Unsupported control flow instruction");}
                    }

                    // add the targets
                    for (ControlFlowNode target : targets) {
                        currentNode.successors.add(target);
                        target.predecessors.add(currentNode);
                    }
                }
                default -> {}
            }
        }

        return entry;
    }

    @Override
    public AssemblyProgram apply(AssemblyProgram program) {

        AssemblyProgram newProg = new AssemblyProgram();

        // we assume that each function has a single corresponding text section
        // step 1: build control-flow graph for each function
        Map<AssemblyProgram.TextSection, ControlFlowNode> textSectionControlFlowNodeMap = new HashMap<>();
        program.textSections.forEach(textSection -> {
            ControlFlowNode controlFlowNode = GraphColouringRegAlloc.buildControlFlowGraph(textSection);
            textSectionControlFlowNodeMap.put(textSection, controlFlowNode);
        });


        // To complete

        return newProg;
    }



}