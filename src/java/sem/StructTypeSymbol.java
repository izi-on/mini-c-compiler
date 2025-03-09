package sem;

import ast.StructTypeDecl;
import ast.Type;

public class StructTypeSymbol extends TypeSymbol {
    public Scope declScope;
    public StructTypeDecl stdcl;
    public StructTypeSymbol(StructTypeDecl stdcl, Type type, Scope scope) {
        super(StructTypeSymbol.prefix() + stdcl.name, type);
        this.declScope = scope;
        this.stdcl = stdcl;
    }
    static public String prefix() {
        return "struct%"; //space is important
    }
}
