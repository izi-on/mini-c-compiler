package ast;

import java.util.ArrayList;
import java.util.List;

public sealed abstract class Stmt implements ASTNode
        permits Block, Break, Continue, ExprStmt, If, Return, While {

    public List<ASTNode> children() {
        return new ArrayList<>();
    }
}
