package regalloc;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

import gen.asm.AssemblyItem;
import gen.asm.AssemblyProgram;
import gen.asm.Instruction;
import gen.asm.OpCode;
import gen.asm.Register;
import gen.asm.Label;
import regalloc.control_flow.ControlFlowNode;

import java.util.List;

public class TestUselessItemsRemoval {

    @Test
    public void testRemoveUselessItems() {
        // Create a dummy text section needed for control flow node creation.
        AssemblyProgram.TextSection dummyTS = new AssemblyProgram.TextSection();

        // Create three control flow nodes.
        ControlFlowNode node1 = ControlFlowNode.create(dummyTS);
        ControlFlowNode node2 = ControlFlowNode.create(dummyTS);
        ControlFlowNode node3 = ControlFlowNode.create(dummyTS);

        // Link the nodes linearly: node1 -> node2 -> node3.
        node1.successors.add(node2);
        node2.predecessors.add(node1);
        node2.successors.add(node3);
        node3.predecessors.add(node2);

        // Create some virtual registers.
        Register r1 = Register.Virtual.create();
        Register r2 = Register.Virtual.create();
        Register r3 = Register.Virtual.create();
        Register r4 = Register.Virtual.create();
        Register r5 = Register.Virtual.create();

        // Create two arithmetic instructions:
        // instr1: r1 = r2 + r3
        Instruction.TernaryArithmetic instr1 = new Instruction.TernaryArithmetic(OpCode.ADD, r1, r2, r3);
        // instr2: r4 = r1 - r5 (using the value from instr1)
        Instruction.TernaryArithmetic instr2 = new Instruction.TernaryArithmetic(OpCode.SUB, r4, r1, r5);
        // Create a jump instruction that is expected to remain.
        Instruction.Jump instr3 = new Instruction.Jump(OpCode.J, Label.get("L1"));

        // Assign the instructions to the control flow nodes.
        node1.item = instr1;
        node2.item = instr2;
        node3.item = instr3;

        // Prepare a list of all assembly items.
        List<AssemblyItem> items = List.of(instr1, instr2, instr3);

        // Invoke the useless items removal function.
        List<AssemblyItem> filtered = GraphColouringRegAlloc.removeUselessItems(node1, items);

        // Verify that only the jump instruction remains.
        assertEquals(1, filtered.size(), "Only one item should remain after removal");
        assertSame(instr3, filtered.get(0), "The remaining item should be the jump instruction");
    }

    @Test
    public void testCycleNotRemoved() {
        // Create a dummy text section (required to create ControlFlowNodes)
        AssemblyProgram.TextSection ts = new AssemblyProgram.TextSection();

        // Create three CFG nodes.
        ControlFlowNode node1 = ControlFlowNode.create(ts);
        ControlFlowNode node2 = ControlFlowNode.create(ts);
        ControlFlowNode node3 = ControlFlowNode.create(ts);
        ControlFlowNode node4 = ControlFlowNode.create(ts);

        // Link the nodes to form a cycle: node1 -> node2 -> node3 -> node1.
        //                                                      |
        //                                                      v
        //                                                     node4
        node1.successors.add(node2);
        node2.predecessors.add(node1);

        node2.successors.add(node3);
        node3.predecessors.add(node2);

        node3.successors.add(node1);
        node1.predecessors.add(node3);

        node3.successors.add(node4);
        node4.predecessors.add(node3);

        // Create some virtual registers.
        Register a = Register.Virtual.create();
        Register b = Register.Virtual.create();
        Register c = Register.Virtual.create();
        Register d = Register.Virtual.create();

        // Create three arithmetic instructions with cyclic dependency:
        // instr1: computes a = b + c
        Instruction.TernaryArithmetic instr1 = new Instruction.TernaryArithmetic(OpCode.ADD, a, b, c);
        // instr2: computes b = a + c, thus using a defined by instr1.
        Instruction.TernaryArithmetic instr2 = new Instruction.TernaryArithmetic(OpCode.ADD, b, a, c);
        // instr3: computes c = a + b, which in turn uses a and b.
        Instruction.TernaryArithmetic instr3 = new Instruction.TernaryArithmetic(OpCode.ADD, c, a, b);
        // instr4: computes d = a + c, which uses a and c.
        Instruction.TernaryArithmetic instr4 = new Instruction.TernaryArithmetic(OpCode.ADD, d, a, c);

        // Assign the instructions to the nodes.
        node1.item = instr1;
        node2.item = instr2;
        node3.item = instr3;
        node4.item = instr4;

        // Prepare the list of all assembly items.
        List<AssemblyItem> items = List.of(instr1, instr2, instr3, instr4);

        // Apply the useless-items removal function starting from node1.
        List<AssemblyItem> filtered = GraphColouringRegAlloc.removeUselessItems(node1, items);

        // Assert that all instructions are retained due to their cyclic dependency.
        assertEquals(3, filtered.size(), "All three instructions should remain as they form a cycle.");
        assertTrue(filtered.contains(instr1), "instr1 should be present");
        assertTrue(filtered.contains(instr2), "instr2 should be present");
        assertTrue(filtered.contains(instr3), "instr3 should be present");
        assertTrue(!filtered.contains(instr4), "instr4 should not be present");
    }

