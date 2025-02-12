package ast;

import java.util.ArrayList;
import java.util.List;

public final class StructTypeDecl extends Decl {

    public List<VarDecl> varDecls;

    public StructTypeDecl(String structType, List<VarDecl> varDecls) {
        this.name = structType;
        this.type = new StructType(structType);
        this.varDecls = varDecls;
    }

    public List<ASTNode> children() {
        List<ASTNode> children = new ArrayList<>();
        children.add(type);
        children.addAll(varDecls);
        return children;
    }

}
