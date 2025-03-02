package gen.util.builtin.implementations.functions;

import ast.FunDef;
import gen.asm.AssemblyProgram;
import gen.asm.OpCode;
import gen.asm.Register;
import gen.util.context.MemContext;

public class PrintI extends FunctionImplementation {
    public PrintI() {
        super("print_i");
    }

    @Override
    public void applyImplementation(FunDef funDef, AssemblyProgram.TextSection ts) {
        int paramOffset =
                MemContext.getStackFrame()
                        .offsetOf(funDef.params.get(0))
                        .orElseThrow(() -> new IllegalStateException("Parameter offset not found"));
        // Load the integer parameter from memory into register $a0.
        ts.emit(OpCode.LW, Register.Arch.a0, Register.Arch.fp, paramOffset);
        // Set up the syscall code for print integer: load 1 into $v0.
        ts.emit(OpCode.ADDI, Register.Arch.v0, Register.Arch.zero, 1);
        // Invoke the syscall.
        ts.emit(OpCode.SYSCALL);
    }
}
