package ast;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public final class If extends Stmt {
    public Expr condition;
    public Stmt thenStmt;
    public Optional<Stmt> elseStmt;

    public If(Expr condition, Stmt thenStmt, Stmt elseStmt) {
        this.condition = condition;
        this.thenStmt = thenStmt;
        this.elseStmt = Optional.ofNullable(elseStmt);
    }

    public List<ASTNode> children() {
        List<ASTNode> children = new ArrayList<>();
        children.add(condition);
        children.add(thenStmt);
        if (elseStmt.isPresent()) {
            children.add(elseStmt.get());
        }
        return children;
    }
}
