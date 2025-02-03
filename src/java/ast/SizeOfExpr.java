package ast;

import java.util.List;

public final class SizeOfExpr extends Expr {
    Type sizeOfType;

    public SizeOfExpr(Type type) {
        this.sizeOfType = type;
    }

    @Override
    public List<ASTNode> children() {
        return null;
    }
}
