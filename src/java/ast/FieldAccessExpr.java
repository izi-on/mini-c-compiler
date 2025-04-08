package ast;

import java.util.ArrayList;
import java.util.List;

public final class FieldAccessExpr extends Expr {
    public Expr structOrClass;
    public String field;

    public FieldAccessExpr(Expr struct, String field) {
        this.structOrClass = struct;
        this.field = field;
    }

    @Override
    public List<ASTNode> children() {
        List<ASTNode> children = new ArrayList<>();
        children.add(structOrClass);
        return children;
    }
}
