package gen.util.value_holder;

import ast.Expr;
import ast.StructType;
import gen.TypeSizeGetter;
import gen.asm.AssemblyProgram;
import gen.asm.OpCode;
import gen.asm.Register;
import gen.util.mem.access.AccessType;
import gen.util.mem.access.AccessTypeGetter;

public abstract class ValueHolder {
    Register targetAddr;
    Expr node;
    AssemblyProgram asmProg;
    protected ValueHolder(AssemblyProgram asmProg, Expr node) {
        this.asmProg = asmProg;
        this.node = node;
    }
    public ValueHolder setTargetAddr(Register addr) {
        this.targetAddr = addr;
        return this;
    }

    abstract public void loadToTargetAddr();

    /**
     This returns the value contained in a register if the class supports it
     */
    public abstract Register getValRegister();

    public static class OnRegister extends ValueHolder {
        Register regVal;

        public OnRegister(AssemblyProgram asmProg, Expr node, Register regVal) {
            super(asmProg, node);
            this.regVal = regVal;
        }

        @Override
        public void loadToTargetAddr() {
            System.out.println("Loading from reg of type " + node.type + " of access type " + AccessTypeGetter.fromAlignmentSize(node.type).Save());
            AssemblyProgram.TextSection ts = asmProg.getCurrentTextSection();
            ts.emit("Loading from " + regVal + " from reg into " + targetAddr);
            ts.emit(AccessTypeGetter.fromAlignmentSize(node.type).Save(), regVal, targetAddr, 0);
        }

        @Override
        public Register getValRegister() {
            return regVal;
        }
    }


    // values that can be held in a memory address
    public static class OnMemoryAddr extends ValueHolder {

        Register srcAddr;

        public OnMemoryAddr(AssemblyProgram asmProg, Expr node, Register srcAddr) {
            super(asmProg, node);
            this.srcAddr = srcAddr;
        }

        @Override
        public void loadToTargetAddr() {
            System.out.println("Loading from mem to target addr type: " + node.type + " of size " + TypeSizeGetter.getSize(node.type));
            AssemblyProgram.TextSection ts = asmProg.getCurrentTextSection();
            ts.emit("");
            ts.emit("Loading from " + srcAddr + " from stack into " + targetAddr);
            for (int i = 0; i < TypeSizeGetter.getSize(node.type); i++) { // TODO: use an emitted loop instead
                Register r = Register.Virtual.create();
                ts.emit(OpCode.LB, r, srcAddr, i);
                ts.emit(OpCode.SB, r, targetAddr, i);
            }
            ts.emit("");
        }

        @Override
        public Register getValRegister() {
            // honestly just prevent a giant headache with this:
            if (node.type instanceof StructType) {
                throw new IllegalStateException("We are trying to fit a struct into a register");
            }

            AssemblyProgram.TextSection ts = asmProg.getCurrentTextSection();
            Register r = Register.Virtual.create();
            ts.emit(AccessTypeGetter.fromAlignmentSize(node.type).Load(), r, srcAddr, 0);
            return r;
        }
    }

}
