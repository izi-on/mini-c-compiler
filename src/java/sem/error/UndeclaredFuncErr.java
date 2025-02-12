package sem.error;

import ast.FunCallExpr;

public class UndeclaredFuncErr extends AbstractError {

    public UndeclaredFuncErr(FunCallExpr var) {
        super(var.name);
    }

    @Override
    public String msg() {
        return "Undeclared function: " + details;
    }
}
