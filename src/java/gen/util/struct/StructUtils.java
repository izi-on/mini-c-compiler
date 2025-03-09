package gen.util.struct;

import ast.Decl;
import ast.StructType;

import java.util.Optional;

public class StructUtils {
    public static Optional<Decl> getDeclOfField(StructType strctType, String field) {
        // get the decl assiocated with the field name
        Decl fieldDecl = null;
        for (Decl decl: strctType.structTypeDecl.varDecls) {
            if (decl.name.equals(field))
                fieldDecl = decl;
        }
        return Optional.ofNullable(fieldDecl);
    }
}
