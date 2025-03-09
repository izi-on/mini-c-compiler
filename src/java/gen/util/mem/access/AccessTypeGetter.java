package gen.util.mem.access;

import ast.ASTNode;
import ast.Decl;
import gen.TypeSizeGetter;
import gen.util.mem.StackItem;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

public class AccessTypeGetter {
    public static Map<Decl, AccessType> accessTypes = new HashMap<>();
    public static Map<StackItem, AccessType> stackItemAccessTypes = new HashMap<>();

    public static Optional<AccessType> getAccessType(Decl decl) {
        return Optional.ofNullable(accessTypes.get(decl));
    }

    public static Optional<AccessType> getAccessType(StackItem item) {
        return Optional.ofNullable(stackItemAccessTypes.get(item));
    }
    public static void setAccessType(Decl decl, AccessType accessType) {
        accessTypes.put(decl, accessType);
    }
    public static void setAccessType(StackItem item, AccessType accessType) {
        stackItemAccessTypes.put(item, accessType);
    }

    public static AccessType fromAlignmentSize(int alignmentSize) {
        switch (alignmentSize) {
            case TypeSizeGetter.BYTE_SIZE:
                return new Byte();
            case TypeSizeGetter.WORD_SIZE:
                return new Word();
            default:
                throw new IllegalArgumentException("Invalid alignment size: " + alignmentSize);
        }
    }

    public static AccessType fromAlignmentSize(ASTNode type) {
        int alignmentSize = TypeSizeGetter.getAlignmentSize(type);
        return fromAlignmentSize(alignmentSize);
    }
}
