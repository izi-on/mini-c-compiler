package gen.util.mem;

import ast.StructTypeDecl;

public class StructStackFrame extends StackFrame {
    StructTypeDecl structTypeDecl;
    public StructStackFrame(StructTypeDecl structTypeDecl) {
        super();
        this.structTypeDecl = structTypeDecl;
    }
}
