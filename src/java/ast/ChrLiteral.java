package ast;

import util.Unescape;

import java.util.ArrayList;
import java.util.List;

public final class ChrLiteral extends Expr {

    public char value;

    public ChrLiteral(String data) {
        // data can be an escape sequence like \n
        // so, parse
        this.value = Unescape.unescape(data).charAt(0);
    }

    @Override
    public List<ASTNode> children() {
        return new ArrayList<>();
    }
}
