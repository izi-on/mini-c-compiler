package gen;

import ast.ASTNode;
import ast.*;
import gen.util.mem.StackItem;
import gen.util.mem.context.MemContext;
import gen.util.rules.PassByRef;

public class TypeSizeGetter {
    public static final int WORD_SIZE = 4;
    public static final int BYTE_SIZE = 1;

    // gets the size of the base type
    @FunctionalInterface
    interface BaseSizeDefiner {
        int getSize(ASTNode type);
    }


    //get the size of a type WITHOUT alignment
    public static int baseSize(ASTNode type) {
        return switch (type) {
            case PointerType p -> WORD_SIZE;
            case BaseType b ->
                switch (b) {
                    case INT -> WORD_SIZE;
                    case CHAR -> BYTE_SIZE;
                    case VOID -> 0;
                    case UNKNOWN -> 0;
                    case NONE -> 0;
                };
            default -> {
                throw new RuntimeException("Unknown type: " + type);
            }
        };
    }

    // default size getter
    public static int getSize(ASTNode type) {
        return getSize(type, TypeSizeGetter::baseSize);
    }

    public static int getSizeWordAlignment(ASTNode type) {
        int size = getSize(type);
        int alignment = (size % TypeSizeGetter.WORD_SIZE != 0) ? TypeSizeGetter.WORD_SIZE - (size % TypeSizeGetter.WORD_SIZE) : 0;
        return size + alignment;
    }

    public static int getSizeWordAlignmentForFunc(Type type) {
        if (PassByRef.ifIs(type).getTruth()) {
            return getSizeWordAlignment(new PointerType());
        }
        return getSizeWordAlignment(type);
    }

    static int getSize(ASTNode type, BaseSizeDefiner baseSizeGetter) {
        return switch (type) {
            case ArrayType a -> getSize(a.arrayedType, baseSizeGetter) * a.size;
            case StructType st -> getSize(st.structTypeDecl, baseSizeGetter);
            case StructTypeDecl std -> MemContext.getAllocator().getFrameOf(std).orElseThrow().offsetOf(StackItem.POINTER_OFFSET).orElseThrow();
            default -> baseSizeGetter.getSize(type);
        };
    }

    public static int getAlignmentSize(ASTNode type) {
        return getAlignmentSize(type, TypeSizeGetter::baseSize);
    }

    public static int getAlignmentSize(ASTNode type, BaseSizeDefiner g) {
        int alignmentSize =  switch (type) {
            case StructTypeDecl structTypeDecl -> structTypeDecl.varDecls.stream().mapToInt(vdcl -> getAlignmentSize(vdcl.type, g)).max().orElse(0);
            case StructType st -> getAlignmentSize(st.structTypeDecl, g);
            case ArrayType a -> getAlignmentSize(a.arrayedType, g);
            default -> g.getSize(type);
        };
        return alignmentSize;
    }

}
