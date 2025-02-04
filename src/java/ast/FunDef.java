package ast;

import java.util.ArrayList;
import java.util.List;

public final class FunDef extends Decl {
    public final List<VarDecl> params;
    public Block block;

    public FunDef(Type type, String name, List<VarDecl> params, Block block) {
	    this.type = type;
	    this.name = name;
	    this.params = params;
        this.block = block;
    }

    public List<ASTNode> children() {
        List<ASTNode> children = new ArrayList<ASTNode>();
        children.add(type);
        children.addAll(params);
        return children;
    }

}
