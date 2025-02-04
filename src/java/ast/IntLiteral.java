package ast;

import java.util.ArrayList;
import java.util.List;

public non-sealed class IntLiteral extends Expr {
    int value;

    public IntLiteral(int value) {
        this.value = value;
    }

    @Override
    public List<ASTNode> children() {
        return new ArrayList<>();
    }
}
