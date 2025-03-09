package gen.util.mem.struct;

import ast.StructTypeDecl;

public interface StructVisitor {
    void visit(StructTypeDecl structTypeDecl);
}
