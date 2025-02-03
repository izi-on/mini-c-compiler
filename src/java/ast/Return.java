package ast;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public final class Return extends Stmt {
    Optional<Expr> expr;

    public Return(Expr expr) {
        this.expr = Optional.ofNullable(expr);
    }

    @Override
    public List<ASTNode> children() {
        List<ASTNode> children = new ArrayList<>();
        if (expr.isPresent())
            children.add(expr.get());
        return children;
    }
}
