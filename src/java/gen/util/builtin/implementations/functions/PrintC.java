package gen.util.builtin.implementations.functions;

import ast.BaseType;
import ast.FunDef;
import gen.asm.AssemblyProgram;
import gen.asm.OpCode;
import gen.asm.Register;
import gen.util.mem.access.AccessType;
import gen.util.mem.access.AccessTypeGetter;
import gen.util.mem.access.Word;
import gen.util.mem.context.MemContext;

public class PrintC extends FunctionImplementation {
    public PrintC() {
        super("print_c");
    }

    @Override
    public void applyImplementation(FunDef funDef, AssemblyProgram.TextSection ts) {
        int paramOffset =
                MemContext.getStackFrame()
                        .offsetOf(funDef.params.get(0))
                        .orElseThrow(() -> new IllegalStateException("Parameter offset not found"));
        // Load the character parameter from memory into register $a0.
        ts.emit(OpCode.LB, Register.Arch.a0, Register.Arch.fp, paramOffset);
        // Set up the syscall code for printing a character: load 11 into $v0.
        ts.emit(OpCode.ADDI, Register.Arch.v0, Register.Arch.zero, 11);
        // Invoke the syscall.
        ts.emit(OpCode.SYSCALL);
    }
}