package sem.error;

import ast.VarExpr;

public class UndeclaredVarErr extends AbstractError {

    public UndeclaredVarErr(VarExpr var) {
        super(var.name);
    }

    @Override
    public String msg() {
        return "Undeclared variable: " + details;
    }
}
