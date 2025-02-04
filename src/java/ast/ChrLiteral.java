package ast;

import java.util.ArrayList;
import java.util.List;

public final class ChrLiteral extends Expr {

   char value;

    public ChrLiteral(char value) {
        this.value = value;
    }

    @Override
    public List<ASTNode> children() {
        return new ArrayList<>();
    }
}
