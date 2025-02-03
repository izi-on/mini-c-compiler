package ast;

import java.util.ArrayList;
import java.util.List;

public final class StructTypeDecl extends Decl {

    List<VarDecl> varDecls;
    // to be completed

    public StructTypeDecl(String structType, List<VarDecl> varDecls) {
        this.name = structType;
        this.type = new StructType(structType);
        this.varDecls = varDecls;
    }

    public List<ASTNode> children() {
        return new ArrayList<>(varDecls);
    }

}
