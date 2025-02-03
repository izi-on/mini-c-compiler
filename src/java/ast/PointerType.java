package ast;

import java.util.ArrayList;
import java.util.List;

public non-sealed class PointerType implements Type{
    Type pointerizedType;

    public PointerType(Type pointerizedType){
        this.pointerizedType = pointerizedType;
    }

    @Override
    public List<ASTNode> children() {
        List<ASTNode> children = new ArrayList<ASTNode>();
        children.add(pointerizedType);
        return children;
    }
}
