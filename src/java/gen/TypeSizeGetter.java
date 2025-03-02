package gen;

import ast.ASTNode;
import ast.*;

public class TypeSizeGetter {
    public static int getSize(ASTNode type) {
        return switch (type) {
            case PointerType p -> 4;
            case IntLiteral i -> 4;
            case ChrLiteral c -> 4; // have a word for each character
            case StrLiteral s -> 4 * s.value.length(); // have a word for each character and a word for the null terminator
            case ArrayType a -> getSize(a.arrayedType) * a.size;
            case BaseType b -> 4;
//            case StructType s -> s.fields.stream().mapToInt(this::getSize).sum(); TODO handle structs somehow idek
            default -> {
                throw new RuntimeException("Unknown type");
            }
        };
    }
}
