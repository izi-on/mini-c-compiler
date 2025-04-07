package ast;

import java.util.List;

public final class InstanceFunCallExpr extends Expr {
    public Expr instanceExpr;
    public FunCallExpr funCallExpr;

    public InstanceFunCallExpr(Expr instanceExpr, FunCallExpr funCallExpr) {
        this.instanceExpr = instanceExpr;
        this.funCallExpr = funCallExpr;
    }

    @Override
    public List<ASTNode> children() {
        return List.of(instanceExpr, funCallExpr);
    }
}
