package gen.util.value_holder;

import ast.*;
import gen.TypeSizeGetter;
import gen.asm.AssemblyProgram;
import gen.asm.Label;
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
            AssemblyProgram.TextSection ts = asmProg.getCurrentTextSection();
            ts.emit("");  // empty line for readability
            ts.emit("Loading from " + srcAddr + " from stack into " + targetAddr);

            int size = TypeSizeGetter.getSize(nodeType); // total number of bytes to copy

            // Allocate registers for:
            // total size, loop counter, temporary registers for computing source and target addresses, and for the byte value.
            Register totalReg   = Register.Virtual.create(); // will hold the constant size
            Register counterReg = Register.Virtual.create(); // loop counter i
            Register srcTmp     = Register.Virtual.create(); // temporary to compute (srcAddr + i)
            Register targetTmp  = Register.Virtual.create(); // temporary to compute (targetAddr + i)
            Register byteReg    = Register.Virtual.create(); // register to hold the loaded byte

            // Create unique labels for the loop start and exit.
            Label loopLabel = Label.create("mem_copy_loop");
            Label endLabel  = Label.create("mem_copy_end");

            // Initialize total size and loop counter.
            ts.emit(OpCode.LI, totalReg, size);       // totalReg = size
            ts.emit(OpCode.LI, counterReg, 0);          // counterReg = 0

            // Emit the loop label.
            ts.emit(loopLabel);

            // If counterReg equals totalReg then branch to endLabel.
            ts.emit(OpCode.BEQ, counterReg, totalReg, endLabel);

            // Compute source address: srcTmp = srcAddr + counterReg.
            ts.emit(OpCode.ADD, srcTmp, srcAddr, counterReg);
            // Load one byte from memory at srcTmp into byteReg.
            ts.emit(OpCode.LB, byteReg, srcTmp, 0);

            // Compute target address: targetTmp = targetAddr + counterReg.
            ts.emit(OpCode.ADD, targetTmp, targetAddr, counterReg);
            // Store the byte from byteReg into memory at targetTmp.
            ts.emit(OpCode.SB, byteReg, targetTmp, 0);

            // Increment the loop counter by 1.
            ts.emit(OpCode.ADDI, counterReg, counterReg, 1);
            // Jump back to the start of the loop.
            ts.emit(OpCode.J, loopLabel);

            // Emit the loop exit label.
            ts.emit(endLabel);
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
