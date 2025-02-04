package ast;

import java.util.ArrayList;
import java.util.List;

public final class BinOp extends Expr{
    Expr lhs;
    Op op;
    Expr rhs;

    public BinOp(Expr lhs, Op op, Expr rhs) {
        this.lhs = lhs;
        this.op = op;
        this.rhs = rhs;
    }

    @Override
    public List<ASTNode> children() {
        List<ASTNode> children = new ArrayList<>();
        children.add(lhs);
        children.add(op);
        children.add(rhs);
        return children;
    }
}
