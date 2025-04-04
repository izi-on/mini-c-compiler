package regalloc;

import gen.asm.*;
import org.junit.jupiter.api.Test;
import regalloc.GraphColouringRegAlloc;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.fail;

public class UnreachableCodeRegAllocTest {

    @Test
    void testUnreachableCodeDoesNotCrashAllocator() {
        AssemblyProgram program = new AssemblyProgram();
        AssemblyProgram.Section dataSection = program.dataSection; // Get default data section
        AssemblyProgram.TextSection textSection = program.emitNewTextSection();

        // Basic function setup
        Label mainLabel = Label.create("main");
        Label endLabel = Label.create("func_end");
        textSection.emit(mainLabel);
        // Maybe some setup if needed, but keep it minimal

        // An instruction before the jump (optional)
        Register vr1 = Register.Virtual.create();
        textSection.emit(OpCode.LI, vr1, 10); // Load immediate 10 into vr1

        // --- The crucial part ---
        // Unconditional jump, skipping the next instruction
        textSection.emit(new Instruction.Jump(OpCode.J, endLabel));

        // *** Unreachable Instruction ***
        // This instruction should be skipped by the jump above.
        // If the allocator doesn't handle unreachable code properly before coloring,
        // these virtual registers might not get colored.
        Register vrUnreachableDef = Register.Virtual.create();
        Register vrUnreachableUse1 = Register.Virtual.create();
        Register vrUnreachableUse2 = Register.Virtual.create();
        // Make sure these registers are unique and potentially only used here.
        textSection.emit(
                new Instruction.TernaryArithmetic(OpCode.ADD, vrUnreachableDef, vrUnreachableUse1, vrUnreachableUse2)
        );
        // Add a comment to make it clear in the output assembly if needed
        textSection.emit(new Comment("^^^ This ADD instruction should be unreachable"));
        // --- End crucial part ---

        // Target of the jump
        textSection.emit(endLabel);

        // Basic function epilogue (e.g., return 0)
        textSection.emit(OpCode.LI, Register.Arch.v0, 0); // Return 0
        textSection.emit(OpCode.JR, Register.Arch.ra);   // Jump back to caller

        // Instantiate the allocator
        GraphColouringRegAlloc allocator = GraphColouringRegAlloc.INSTANCE;

        // Apply the allocator
        // If the hypothesis is correct and the implementation doesn't handle
        // unreachable code before final emission, this call might throw an exception
        // (likely NullPointerException or IndexOutOfBoundsException) when processing
        // the unreachable instruction's virtual registers.
        System.out.println("--- Running Allocator on Unreachable Code Test ---");
        assertDoesNotThrow(() -> {
            AssemblyProgram allocatedProgram = allocator.apply(program);
            // Optional: You could add further checks on the allocatedProgram's content
            // if needed, but the main test here is survival.
            System.out.println("--- Allocator Completed Successfully ---");
            // You might want to print allocatedProgram for manual inspection
            // allocatedProgram.print(System.out);
        }, "GraphColouringRegAlloc failed when processing unreachable code.");

        System.out.println("--- Test Completed ---");
    }
}