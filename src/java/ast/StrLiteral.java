package ast;

import util.Unescape;

import java.util.ArrayList;
import java.util.List;

public final class StrLiteral extends Expr {
    public String value;

    public StrLiteral(String data) {
        // data can be an escape sequence like \n
        // so, parse
        this.value = Unescape.unescape(data);
    }

    @Override
    public List<ASTNode> children() {
        return new ArrayList<>();
    }
}
