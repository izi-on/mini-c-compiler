package gen.util.value_holder;

import ast.*;
import gen.TypeSizeGetter;
import gen.asm.AssemblyProgram;
import gen.asm.OpCode;
import gen.asm.Register;
import gen.util.mem.access.AccessTypeGetter;
import gen.util.rules.PassByRef;

import java.util.Optional;

public abstract class ValueHolder {
    Register targetAddr;
    Type nodeType;
    AssemblyProgram asmProg;
    protected ValueHolder(AssemblyProgram asmProg, Type nodeType) {
        this.asmProg = asmProg;
        this.nodeType = nodeType;
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

    public Register getSrcAddr() {
        throw new IllegalCallerException("Value on register cannot point to an address");
    }

    public static class OnRegister extends ValueHolder {
        Register regVal;

        public OnRegister(AssemblyProgram asmProg, Expr node, Register regVal) {
            super(asmProg, node.type);
            this.regVal = regVal;
        }

        public OnRegister(AssemblyProgram asmProg, Type nodeType, Register regVal) {
            super(asmProg, nodeType);
            this.regVal = regVal;
        }

        @Override
        public void loadToTargetAddr() {
            System.out.println("Loading from reg of type " + nodeType + " of access type " + AccessTypeGetter.fromAlignmentSize(nodeType).Save());
            AssemblyProgram.TextSection ts = asmProg.getCurrentTextSection();
            ts.emit("Loading from " + regVal + " from reg into " + targetAddr);
            ts.emit(AccessTypeGetter.fromAlignmentSize(nodeType).Save(), regVal, targetAddr, 0);
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
            super(asmProg, node.type);
            this.srcAddr = srcAddr;
        }

        public OnMemoryAddr(AssemblyProgram asmProg, Type nodeType, Register srcAddr) {
            super(asmProg, nodeType);
            this.srcAddr = srcAddr;
        }

        @Override
        public void loadToTargetAddr() {
            System.out.println("Loading from mem to target addr type: " + nodeType + " of size " + TypeSizeGetter.getSize(nodeType));
            AssemblyProgram.TextSection ts = asmProg.getCurrentTextSection();
            ts.emit("");
            ts.emit("Loading from " + srcAddr + " from stack into " + targetAddr);
            Register r = Register.Virtual.create();
            for (int i = 0; i < TypeSizeGetter.getSize(nodeType); i++) { // TODO: use an emitted loop instead
                ts.emit(OpCode.LB, r, srcAddr, i);
                ts.emit(OpCode.SB, r, targetAddr, i);
            }
            ts.emit("");
        }

        @Override
        public Register getValRegister() {
            // honestly just prevent a giant headache with this:
            if (nodeType instanceof StructType) {
                throw new IllegalStateException("We are trying to fit a struct into a register");
            }

            AssemblyProgram.TextSection ts = asmProg.getCurrentTextSection();
            Register r = Register.Virtual.create();
            ts.emit(AccessTypeGetter.fromAlignmentSize(nodeType).Load(), r, srcAddr, 0);
            return r;
        }

        @Override
        public Register getSrcAddr() {
            return srcAddr;
        }
    }

}
