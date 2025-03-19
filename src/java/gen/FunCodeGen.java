package gen;

import ast.FunDef;
import ast.PointerType;
import gen.asm.*;
import gen.util.builtin.implementations.functions.*;
import gen.util.mem.context.MemContext;
import gen.util.mem.StackFrame;
import gen.util.mem.StackItem;

import java.util.*;

/**
 * A visitor that produces code for a single function declaration
 */
public class FunCodeGen extends CodeGen {

    interface FunctionAction {
        void applyPrologue();
        void applyEpilogue();
    }

    static private final AggregateFunctionImplementations builtInFunctions;

    static {
        // register built-in functions
        builtInFunctions = new AggregateFunctionImplementations(List.of(
                new PrintI(),
                new PrintC(),
                new PrintS(),
                new ReadI(),
                new ReadC(),
                new Mcmalloc()
        ));
    }

    class CleanLocalStack implements FunctionAction {

        AssemblyProgram.TextSection ts;
        int frameSize;
        final int wordSize = 4;
        // The base register from which to compute the addresses to clean.
        Register baseReg;

        // In this early cleaning, we clean the entire allocated frame.
        CleanLocalStack(AssemblyProgram.TextSection ts, int frameSize, Register baseReg) {
            this.ts = ts;
            this.frameSize = frameSize;
            this.baseReg = baseReg;
        }

        @Override
        public void applyPrologue() {
            ts.emit("Clearing entire allocated stack frame of size " + frameSize);

            // Create virtual registers to hold temporary values.
            Register loopCounter = Register.Virtual.create();
            Register tempAddr    = Register.Virtual.create();
            Register cmpReg      = Register.Virtual.create();

            // Initialize the loop counter to the byte size.
            ts.emit(OpCode.LI, loopCounter, TypeSizeGetter.BYTE_SIZE);
            Label loopLabel = Label.create("clean_loop");
            Label endLabel  = Label.create("clean_loop_end");

            ts.emit(loopLabel);
            // Compute target address = baseReg - loopCounter
            ts.emit(OpCode.SUB, tempAddr, baseReg, loopCounter);
            // Clear the byte at that address: store zero (we can still use the architectural zero register)
            ts.emit(OpCode.SB, Register.Arch.zero, tempAddr, 0);
            // Increment loopCounter by one byte.
            ts.emit(OpCode.ADDI, loopCounter, loopCounter, TypeSizeGetter.BYTE_SIZE);
            // Compare: set cmpReg to 1 if loopCounter < (frameSize + BYTE_SIZE)
            ts.emit(OpCode.SLTI, cmpReg, loopCounter, frameSize + TypeSizeGetter.BYTE_SIZE);
            // If cmpReg != 0, branch back to the loop label.
            ts.emit(OpCode.BNE, cmpReg, Register.Arch.zero, loopLabel);
            ts.emit(endLabel);
        }
        @Override
        public void applyEpilogue() {
            // No cleanup needed during epilogue.
        }
    }

    class FramePointer implements FunctionAction {

        AssemblyProgram.TextSection ts;
        int offset;
        FramePointer(AssemblyProgram.TextSection ts, int offset) {
            this.ts = ts;
            this.offset = offset;
        }

        @Override
        public void applyPrologue() {
            ts.emit(OpCode.ADDIU, Register.Arch.sp, Register.Arch.sp, offset);
            ts.emit(OpCode.SW, Register.Arch.fp, Register.Arch.sp, 0);
            ts.emit(OpCode.ADDIU, Register.Arch.fp, Register.Arch.sp, -offset);
        }

        @Override
        public void applyEpilogue() {
            ts.emit(OpCode.LW, Register.Arch.fp, Register.Arch.fp, offset);
        }
    }

    class ReturnAddr implements FunctionAction {

        AssemblyProgram.TextSection ts;
        int offset;
        ReturnAddr(AssemblyProgram.TextSection ts, int offset) {
            this.ts = ts;
            this.offset = offset;
        }

        @Override
        public void applyPrologue() {
            ts.emit(OpCode.SW, Register.Arch.ra, Register.Arch.fp, offset);
        }

        @Override
        public void applyEpilogue() {
            ts.emit(OpCode.LW, Register.Arch.ra, Register.Arch.fp, offset);
        }
    }

    class StackMove implements FunctionAction {

        AssemblyProgram.TextSection ts;
        int offset;
        StackMove(AssemblyProgram.TextSection ts, int offset) {
            this.ts = ts;
            this.offset = offset;
        }

        @Override
        public void applyPrologue() {
            ts.emit(OpCode.ADDIU, Register.Arch.sp, Register.Arch.fp, offset);
        }

        @Override
        public void applyEpilogue() {
            ts.emit(OpCode.ADDIU, Register.Arch.sp, Register.Arch.fp, 0);
        }
    }

