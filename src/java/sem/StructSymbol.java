package sem;

import ast.StructTypeDecl;

public class StructSymbol extends Symbol {
    StructTypeDecl struct;
    public StructSymbol(String name, StructTypeDecl struct) {
        super(name);
        this.struct = struct;
    }
}
