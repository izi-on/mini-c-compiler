package sem;

import ast.ClassType;

public class ClassTypeSymbol extends Symbol {
    ClassType classType;
    Scope classScope;
    public ClassTypeSymbol() {} // for error reporting purposes
    public ClassTypeSymbol(String name, ClassType classType, Scope classScope) {
        super(prefix() + name);
        this.classType = classType;
        this.classScope = classScope;
    }
    static public String prefix() {
        return "class%"; //space is important
    }
}
