package sem;

import ast.Type;

public class StructTypeSymbol extends TypeSymbol {
    public Scope declScope;
    public StructTypeSymbol(String name, Type type, Scope scope) {
        super(StructTypeSymbol.prefix() + name, type);
        this.declScope = scope;
    }
    static public String prefix() {
        return "struct%"; //space is important
    }
}