    class AggregateFunctionAction implements FunctionAction {

        List<FunctionAction> actions;
        AggregateFunctionAction(FunctionAction... actions) {
            this.actions = List.of(actions);
        }

        @Override
        public void applyPrologue() {
            for (FunctionAction action : actions) {
                action.applyPrologue();
            }
        }

        @Override
        public void applyEpilogue() {
            List<FunctionAction> actions = new ArrayList<>(this.actions);
            Collections.reverse(actions);
            for (FunctionAction action : actions) {
                action.applyEpilogue();
            }
        }
    }

    class FunctionLabel implements FunctionAction {

        AssemblyProgram.TextSection ts;
        String name;
        FunctionLabel(AssemblyProgram.TextSection ts, String name) {
            this.ts = ts;
            this.name = name;
        }

        @Override
        public void applyPrologue() {
            ts.emit(Label.get(name));
        }

        @Override
        public void applyEpilogue() {
            ts.emit(Label.get(functionEndLabel(name)));
        }
    }

    class SaveVirtualRegisters implements FunctionAction {

        AssemblyProgram.TextSection ts;
        SaveVirtualRegisters(AssemblyProgram.TextSection ts) {
            this.ts = ts;
        }
        @Override
        public void applyPrologue() {
            ts.emit(OpCode.PUSH_REGISTERS);
        }

        @Override
        public void applyEpilogue() {
            ts.emit(OpCode.POP_REGISTERS);
        }
    }

    class RememberStackPointer implements FunctionAction {

        AssemblyProgram.TextSection ts;
        Register trackCurOffset;
        RememberStackPointer(AssemblyProgram.TextSection ts) {
            this.ts = ts;
            trackCurOffset = Register.Virtual.create();
        }
        @Override
        public void applyPrologue() {
            ts.emit(OpCode.ADDI, trackCurOffset, Register.Arch.sp, 0);
        }

        @Override
        public void applyEpilogue() {
            ts.emit(OpCode.ADDI, Register.Arch.sp, trackCurOffset, 0);
        }
    }

    public static String functionEndLabel(String name) {
        return name + "END";
    }

    public FunCodeGen(AssemblyProgram asmProg) {
        this.asmProg = asmProg;
    }



    void visit(FunDef fd) {
        // Each function should be produced in its own section.
        // This is necessary for the register allocator.
        MemAllocCodeGen allocator = MemContext.getAllocator(); // get memory allocation context

        AssemblyProgram.TextSection ts = asmProg.emitNewTextSection();

        Optional<StackFrame> funcFrame = allocator.getFrameOf(fd);
        if (funcFrame.isEmpty()) {
            throw new IllegalStateException("No stack frame found for function " + fd.name);
        }

        FunctionAction label = new FunctionLabel(ts, fd.name); // have the label separately because the order for epilogue is not reversed
        // 1) create function actions for prologue and epilogue
        FunctionAction cleanStack = new CleanLocalStack(
                ts,
                Math.abs(funcFrame.get().offsetOf(StackItem.STACK_POINTER_OFFSET).orElseThrow()),
                Register.Arch.sp
            );
        FunctionAction saveAndSetFramePointer = new FramePointer(ts, funcFrame.get().offsetOf(StackItem.FRAME_POINTER).orElseThrow());
        FunctionAction saveReturnAddr = new ReturnAddr(ts, funcFrame.get().offsetOf(StackItem.RETURN_ADDR).orElseThrow());
        FunctionAction reserveStackFrameSpace = new StackMove(ts, funcFrame.get().offsetOf(StackItem.STACK_POINTER_OFFSET).orElseThrow());
        FunctionAction saveVirtualRegisters = new SaveVirtualRegisters(ts);
        FunctionAction rememberStackPtr = new RememberStackPointer(ts);
        FunctionAction actions = new AggregateFunctionAction(cleanStack, saveAndSetFramePointer, saveReturnAddr, reserveStackFrameSpace, saveVirtualRegisters, rememberStackPtr);

        ts.emit("BEGIN PROLOGUE");
        label.applyPrologue();
        actions.applyPrologue();
        ts.emit("END PROLOGUE");

        // 2) emit the body of the function
        MemContext.withStackFrame(funcFrame.get(), () -> {
            if (fd.isBuiltin && builtInFunctions.hasImplementationFor(fd)) { // check from frontend and backend
                builtInFunctions.applyImplementation(fd, ts);
            } else {
                StmtCodeGen scd = new StmtCodeGen(asmProg);
                scd.visit(fd.block);
            }
        });

        // 3) emit the epilogue
        ts.emit("BEGIN EPILOGUE");
        label.applyEpilogue(); // again, separately because the epilogue needs to run when the function exits
        actions.applyEpilogue();
        ts.emit("END EPILOGUE");
        ts.emit(OpCode.JR, Register.Arch.ra); // return from function
    }
}



