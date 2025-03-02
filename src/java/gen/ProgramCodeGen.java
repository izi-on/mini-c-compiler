package gen;

import ast.FunDef;
import ast.Program;
import gen.asm.*;
import gen.util.builtin.implementations.functions.AggregateFunctionImplementations;
import gen.util.context.MemContext;

/**
 * This visitor should produce a program.
 */
public class ProgramCodeGen extends CodeGen {

    public ProgramCodeGen(AssemblyProgram asmProg) {
        this.asmProg = asmProg;
    }

    void generate(Program p) {
        // allocate all variables
        MemAllocCodeGen allocator = new MemAllocCodeGen(asmProg);
        allocator.visit(p); // will also hold information for offsets of declarations
        MemContext.setAllocator(allocator); // set the memory allocation context for visitors to use to determine offsets for variable access

        // create the entry point for the MIPS execution
        AssemblyProgram.TextSection ts = asmProg.emitNewTextSection();
        ts.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, -4); // make space for return value
        ts.emit(OpCode.JAL, Label.get("main"));
        ts.emitSyscall(10);

        // generate the code for each function
        p.decls.forEach((d) -> {
            switch(d) {
                case FunDef fd -> {
                    AggregateFunctionImplementations builtInFunctions;
                    FunCodeGen fcg = new FunCodeGen(asmProg);
                    fcg.visit(fd);
                }
                default -> {}// nothing to do
            }});

    }
}
