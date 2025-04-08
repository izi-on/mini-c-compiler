package sem;

import ast.ClassType;

public class ClassSymbol extends Symbol {
    ClassType classType;
    Scope classScope;
    public ClassSymbol() {} // for error reporting purposes
    public ClassSymbol(String name, ClassType classType, Scope classScope) {
        super(name);
        this.classType = classType;
        this.classScope = classScope;
    }
}
