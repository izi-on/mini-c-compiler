package gen.util.builtin.implementations.functions;

import ast.FunDef;
import gen.asm.AssemblyProgram;
import gen.asm.OpCode;
import gen.asm.Register;
import gen.util.mem.StackItem;
import gen.util.mem.context.MemContext;

public class ReadC extends FunctionImplementation {
    public ReadC() {
        super("read_c");
    }

    @Override
    public void applyImplementation(FunDef funDef, AssemblyProgram.TextSection ts) {
        // Set up syscall code for reading a character (code 12)
        ts.emit(OpCode.ADDI, Register.Arch.v0, Register.Arch.zero, 12);
        ts.emit(OpCode.SYSCALL);
        // The character read is now in $v0.
        // Store the result into the return value slot.
        int retOffset = MemContext.getStackFrame()
                .offsetOf(StackItem.RETURN_VAL)
                .orElseThrow(() -> new IllegalStateException("Return value offset not found"));
        ts.emit(OpCode.SW, Register.Arch.v0, Register.Arch.fp, retOffset);
    }
}