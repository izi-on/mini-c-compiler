package ast;

import java.util.ArrayList;
import java.util.List;

public final class SizeOfExpr extends Expr {
    public Type sizeOfType;

    public SizeOfExpr(Type type) {
        this.sizeOfType = type;
    }

    @Override
    public List<ASTNode> children() {
        List<ASTNode> children = new ArrayList<>();
        children.add(sizeOfType);
        return children;
    }
}
