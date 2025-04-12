package ast;

import java.util.ArrayList;
import java.util.List;

public final class VarExpr extends Expr {
    public final String name;
    public VarDecl vd; // to be filled in by the name analyser

    public VarExpr(String name){
        this.name = name;
    }

    public VarExpr(String name, VarDecl vd) {
        this.name = name;
        this.vd = vd;
    }

    public VarExpr(String name, VarDecl vd, Type type) {
        this.name = name;
        this.vd = vd;
        this.type = type;
    }

    public List<ASTNode> children() {
        return new ArrayList<>();
    }

}
