package ast;

import java.util.ArrayList;
import java.util.List;

public final class TypecastExpr extends Expr{
    public Type typeToCastTo;
    public Expr expr;

    public TypecastExpr(Type type, Expr expr) {
        this.typeToCastTo = type;
        this.expr = expr;
    }

    @Override
    public List<ASTNode> children() {
        List<ASTNode> children = new ArrayList<>();
        children.add(typeToCastTo);
        children.add(expr);
        return children;
    }
}
