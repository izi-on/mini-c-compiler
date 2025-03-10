package gen;

import ast.*;
import gen.asm.AssemblyProgram;
import gen.asm.Label;
import gen.util.emit.Emitter;
import gen.util.mem.FuncStackFrame;
import gen.util.mem.StackFrame;
import gen.util.mem.StackItem;
import gen.util.mem.StructStackFrame;
import gen.util.mem.access.AccessTypeGetter;
import gen.util.mem.struct.StructVisitor;

import java.util.*;

/**
 * This allocator deals with all global and local variable declarations.
 * It is also used by other CodeGen implementations to determine where to look for variables.
 */
public class MemAllocCodeGen extends CodeGen {

    private Optional<FuncStackFrame> currentFuncFrame = Optional.empty();
    private Map<FunDef, StackFrame> funcFrames = new HashMap<>();
    private Map<Decl, Label> globalVars = new HashMap<>();
    private Map<StrLiteral, Label> strLiterals = new HashMap<>();
    private Map<StructTypeDecl, StackFrame> structStackFrames = new HashMap<>();

    // Indicates whether we are in global context.
    boolean global = true;
    // This offset is used when allocating local variables.
    int fpOffset = 0;

    public MemAllocCodeGen(AssemblyProgram asmProg) {
        this.asmProg = asmProg;
    }

    // --- Utility Methods ---

    private void setGlobalVarLabel(Decl d, Label l) {
        globalVars.put(d, l);
    }

    private void createNewFuncFrame(FunDef fd) {
        currentFuncFrame = Optional.of(new FuncStackFrame(fd));
        funcFrames.put(fd, currentFuncFrame.get());
    }

    private StructStackFrame createNewStructFrame(StructTypeDecl std) {
        StructStackFrame structFrame = new StructStackFrame(std);
        structStackFrames.put(std, structFrame);
        return structFrame;
    }

    public Optional<StackFrame> getFrameOf(StructTypeDecl std) {
        return Optional.ofNullable(structStackFrames.get(std));
    }

    public Optional<StackFrame> getFrameOf(FunDef fd) {
        return Optional.ofNullable(funcFrames.get(fd));
    }

    public Optional<Label> getGlobalVarLabel(Decl d) {
        return Optional.ofNullable(globalVars.get(d));
    }

    public Optional<Label> getStrLiteralLabel(StrLiteral s) {
        return Optional.ofNullable(strLiterals.get(s));
    }

    public void setStrLiteralLabel(StrLiteral s, Label l) {
        strLiterals.put(s, l);
    }

    /**
     * Temporarily set context to non-global, run the given action, then restore the previous context.
     */
    private void nonGlobal(Runnable r) {
        boolean prevGlobal = this.global;
        this.global = false;
        r.run();
        this.global = prevGlobal;
    }

    /**
     * Helper for setting the access type based on a type.
     */

    // --- Main Visitor Method ---

    void visit(ASTNode n) {
        switch (n) {
            case FunDef fd -> handleFunDef(fd);
            case VarDecl vd -> handleVarDecl(vd);
            case StrLiteral str -> handleStrLiteral(str);
            case StructTypeDecl std -> handleStructTypeDecl(std);
            default -> n.children().forEach(this::visit);
        }
    }

    // --- AST Node Handlers ---

    /**
     * Processes a function definition by creating its frame,
     * setting up frame pointer, parameters, and the return address,
     * then visiting the function body.
     */
    private void handleFunDef(FunDef fd) {
        createNewFuncFrame(fd);
        FuncStackFrame frame = currentFuncFrame.get();
        int pointerSize = TypeSizeGetter.getSizeWordAlignment(new PointerType());

        // Set the old frame pointer address.
        fpOffset = -pointerSize;
        frame.setOffset(StackItem.FRAME_POINTER, fpOffset);

        // Process parameters.
        List<VarDecl> params = new ArrayList<>(fd.params);
        Collections.reverse(params);
        int offset = 0;
        frame.setOffset(StackItem.RETURN_VAL, offset);
        offset = TypeSizeGetter.getSizeWordAlignment(fd.type);
        for (VarDecl param : params) {
            frame.setOffset(param, offset);
            offset += TypeSizeGetter.getSizeWordAlignment(param.type);
        }

        // Set the return address.
        offset = -pointerSize * 2;
        frame.setOffset(StackItem.RETURN_ADDR, offset);

        // Use the return address offset as the starting point for local variables.
        fpOffset = offset;
        nonGlobal(() -> visit(fd.block));

        // Finalize the stack pointer offset after processing the function block.
        frame.setOffset(StackItem.STACK_POINTER_OFFSET, fpOffset);
    }

    /**
     * Processes a variable declaration.
     * Global variables are emitted into the data section,
     * while local variables adjust the current frame offset.
     */
    private void handleVarDecl(VarDecl vd) {
        if (global) {
            System.out.println("Allocating global variable " + vd.name);
            Label varLabel = new Emitter(asmProg.dataSection).dsEmit(vd);
            setGlobalVarLabel(vd, varLabel);
        } else {
            int size = TypeSizeGetter.getSizeWordAlignment(vd.type);
            fpOffset -= size;
            currentFuncFrame.get().setOffset(vd, fpOffset);
        }
    }

    /**
     * Processes a string literal by emitting it into the data section.
     */
    private void handleStrLiteral(StrLiteral str) {
        Label strLabel = new Emitter(asmProg.dataSection).dsEmit(str);
        setStrLiteralLabel(str, strLabel);
    }

    /**
     * Processes a struct type declaration by creating a new struct frame,
     * setting offsets for each member, and adjusting pointer access.
     */
    private void handleStructTypeDecl(StructTypeDecl std) {
        StructStackFrame structFrame = createNewStructFrame(std);
        int structAlignmentSize = TypeSizeGetter.getAlignmentSize(std);
        StructVisitor visitor = new StructVisitor() {
            int offset = 0;

            @Override
            public void visit(StructTypeDecl struct) {
                for (VarDecl vd : struct.varDecls) {
                    int requiredAlignment = TypeSizeGetter.getAlignmentSize(vd.type);
                    int padding = (offset % requiredAlignment == 0) ? 0 : (requiredAlignment - (offset % requiredAlignment));
                    structFrame.setOffset(vd, offset);
                    offset += padding + TypeSizeGetter.getSize(vd.type);
                }
                int padding = (offset % structAlignmentSize == 0) ? 0 : (structAlignmentSize - (offset % structAlignmentSize));
                structFrame.setOffset(StackItem.POINTER_OFFSET, offset + padding);
            }
        };
        visitor.visit(std);
    }
}