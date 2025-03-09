package gen.util.builtin.implementations.functions;

import ast.FunDef;
import gen.asm.AssemblyProgram;
import gen.asm.OpCode;
import gen.asm.Register;
import gen.util.mem.context.MemContext;

public class PrintS extends FunctionImplementation {
    public PrintS() {
        super("print_s");
    }

    @Override
    public void applyImplementation(FunDef funDef, AssemblyProgram.TextSection ts) {
        int paramOffset =
                MemContext.getStackFrame()
                        .offsetOf(funDef.params.get(0))
                        .orElseThrow(() -> new IllegalStateException("Parameter offset not found"));
        // Load the string pointer (char*) from the function's stack frame into register $a0.
        ts.emit(OpCode.LW, Register.Arch.a0, Register.Arch.fp, paramOffset);
        // Set up the syscall code for printing a string (syscall 4) into register $v0.
        ts.emit(OpCode.ADDI, Register.Arch.v0, Register.Arch.zero, 4);
        // Invoke the syscall.
        ts.emit(OpCode.SYSCALL);
    }
}