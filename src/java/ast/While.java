package ast;

import java.util.ArrayList;
import java.util.List;

public final class While extends Stmt {
    public Expr cond;
    public Stmt body;

    public While(Expr cond, Stmt body) {
        this.cond = cond;
        this.body = body;
    }

    @Override
    public List<ASTNode> children() {
        List<ASTNode> children = new ArrayList<>();
        children.add(cond);
        children.add(body);
        return children;
    }
}
