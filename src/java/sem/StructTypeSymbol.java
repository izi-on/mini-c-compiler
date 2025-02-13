package sem;

import ast.Type;

public class StructTypeSymbol extends TypeSymbol {
    public Scope declScope;
    public StructTypeSymbol(String name, Type type, Scope scope) {
        super(name, type);
        this.declScope = scope;
    }
}
