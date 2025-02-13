package ast;

import java.util.ArrayList;
import java.util.List;

public final class FieldAccessExpr extends Expr {
    public Expr struct;
    public String field;

    public FieldAccessExpr(Expr struct, String field) {
        this.struct = struct;
        this.field = field;
    }

    @Override
    public List<ASTNode> children() {
        List<ASTNode> children = new ArrayList<>();
        children.add(struct);
        return children;
    }
}
