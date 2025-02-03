package ast;

import java.util.List;

public final class TypecastExpr extends Expr{
    Type typeToCastTo;
    Expr expr;

    public TypecastExpr(Type type, Expr expr) {
        this.typeToCastTo = type;
        this.expr = expr;
    }

    @Override
    public List<ASTNode> children() {
        return null;
    }
}
