package sem;

import ast.FunDecl;
import ast.FunDef;
import ast.Type;

public class FunctionSymbol extends Symbol {
    FunDecl funDecl;
    FunDef funDef;

    public FunctionSymbol() {} // for error reporting purposes
    public FunctionSymbol(String name, FunDecl funDecl) {
        super(name);
        this.funDecl = funDecl;
    }
    public FunctionSymbol(String name, FunDef funDef) {
        super(name);
        this.funDef = funDef;
    }

}
