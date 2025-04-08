package ast;

import java.util.List;

public final class NewInstanceExpr extends Expr {
    public ClassType classType;

    public NewInstanceExpr(ClassType classType) {
        this.classType = classType;
    }

    @Override
    public List<ASTNode> children() {
        return List.of(classType);
    }
}
