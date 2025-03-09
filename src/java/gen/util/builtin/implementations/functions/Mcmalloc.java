package gen.util.builtin.implementations.functions;

import ast.FunDef;
import ast.PointerType;
import gen.asm.AssemblyProgram;
import gen.asm.OpCode;
import gen.asm.Register;
import gen.util.mem.StackItem;
import gen.util.mem.context.MemContext;

/**
 * Built-in implementation for mcmalloc using the sbrk system call.
 *
 * Signature: void* mcmalloc(int size)
 *
 * This implementation uses sbrk (syscall code 9) to request additional memory.
 * It performs the following steps:
 *   1. Load the requested allocation size from the function's parameter into $a0.
 *   2. Load 9 (the sbrk syscall code) into $v0.
 *   3. Invoke syscall, which returns in $v0 the previous break (the allocated memory address).
 *   4. Store the value from $v0 into the function's return value slot.
 */
public class Mcmalloc extends FunctionImplementation {

    public Mcmalloc() {
        super("mcmalloc");
    }

    @Override
    public void applyImplementation(FunDef funDef, AssemblyProgram.TextSection ts) {
        // Get the offset for the "size" parameter from the current function stack frame.
        int paramOffset = MemContext.getFuncStackFrame()
                .offsetOf(funDef.params.get(0))
                .orElseThrow(() -> new IllegalStateException("Parameter offset for size not found"));

        // Load the size argument into $a0.
        ts.emit(OpCode.LW, Register.Arch.a0, Register.Arch.fp, paramOffset);

        // Set $v0 to 9, the syscall number for sbrk.
        ts.emit(OpCode.ADDI, Register.Arch.v0, Register.Arch.zero, 9);

        // Invoke the sbrk system call.
        ts.emit(OpCode.SYSCALL);

        // The old break (i.e., the allocated memory address) is now in $v0.
        // Store it into the return value slot.
        int retOffset = MemContext.getFuncStackFrame()
                .offsetOf(StackItem.RETURN_VAL)
                .orElseThrow(() -> new IllegalStateException("Return value offset not found"));
        ts.emit(OpCode.SW, Register.Arch.v0, Register.Arch.fp, retOffset);
    }
}