    // Test 1: Consecutive dead definitions that are not used.
    @Test
    public void testConsecutiveDeadDefinitions() {
        AssemblyProgram.TextSection ts = new AssemblyProgram.TextSection();
        ControlFlowNode node1 = ControlFlowNode.create(ts);
        ControlFlowNode node2 = ControlFlowNode.create(ts);

        // Linear: node1 -> node2.
        node1.successors.add(node2);
        node2.predecessors.add(node1);

        // Virtual registers.
        Register a = Register.Virtual.create();
        Register b = Register.Virtual.create();
        Register c = Register.Virtual.create();
        Register d = Register.Virtual.create();
        Register e = Register.Virtual.create();

        // Both instructions define values that are never used.
        // instr1: a = a + b  (self-reference)
        Instruction.TernaryArithmetic instr1 = new Instruction.TernaryArithmetic(OpCode.ADD, a, a, b);
        // instr2: c = d + e
        Instruction.TernaryArithmetic instr2 = new Instruction.TernaryArithmetic(OpCode.ADD, c, d, e);

        node1.item = instr1;
        node2.item = instr2;

        List<AssemblyItem> items = List.of(instr1, instr2);
        List<AssemblyItem> filtered = GraphColouringRegAlloc.removeUselessItems(node1, items);

        // Expect both instructions to be removed.
        assertEquals(0, filtered.size(), "Both dead definitions should be removed");
    }

