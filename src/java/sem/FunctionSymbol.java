package sem;

import ast.AggregateType;
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

    public Type getType() {
        if (funDef == null) {
            return funDef.type;
        } else if (funDecl != null) {
            return funDecl.type;
        }
        return null;
    }

}
