package ast;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public final class FunDef extends Decl {
    public final List<VarDecl> params;
    public Block block;
    public boolean isBuiltin = false;
    public Optional<ClassType> methodOfClass = Optional.empty();

    public FunDef(Type type, String name, List<VarDecl> params, Block block) {
	    this.type = type;
	    this.name = name;
	    this.params = params;
        this.block = block;
    }

    public FunDef(Type type, String name, List<VarDecl> params, Block block, boolean isBuiltin) {
        this.type = type;
        this.name = name;
        this.params = params;
        this.block = block;
        this.isBuiltin = isBuiltin;
    }

    public List<ASTNode> children() {
        List<ASTNode> children = new ArrayList<ASTNode>();
        children.add(type);
        children.addAll(params);
        children.add(block);
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
