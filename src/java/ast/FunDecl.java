package ast;

import java.util.ArrayList;
import java.util.List;

public final class FunDecl extends Decl {
    public final List<VarDecl> params;

    public FunDecl(Type type, String name, List<VarDecl> params) {
	    this.type = type;
	    this.name = name;
	    this.params = params;
    }

    public List<ASTNode> children() {
        List<ASTNode> children = new ArrayList<ASTNode>();
        children.add(type);
        children.addAll(params);
        return children;
    }

    public boolean equals(Object o) {
        if (o instanceof FunDef) {
            FunDef that = (FunDef) o;
            return this.name.equals(name) && this.type.equals(that.type) && this.params.equals(that.params);
        } else if (o instanceof FunDecl) {
            FunDecl that = (FunDecl) o;
            return this.name.equals(name) && this.type.equals(that.type) && this.params.equals(that.params);
        }
        return false;
    }


}
