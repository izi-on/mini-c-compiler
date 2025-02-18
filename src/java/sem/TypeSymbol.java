package sem;

import ast.Type;

public class TypeSymbol extends Symbol {
    public Type type;
    public TypeSymbol() {} // for error reporting purposes
    public TypeSymbol(String name, Type type) {
        super(name);
        this.type = type;
    }
    static public String prefix() {
        return "";
    }
}
