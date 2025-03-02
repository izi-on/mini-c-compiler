package gen;

import ast.*;
import gen.asm.AssemblyProgram;
import gen.asm.Label;
import gen.util.mem.FuncStackFrame;
import gen.util.mem.StackFrame;
import gen.util.mem.StackItem;

import java.util.*;

/* This allocator should deal with all global and local variable declarations.
It is also used by other CodeGen implementations to determine where to look for variables.
* */

public class MemAllocCodeGen extends CodeGen {

    private Optional<FuncStackFrame> currentFuncFrame = Optional.empty();
    Map<FunDef, StackFrame> funcFrames = new HashMap<>();
    Map<Decl, Label> globalVars = new HashMap<>();

    private void setGlobalVarLabel(Decl d, Label l) {
        globalVars.put(d, l);
    }

    private void createNewFuncFrame(FunDef fd) {
        currentFuncFrame = Optional.of(new FuncStackFrame(fd));
        funcFrames.put(fd, currentFuncFrame.get());
    }

    public Optional<StackFrame> getFrameOf(FunDef fd) {
        return Optional.ofNullable(funcFrames.get(fd));
    }
    public Optional<Label> getGlobalVarLabel(Decl d) {
        return Optional.ofNullable(globalVars.get(d));
    }

    private void nonGlobal(Runnable r) {
        boolean prevGlobal = this.global;
        this.global = false;
        r.run();
        this.global = prevGlobal;
    }

    public MemAllocCodeGen(AssemblyProgram asmProg) {
        this.asmProg = asmProg;
    }

    boolean global = true;
    int fpOffset = 0;

    void visit(ASTNode n) {
        // To complete

        // guaranteed non-global variable declarations inside
        nonGlobal(() -> {
            switch(n) {
                case FunDef fd -> {
                    createNewFuncFrame(fd);

                    // handle old frame pointer addr
                    fpOffset = -4;
                    currentFuncFrame.get().setOffset(StackItem.FRAME_POINTER, fpOffset);

                    // handle params
                    List<VarDecl> params = new ArrayList<>(fd.params);
                    Collections.reverse(params);
                    fpOffset = 0;
                    currentFuncFrame.get().setOffset(StackItem.RETURN_VAL, fpOffset);
                    fpOffset = TypeSizeGetter.getSize(fd.type); // return type because the caller saved as such
                    for (VarDecl vd : params) {
                        currentFuncFrame.get().setOffset(vd, fpOffset);
                        fpOffset += TypeSizeGetter.getSize(vd.type); // increment by size of type
                    }

                    // handle return addr
                    fpOffset = -8;
                    currentFuncFrame.get().setOffset(StackItem.RETURN_ADDR, fpOffset);

                    visit(fd.block);

                    // after done visiting, set the stack offset to the current frame pointer offset
                    currentFuncFrame.get().setOffset(StackItem.STACK_POINTER_OFFSET, fpOffset);
                }

                default -> {n.children().forEach(this::visit);}
            }
        });

        // might be global, might be local
        switch(n) {
            case VarDecl vd -> {
                if (global) {
                    Label varLabel = asmProg.dataSection.emit(vd);
                    setGlobalVarLabel(vd, varLabel);
                } else {
                    fpOffset -= TypeSizeGetter.getSize(vd.type); // offset by size of type
                    currentFuncFrame.get().setOffset(vd, fpOffset);
                }
            }
            default -> {n.children().forEach(this::visit);}
        }

    }

}
