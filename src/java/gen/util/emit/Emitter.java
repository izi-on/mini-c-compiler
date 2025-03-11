package gen.util.emit;

import ast.*;
import gen.TypeSizeGetter;
import gen.asm.*;
import gen.util.mem.Aligner;
import gen.util.mem.access.AccessTypeGetter;
import gen.util.mem.access.Byte;
import gen.util.mem.access.Word;

public class Emitter {
    AssemblyProgram.TextSection ts;
    AssemblyProgram.DataSection ds;
    public Emitter(AssemblyProgram asmProg) {
        this.ts = asmProg.getCurrentTextSection();
    }

    public Emitter(AssemblyProgram.TextSection ts) {
        this.ts = ts;
    }

    public Emitter(AssemblyProgram.DataSection ds) {
        this.ds = ds;
    }

    public Label dsEmit(VarDecl vd) {
        Label label = Label.create(vd.name);
        ds.emit(label);
        switch (vd.type) {
            case BaseType bt -> {
                switch(AccessTypeGetter.fromAlignmentSize(bt)) {
                    case Byte b -> ds.emit(new Directive("word 0")); // set to be word aligned
                    case Word w -> ds.emit(new Directive("word 0"));
                    default -> throw new IllegalArgumentException("Unsupported global type: " + vd.type);
                }
            }
            case PointerType pt -> ds.emit(new Directive("word 0"));
            case ArrayType at -> {
                int spaceToAllocate = TypeSizeGetter.getSizeWordAlignment(at);
                ds.emit(new Directive("space " + spaceToAllocate));
            }
            case StructType st -> {
                int spaceToAllocate = TypeSizeGetter.getSizeWordAlignment(st);
                ds.emit(new Directive("space " + spaceToAllocate));
            }
            default -> throw new IllegalArgumentException("Unsupported type: " + vd.type);
        }
        return label;
    }

    public Label dsEmit(StrLiteral str) {
        Label label = Label.create("str");
        ds.emit(label);
        ds.emit(new Directive("asciiz " + "\"" + str.rawData + "\""));
        (new Aligner(new TypeSizeGetter())).align(str.value).ifPresent(align -> ds.emit(new Directive("align " + align)));
        return label;
    }

    public void emitSyscall(int code) {
        ts.emit(OpCode.LI, Register.Arch.v0, code);
        ts.emit(OpCode.SYSCALL);
    }

    public void emitMultiplicationByImm(Register dest, Register src, int imm) {
        Register immRegister = Register.Virtual.create();
        ts.emit(OpCode.LI, immRegister, imm);
        ts.emit(OpCode.MUL, dest, src, immRegister);
    }
}
