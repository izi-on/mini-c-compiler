package ast;

import java.util.ArrayList;
import java.util.List;

public non-sealed class IntLiteral extends Expr {
    public int value;

    public IntLiteral() {} // for type purposes
    public IntLiteral(int value) {
        this.value = value;
    }

    @Override
    public List<ASTNode> children() {
        return new ArrayList<>();
    }
}
