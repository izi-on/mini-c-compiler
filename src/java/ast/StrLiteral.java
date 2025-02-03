package ast;

import java.util.ArrayList;
import java.util.List;

public final class StrLiteral extends Expr {
    String value;

    public StrLiteral(String value) {
        this.value = value;
    }

    @Override
    public List<ASTNode> children() {
        return new ArrayList<>();
    }
}
