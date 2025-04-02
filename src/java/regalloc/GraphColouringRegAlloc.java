package regalloc;

import gen.asm.*;
import regalloc.control_flow.ControlFlowNode;
import regalloc.control_flow.ControlFlowNodePrinter;

import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class GraphColouringRegAlloc implements AssemblyPass {

    public static final GraphColouringRegAlloc INSTANCE = new GraphColouringRegAlloc();

    public static final List<Register> AVAILABLE_REGISTERS = List.of(
            Register.Arch.t0, Register.Arch.t1, Register.Arch.t2, Register.Arch.t3, Register.Arch.t4,
            Register.Arch.t5, Register.Arch.t6, Register.Arch.t7, Register.Arch.t8, Register.Arch.t9,
            Register.Arch.s0, Register.Arch.s1, Register.Arch.s2, Register.Arch.s3, Register.Arch.s4,
            Register.Arch.s5, Register.Arch.s6, Register.Arch.s7
    );


//    public static final List<Register> AVAILABLE_REGISTERS = List.of(
//            Register.Arch.t0, Register.Arch.t1
//    );


    public static List<AssemblyItem> spillRegisterWithVirtual(Map<Register, Label> vrMap, List<AssemblyItem> items, Register regToSpill, Set<Register> registersUsedForSpilling) {
        // create a data label for the register
        Label label = Label.create("spilled_" + regToSpill);
        vrMap.put(regToSpill, label);

        List<AssemblyItem> newItems = new ArrayList<>();
        for (AssemblyItem item : items) {
            // guard statements
            if (!(item instanceof Instruction insn)) {
                newItems.add(item);
                continue;
            }
            if (insn.registers().stream().noneMatch(r -> regToSpill.equals(r))) {
                newItems.add(item);
                continue;
            }
            // if here, item uses the register to be spilled

            // item uses uses() the register to be spilled
            List<AssemblyItem> toAdd = new ArrayList<>();
            Register valueHolder = Register.Virtual.create();
            if (insn.uses().contains(regToSpill)) { // register is being used to define another register
                newItems.add(new Instruction.LoadAddress(valueHolder, label));
                newItems.add(new Instruction.Load(OpCode.LW, valueHolder, valueHolder, 0));
                registersUsedForSpilling.add(valueHolder);
            }

            // item defines def() the register to be spilled
            if (insn.def() != null && insn.def().equals(regToSpill)) {
                Register addrHolder = Register.Virtual.create();
                toAdd.add(new Instruction.LoadAddress(addrHolder, label));
                toAdd.add(new Instruction.Store(OpCode.SW, valueHolder, addrHolder, 0));
                registersUsedForSpilling.addAll(List.of(addrHolder, valueHolder));
            }

            newItems.add(insn.rebuild(Map.of(regToSpill, valueHolder)));
            newItems.addAll(toAdd);
        }
        return newItems;
    }

    /**
     * If some nodes are labelled with -1, that means that they must be spilled.
     * @param interferenceGraph
     * @param k
     * @return a map from register to int that represents a colour/label
     */
    public static Map<Register, Integer> labelWithKColours(Map<Register, Set<Register>> interferenceGraph, Set<Register> regsUsedForSpilling, List<Register> spilled, int k) {
        Set<Register> unused = new HashSet<>(interferenceGraph.keySet());
        Stack<Register> stack = new Stack<>();
        Map<Register, Integer> labels = new HashMap<>();
        while (unused.size() > 0) {
            // find a node with less than k neighbours
            Optional<Register> node = unused.stream().filter(r ->
                    interferenceGraph.get(r).stream().filter(_r -> (unused.contains(_r))).count() < k
            ).findFirst();

            // add node to stack if present
            if (node.isPresent()) {
                stack.add(node.get());
            } else { // otherwise, find a node with highest connectivity to spill
                node = unused
                    .stream()
                    .sorted(
                            Comparator.comparingInt(reg ->
                                -(int)interferenceGraph.get(reg)
                                .stream()
                                .filter(regf -> unused.contains(regf))
                                .count()
                            )
                    )
                    .filter(regf -> !regsUsedForSpilling.contains(regf))
                    .findFirst();
                spilled.add(node.get());
                return Map.of();
            }
            unused.remove(node.get());
        }

        TreeSet<Integer> colours = new TreeSet<>(); // ordered set of colours from 0 to k-1
        for (int i = 0; i < k; i++) {
            colours.add(i);
        }

        // assign colours
        while (!stack.isEmpty()) {
            Register node = stack.pop();
            Set<Integer> usedColours = new HashSet<>();
            for (Register neighbour : interferenceGraph.get(node)) {
                if (labels.containsKey(neighbour)) {
                    usedColours.add(labels.get(neighbour));
                }
            }
            colours.removeAll(usedColours);
            int colour = colours.first();
            labels.put(node, colour);
            colours.addAll(usedColours);
        }

        // for spilled nodes, assign -1
        for (Register node : spilled) {
            labels.put(node, -1);
        }

        return labels;
    }


    public static Map<Register, Set<Register>> getInterferenceGraph(Map<ControlFlowNode, Set<Register>> liveIn,
                                                                    Map<ControlFlowNode, Set<Register>> liveOut) {
        // step 1: collect all variables
        Set<Register> variables = new HashSet<>();
        Stream.concat(liveIn.keySet().stream(), liveOut.keySet().stream()).forEach(node -> {
            variables.addAll(node.uses());
            variables.addAll(node.defs());
        });

        // step 2: build the graph
        Map<Register, Set<Register>> interferenceGraph = new HashMap<>();
        variables.forEach(v -> interferenceGraph.put(v, new HashSet<>()));
        Stream.concat(liveIn.values().stream(), liveOut.values().stream()).forEach(registers -> {
            for (Register r1 : registers) {
                for (Register r2 : registers) {
                    if (!r1.equals(r2)) {
                        interferenceGraph.get(r1).add(r2);
                        interferenceGraph.get(r2).add(r1);
                    }
                }
            }
        });

        return interferenceGraph;
    }

    public static final void livelinessAnalysis(ControlFlowNode entry, Map<ControlFlowNode, Set<Register>> liveIn,
                                                Map<ControlFlowNode, Set<Register>> liveOut) {
        ControlFlowNode.visitLastFirst(entry, node -> {
            liveIn.put(node, new HashSet<>());
            liveOut.put(node, new HashSet<>());
        });

        // iterate until no change
        AtomicBoolean changed = new AtomicBoolean(true);
        while (changed.get()) {
            changed.set(false);
            ControlFlowNode.visitLastFirst(entry, node -> {
                // live out
                Set<Register> newLiveOut = new HashSet<>();
                for (ControlFlowNode succ : node.successors) {
                    newLiveOut.addAll(liveIn.get(succ));
                }
                // check if changed
                if (!liveOut.get(node).equals(newLiveOut)) {
                    changed.set(true);
                }
                liveOut.put(node, newLiveOut);

                // live in = uses() + (live out - defs())
                Set<Register> newLiveIn = new HashSet<>(newLiveOut);
                newLiveIn.removeAll(node.defs());
                newLiveIn.addAll(node.uses());
                if (!(liveIn.get(node).equals(newLiveIn))) {
                    changed.set(true);
                }
                liveIn.put(node, newLiveIn);
            });
        }
    }

    public static final ControlFlowNode buildControlFlowGraph(AssemblyProgram.TextSection textSection, List<AssemblyItem> items) {
        ControlFlowNode entry = ControlFlowNode.create(textSection);
        Map<AssemblyItem, HashSet<Label>> itemLabelListMap = new IdentityHashMap<>();
        Map<AssemblyItem, ControlFlowNode> itemControlFlowNodeMap = new IdentityHashMap<>();
        Map<Label, ControlFlowNode> labelControlFlowNodeMap = new IdentityHashMap<>();

        // remove comments
        items = items.stream().filter(item -> !(item instanceof Comment)).collect(Collectors.toList());

        // remove items that are: jump-and-link registers or jump registers (those are epilogues or function calls, irrelevant)
        // TODO: this could break other code gen implementations, works for mine
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
                    itemLabelListMap.put(item, new HashSet<>(accumulatedLabels));
                    accumulatedLabels.clear();
                }
            }
        }

        if (accumulatedLabels.size() > 0) {
            throw new RuntimeException("Labels not attached to any instruction");
        }

        // remove labels, don't need them anymore
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
                    // check if the mnemonic has suffix "al"
                    if (j.opcode.mnemonic.endsWith("al")) // if we jump and link, we don't want to remove the successor
                        continue;
                    // clear both ways
                    for (ControlFlowNode successor : currentNode.successors) {
                        successor.predecessors.remove(currentNode);
                    }
                    currentNode.successors.clear();
                }
                default -> {}
            }
        }

        // third pass, link control flow nodes
        for (AssemblyItem item : items) {
            ControlFlowNode currentNode = itemControlFlowNodeMap.get(item);
            switch (item) {
                case Instruction.ControlFlow controlFlow -> {
                    List<ControlFlowNode> targets = new ArrayList<>();
                    switch (controlFlow) {
                        case Instruction.BinaryBranch bb -> {
                            if (labelControlFlowNodeMap.containsKey(bb.label))
                                targets.add(labelControlFlowNodeMap.get(bb.label));
                        }
                        case Instruction.UnaryBranch ub -> {
                            if (labelControlFlowNodeMap.containsKey(ub.label))
                                targets.add(labelControlFlowNodeMap.get(ub.label));
                        }
                        case Instruction.Jump j -> {
                            if (labelControlFlowNodeMap.containsKey(j.label))
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

    public static List<AssemblyItem> removeUselessItems(ControlFlowNode entry, List<AssemblyItem> items) {

        // convert this list to a deque
        Map<ControlFlowNode, HashSet<ControlFlowNode>> nodeToDefinitions = new HashMap<>(); // maps the item and the registers used in it to the items that define them
        Map<ControlFlowNode, HashSet<ControlFlowNode>> nodeUsedBy = new HashMap<>(); // maps the item (its definition) to other items that use it
        Map<Register, ControlFlowNode> registerToNodeDefinition = new HashMap<>(); // maps the register to the item that defines it
        HashSet<ControlFlowNode> sources = new HashSet<>(); // items that are sources, so they are useless (they are not used by any other item)

        ControlFlowNode.visitWithMaxVisits(entry, 2, node -> {
            if (node.isInstruction()) {
                nodeToDefinitions.computeIfAbsent(node, n -> new HashSet<>()); // map used nodes in the item to the their definitions

                node.uses().stream().forEach(reg -> { // iterate through all the registers being used in the instruction
                    Optional<ControlFlowNode> usedNode = Optional.ofNullable(registerToNodeDefinition.get(reg));
                    usedNode.ifPresent(presentUsedNode -> { // if the node being used is linked to a node
                        nodeToDefinitions.computeIfAbsent(node, i -> new HashSet<>()).add(presentUsedNode);
                        nodeUsedBy.get(presentUsedNode).add(node);
                    });
                });

                if (node.defs().size() > 0) { // there is a definition
                    registerToNodeDefinition.put(node.defs().get(0), node);
                    nodeUsedBy.computeIfAbsent(node, i -> new HashSet<>());
                }
            }
        });

//        for (AssemblyItem item : items) {
//            if (item instanceof Instruction insn) {
//                itemToDefinitions.put(item, new ArrayList<>());
//
//                insn.uses().stream().filter(reg -> reg.isVirtual()).forEach(reg -> {
//                    Optional<AssemblyItem> definingItem = Optional.ofNullable(registerToDefinition.get(reg));
//                    definingItem.ifPresent(definingItemValue -> {
//                        sources.remove(definingItemValue);
//                        itemToDefinitions.computeIfAbsent(item, i -> new ArrayList<>()).add(definingItemValue);
//                        itemUsedBy.computeIfAbsent(definingItemValue, i -> new ArrayList<>()).add(item);
//                    });
//                });
//
//                if (insn.def() != null && insn.def().isVirtual()) { // there is a definition
//                    sources.add(item);
//                    registerToDefinition.put(insn.def(), item);
//                }
//            }
//        }

        // scan the maps and find sources
        nodeUsedBy.forEach((node, usedByNodes) -> {
            if (usedByNodes.size() == 0) {
                sources.add(node);
            }
        });

//        // keep removing sources until there are no more sources
//        while (sources.size() > 0) {
//            // remove the item
//            AssemblyItem toRemove = sources.iterator().next();
//            sources.remove(toRemove);
//            itemsDeque.remove(toRemove);
//
//            // go to each node that it uses, and remove it from the usedBy list
//            for (AssemblyItem usedByItem : itemToDefinitions.get(toRemove)) {
//                itemUsedBy.get(usedByItem).remove(toRemove);
//                // if the usedByItem has no more sources, add it to the sources
//                if (itemUsedBy.get(usedByItem).size() == 0) {
//                    sources.add(usedByItem);
//                }
//            }
//        }

        // keep removing from sources until there are no more sources
        List<AssemblyItem> itemsToRemove = new ArrayList<>();
        while (sources.size() > 0) {
            // remove the node
            ControlFlowNode toRemove = sources.iterator().next();
            sources.remove(toRemove);
            itemsToRemove.add(toRemove.item);

            // go to each node that it uses, and remove it from the usedBy list
            for (ControlFlowNode usedByNode : nodeToDefinitions.get(toRemove)) {
                nodeUsedBy.get(usedByNode).remove(toRemove);
                // if the usedByItem has no more sources, add it to the sources
                if (nodeUsedBy.get(usedByNode).size() == 0) {
                    sources.add(usedByNode);
                }
            }
        }

        List<AssemblyItem> newItems = items.stream().filter(item ->
                !itemsToRemove.stream().anyMatch(itemToRemove -> itemToRemove == item) // compare the reference
        ).collect(Collectors.toList());


        return newItems; // return the filtered items

//        // step 0: remove redundant virtual registers. For example, a register is defined but never used
//        Map<Register, List<Integer>>  registerToInstructionsIdx = new HashMap<>();
//        for (int i = 0; i < items.size(); i++) {
//            AssemblyItem item = items.get(i);
//            if (!(item instanceof Instruction insn)) {
//                continue;
//            }
//
//            // create a map from the instruction's used registers to their definitions (map from an item to a list of items)
//
//            // add defined registers to the map
//            if (insn.def() != null) {
//                List<Register> definedVirtualRegisters = List.of(insn.def()).stream().filter(r -> r.isVirtual()).collect(Collectors.toList());
//                int finalI = i;
//                definedVirtualRegisters.forEach(definedRegister -> {
//                    registerToInstructionsIdx.computeIfAbsent(definedRegister, r -> new ArrayList<>()).add(finalI);
//                });
//            }
//
//            // remove the used registers from the map (not useless)
//            List<Register> usedRegister = insn.uses().stream().filter(r -> r.isVirtual()).collect(Collectors.toList());
//            for (Register r : usedRegister) {
//                registerToInstructionsIdx.remove(r);
//            }
//        }
//        // any left over registers in this map are USELESS
//        Set<Integer> uselessIdx = new HashSet<>();
//        for (List<Integer> listOfUselessIdx : registerToInstructionsIdx.values()) {
//            uselessIdx.addAll(listOfUselessIdx);
//        }
//        // create a new list of items
//        List<AssemblyItem> filteredItems = IntStream.range(0, items.size())
//                .filter(i -> !uselessIdx.contains(i)) // condition using the index
//                .mapToObj(items::get)
//                .collect(Collectors.toList());
//        return filteredItems;
    }

    @Override
    public AssemblyProgram apply(AssemblyProgram program) {

        AssemblyProgram newProg = new AssemblyProgram();

        // copy all items from the data section
        program.dataSection.items.forEach( item -> {
            newProg.dataSection.emit(item);
        });

        // we assume that each function has a single corresponding text section
        program.textSections.forEach(textSection -> {
            AssemblyProgram.TextSection newTextSection = newProg.emitNewTextSection();

            List<AssemblyItem> filteredItems = textSection.items; // easier naming

// __________________ LIVELINESS DEAD INSTRUCTION REMOVAL _______________________
            Map<ControlFlowNode, Set<Register>> liveIn = new HashMap<>();
            Map<ControlFlowNode, Set<Register>> liveOut = new HashMap<>();
            Set<Register> registersUsedForSpilling = new HashSet<>();
            Map<Register, Label> vrMap = new HashMap<>(); // map from virtual register to label
            Map<Register, Integer> labelledRegisters = new HashMap<>();
            boolean hadSpilledVar;
            do {
                boolean changed = true;
                while (changed) {
                    changed = false;
                    // step 1: build cfg
                    ControlFlowNode controlFlowEntryNode = GraphColouringRegAlloc.buildControlFlowGraph(textSection, filteredItems);

                    // step 2: liveliness analysis for the control flow graph
                    liveIn = new HashMap<>();
                    liveOut = new HashMap<>();
                    GraphColouringRegAlloc.livelinessAnalysis(controlFlowEntryNode, liveIn, liveOut);

                    // check for dead registers
                    Set<Register> definedAndNotUsedRegisters = new HashSet<>();
                    ControlFlowNode.visitLastFirst(controlFlowEntryNode, node -> {
                        definedAndNotUsedRegisters.addAll(node.defs());
                    });
                    Map<ControlFlowNode, Set<Register>> allLiveliness = new HashMap<>();
                    allLiveliness.putAll(liveIn);
                    allLiveliness.putAll(liveOut);
                    allLiveliness.forEach((node, registers) -> {
                        definedAndNotUsedRegisters.removeAll(registers);
                    });

                    // if there are dead registers, remove them
                    if (definedAndNotUsedRegisters.size() > 0) {
                        changed = true;
                    }
    //                System.out.println("Dead registers: " + definedAndNotUsedRegisters);
                    filteredItems = filteredItems.stream().filter(item -> {
                        if (item instanceof Instruction insn) {
                            if (insn.def() != null && definedAndNotUsedRegisters.contains(insn.def())) {
                                return false;
                            }
                        }
                        return true;
                    }).collect(Collectors.toList());
    //                System.out.println("__________________-");
    //                filteredItems.forEach(System.out::println);
    //                System.out.println("__________________-");
                }
    // ________________________________________________________________________________

                // step 3: interference graph
                Map<Register, Set<Register>> interferenceGraph = GraphColouringRegAlloc.getInterferenceGraph(liveIn ,liveOut);

                // step 4: colour the graph
                labelledRegisters.clear();
                List<Register> toBeSpilled = new ArrayList<>();
                labelledRegisters.putAll(GraphColouringRegAlloc.labelWithKColours(interferenceGraph, registersUsedForSpilling, toBeSpilled, AVAILABLE_REGISTERS.size()));

                // check if there is a variable that needs to be spilled
                if (!toBeSpilled.isEmpty()) {
//                    System.out.println("____________-");
//                    System.out.println("Spilled variable:");
//                    System.out.println(toBeSpilled.get(0));
//                    System.out.println("Registers that cannot be spilled:");
//                    System.out.println(registersUsedForSpilling.stream().sorted(Comparator.comparing(Register::toString)).collect(Collectors.toList()));
//                    System.out.println("____________-");
                    hadSpilledVar = true;
                    Register regToBeSpilled = toBeSpilled.get(0);
                    filteredItems = spillRegisterWithVirtual(vrMap, filteredItems, regToBeSpilled, registersUsedForSpilling);
                } else {
                    hadSpilledVar = false;
                }
            } while (hadSpilledVar);

            // step 4.5: create a label for each register to be spilled in the data section
            vrMap.forEach((r, l) -> {
                newProg.dataSection.emit(l);
                newProg.dataSection.emit(new Directive("space " + 4));
            });

            // step 5: emit new instructions

            // ---- for push pop register instructions ------
            List<Label> labelsToVisitInOrder = new HashSet<>(vrMap.values()).stream()
                    .collect(Collectors.toList());
            List<Label> labelToVisitInReverseOrder = new ArrayList<>(labelsToVisitInOrder);
            Collections.reverse(labelToVisitInReverseOrder);
            List<Register> registersToVisitInOrder = new HashSet<>(labelledRegisters.values()).stream()
                    .filter(e -> e != -1)
                    .map(e -> AVAILABLE_REGISTERS.get(e))
                    .collect(Collectors.toList());
            List<Register> registersToVisitInReverseOrder = new ArrayList<>(registersToVisitInOrder);
            Collections.reverse(registersToVisitInReverseOrder);
            // ---- for push pop register instructions ------

            filteredItems.forEach(item -> {
                switch (item) {
                    case AssemblyTextItem ati -> newTextSection.emit(ati);
                    case Instruction insn -> {
                        if (insn == Instruction.Nullary.pushRegisters) {
                            newTextSection.emit("Original instruction: pushRegisters");
                            Register tempRegister = Register.Arch.t0; // store t0 on stack and use it for pushing spilled regs

                            int countOffset = 0;
                            newTextSection.emit(OpCode.ADDIU, Register.Arch.sp, Register.Arch.sp, -4);
                            newTextSection.emit(OpCode.SW, tempRegister, Register.Arch.sp, 0);

                            for (Label l : labelsToVisitInOrder) { // first, push the spilled registers
                                // load content of memory at label into $t0
                                newTextSection.emit(OpCode.LA, tempRegister, l);
                                newTextSection.emit(OpCode.LW, tempRegister, tempRegister, 0);

                                // push $t0 onto stack
                                newTextSection.emit(OpCode.ADDIU, Register.Arch.sp, Register.Arch.sp, -4);
                                newTextSection.emit(OpCode.SW, tempRegister, Register.Arch.sp, 0);
                                countOffset -= 4;
                            }

                            newTextSection.emit(OpCode.LW, tempRegister, Register.Arch.sp, -countOffset); // get back from stack

                            newTextSection.emit("Registers:");
                            for (Register r : registersToVisitInOrder) {
                                newTextSection.emit(OpCode.ADDIU, Register.Arch.sp, Register.Arch.sp, -4);
                                newTextSection.emit(OpCode.SW, r, Register.Arch.sp, 0);
                            }
                        } else if (insn == Instruction.Nullary.popRegisters) {
                            newTextSection.emit("Original instruction: popRegisters");
                            List<Label> labelReversed = vrMap.values().stream().collect(Collectors.toList());
                            Collections.reverse(labelReversed);
                            newTextSection.emit("Registers:");
                            for (Register r : registersToVisitInReverseOrder) {
                                newTextSection.emit(OpCode.LW, r, Register.Arch.sp, 0);
                                newTextSection.emit(OpCode.ADDIU, Register.Arch.sp, Register.Arch.sp, 4);
                            }

                            Register tempRegister = Register.Arch.t0; // use for temporarily popping from stack
                            Register tempRegister2 = Register.Arch.t1; // use for temporarily popping from stack

                            int countOffset = 0;
                            newTextSection.emit(OpCode.SW, tempRegister, Register.Arch.sp, -4);
                            newTextSection.emit(OpCode.SW, tempRegister2, Register.Arch.sp, -8);

                            newTextSection.emit("Labels:");
                            for (Label l : labelToVisitInReverseOrder) {
                                // pop from stack into $t0
                                newTextSection.emit(OpCode.LW, tempRegister, Register.Arch.sp, 0);
                                newTextSection.emit(OpCode.ADDIU, Register.Arch.sp, Register.Arch.sp, 4);
                                countOffset += 4;

                                // store content of $t0 in memory at label
                                newTextSection.emit(OpCode.LA, tempRegister2, l);
                                newTextSection.emit(OpCode.SW, tempRegister, tempRegister2, 0);
                            }

                            newTextSection.emit(OpCode.LW, tempRegister, Register.Arch.sp, -countOffset - 4); // get back from stack
                            newTextSection.emit(OpCode.LW, tempRegister2, Register.Arch.sp, -countOffset - 8); // get back from stack
                        } else {
                            List<Register> usedRegisters = insn.registers();
                            List<Register> newRegisters = usedRegisters.stream().map(r -> {
                                if (!r.isVirtual()) {
                                    return r;
                                }
                                return AVAILABLE_REGISTERS.get(labelledRegisters.get(r));
                            }).collect(Collectors.toList());

                            Map<Register, Register> vrToAr = new HashMap<>();
                            for (int i = 0; i < newRegisters.size(); i++) {
                                vrToAr.put(usedRegisters.get(i), newRegisters.get(i));
                            }

                            Instruction newInsn = insn.rebuild(vrToAr);
                            newTextSection.emit("Original instruction: " + insn);
                            newTextSection.emit(newInsn);
                        }
                    }
                }
            });


        });
        return newProg;

    }
}