package gen;

import ast.FunDef;
import ast.PointerType;
import gen.asm.*;
import gen.util.builtin.implementations.functions.*;
import gen.util.mem.context.MemContext;
import gen.util.mem.StackFrame;
import gen.util.mem.StackItem;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

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
            // Initialize loop counter in t0 to 0
            ts.emit(OpCode.LI, Register.Arch.t0, TypeSizeGetter.BYTE_SIZE);
            Label loopLabel = Label.create("clean_loop");
            Label endLabel = Label.create("clean_loop_end");
            ts.emit(loopLabel);
            // Compute target address = baseReg + t0
            ts.emit(OpCode.SUB, Register.Arch.t1, baseReg, Register.Arch.t0);
            // Clear word at that address
            ts.emit(OpCode.SB, Register.Arch.zero, Register.Arch.t1, 0);
            // Increment t0 by word size
            ts.emit(OpCode.ADDI, Register.Arch.t0, Register.Arch.t0, TypeSizeGetter.BYTE_SIZE);
            // Continue loop if t0 < frameSize
            ts.emit(OpCode.SLTI, Register.Arch.t2, Register.Arch.t0, frameSize + TypeSizeGetter.BYTE_SIZE);
            ts.emit(OpCode.BNE, Register.Arch.t2, Register.Arch.zero, loopLabel);
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
        FunctionAction actions = new AggregateFunctionAction(cleanStack, saveAndSetFramePointer, saveReturnAddr, reserveStackFrameSpace);

        System.out.println("For func: " + fd.name + " the frame pointer size is: " + funcFrame.get().offsetOf(StackItem.STACK_POINTER_OFFSET).orElseThrow());

        label.applyPrologue();
        actions.applyPrologue();

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
        label.applyEpilogue(); // again, separately because the epilogue needs to run when the function exits
        actions.applyEpilogue();
        ts.emit(OpCode.JR, Register.Arch.ra); // return from function
    }
}