    // Test 2: Mixed dead and live definitions.
    // Here we build a chain:
    // instr1: a = a + b   (dead if not used)
    // instr2: d = a + c   (uses a; but if d's value is never used, then instr2 is dead,
    // causing instr1 to be removed as well)
    // instr3: j = d + e   (defines j but its value is not used)
    // instr4: a jump instruction (always live)
    @Test
    public void testMixedDeadAndLiveDefinitions() {
        AssemblyProgram.TextSection ts = new AssemblyProgram.TextSection();
        ControlFlowNode node1 = ControlFlowNode.create(ts);
        ControlFlowNode node2 = ControlFlowNode.create(ts);
        ControlFlowNode node3 = ControlFlowNode.create(ts);
        ControlFlowNode node4 = ControlFlowNode.create(ts);

        // Linear chain: node1 -> node2 -> node3 -> node4.
        node1.successors.add(node2); node2.predecessors.add(node1);
        node2.successors.add(node3); node3.predecessors.add(node2);
        node3.successors.add(node4); node4.predecessors.add(node3);

        // Virtual registers.
        Register a = Register.Virtual.create();
        Register b = Register.Virtual.create();
        Register c = Register.Virtual.create();
        Register d = Register.Virtual.create();
        Register e = Register.Virtual.create();
        Register j = Register.Virtual.create();

        // Build the chain.
        // instr1: a = a + b   (self-reference, dead)
        Instruction.TernaryArithmetic instr1 = new Instruction.TernaryArithmetic(OpCode.ADD, a, a, b);
        // instr2: d = a + c   (depends on a; if a is dead, d becomes dead)
        Instruction.TernaryArithmetic instr2 = new Instruction.TernaryArithmetic(OpCode.ADD, d, a, c);
        // instr3: j = d + e   (defines j; j is never used, so this is dead and in turn d and a become dead)
        Instruction.TernaryArithmetic instr3 = new Instruction.TernaryArithmetic(OpCode.ADD, j, d, e);
        // instr4: a jump instruction, always kept.
        Instruction.Jump instr4 = new Instruction.Jump(OpCode.J, Label.get("LIVE"));

        node1.item = instr1;
        node2.item = instr2;
        node3.item = instr3;
        node4.item = instr4;

        List<AssemblyItem> items = List.of(instr1, instr2, instr3, instr4);
        List<AssemblyItem> filtered = GraphColouringRegAlloc.removeUselessItems(node1, items);

        // Since the chain's result (j) is never used, the entire chain (instr1, instr2, instr3) is removed.
        // Only the jump instruction should remain.
        assertEquals(1, filtered.size(), "Only the jump instruction should remain.");
        assertSame(instr4, filtered.get(0), "The remaining item should be the jump instruction.");
    }

    // Test 3: A live chain that should be retained.
    // Here we set up a chain:
    // instr1: a = b + c
    // instr2: d = a + e
    // instr3: branch instruction that uses d (making the chain live)
    @Test
    public void testLiveChainRetained() {
        AssemblyProgram.TextSection ts = new AssemblyProgram.TextSection();
        ControlFlowNode node1 = ControlFlowNode.create(ts);
        ControlFlowNode node2 = ControlFlowNode.create(ts);
        ControlFlowNode node3 = ControlFlowNode.create(ts);

        // Linear chain: node1 -> node2 -> node3.
        node1.successors.add(node2); node2.predecessors.add(node1);
        node2.successors.add(node3); node3.predecessors.add(node2);

        // Virtual registers.
        Register a = Register.Virtual.create();
        Register b = Register.Virtual.create();
        Register c = Register.Virtual.create();
        Register d = Register.Virtual.create();
        Register e = Register.Virtual.create();

        // instr1: a = b + c
        Instruction.TernaryArithmetic instr1 = new Instruction.TernaryArithmetic(OpCode.ADD, a, b, c);
        // instr2: d = a + e   (uses a)
        Instruction.TernaryArithmetic instr2 = new Instruction.TernaryArithmetic(OpCode.ADD, d, a, e);
        // instr3: a branch instruction that uses d (e.g. BEQ comparing d and $zero)
        Instruction.BinaryBranch instr3 = new Instruction.BinaryBranch(OpCode.BEQ, d, Register.Arch.zero, Label.get("L2"));

        node1.item = instr1;
        node2.item = instr2;
        node3.item = instr3;

        List<AssemblyItem> items = List.of(instr1, instr2, instr3);
        List<AssemblyItem> filtered = GraphColouringRegAlloc.removeUselessItems(node1, items);

        // Since d is used in the branch, instr2 is live; instr1 is live because d uses a.
        // All three instructions should be retained.
        assertEquals(3, filtered.size(), "All three instructions should be retained.");
        assertTrue(filtered.contains(instr1), "instr1 should be present.");
        assertTrue(filtered.contains(instr2), "instr2 should be present.");
        assertTrue(filtered.contains(instr3), "instr3 should be present.");
    }
}