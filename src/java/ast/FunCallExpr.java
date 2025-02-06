package ast;

import java.util.ArrayList;
import java.util.List;

public final class FunCallExpr extends Expr {
    String name;
    List<Expr> args;

    public FunCallExpr(String name, List<Expr> args) {
        this.name = name;
        this.args = args;
    }

    @Override
    public List<ASTNode> children() {
        return new ArrayList<>(args);
    }
}
