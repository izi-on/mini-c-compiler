package sem;

import ast.VarDecl;

public class VariableSymbol extends Symbol {
    VarDecl node;
    public VariableSymbol() {} // for error reporting purposes
    public VariableSymbol(String name, VarDecl node) {
        super(name);
        this.node = node;
    }
}
