package gen;

import ast.ClassDecl;
import ast.FunDef;
import ast.Program;
import gen.asm.*;
import gen.util.builtin.implementations.functions.AggregateFunctionImplementations;
import gen.util.emit.Emitter;
import gen.util.mem.context.MemContext;

/**
 * This visitor should produce a program.
 */
public class ProgramCodeGen extends CodeGen {

    public ProgramCodeGen(AssemblyProgram asmProg) {
        this.asmProg = asmProg;
    }

    public void generate(Program p) {
        // create virtual tables for each method in each class
        MemContext.setVirtualMaps(new ClassVirtualTableGetter().visit(p));

        // allocate all variables
        MemAllocCodeGen allocator = MemContext.newAllocator(asmProg);
        allocator.visit(p); // will also hold information for offsets of declarations

        // create the entry point for the MIPS execution
        AssemblyProgram.TextSection ts = asmProg.emitNewTextSection();
        ts.emit(OpCode.ADDIU, Register.Arch.sp, Register.Arch.sp, -4); // make space for return value
        ts.emit(OpCode.JAL, Label.get("main"));
        new Emitter(ts).emitSyscall(10);

        // generate the code for each function
        p.decls.forEach((d) -> {
            switch(d) {
                case FunDef fd -> {
                    AggregateFunctionImplementations builtInFunctions;
                    FunCodeGen fcg = new FunCodeGen(asmProg);
                    fcg.visit(fd);
                }
                case ClassDecl cd -> {
                }
                default -> {}// nothing to do
            }});

    }
}
