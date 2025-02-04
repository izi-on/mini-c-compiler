package ast;

import java.util.ArrayList;
import java.util.List;

public non-sealed class ArrayType implements Type {
    Type arrayedType;
    int size;

    public ArrayType(Type arrayedType, int size){
        this.arrayedType = arrayedType;
        this.size = size;
    }

    @Override
    public List<ASTNode> children() {
        List<ASTNode> children = new ArrayList<>();
        children.add(arrayedType);
        return children;
    }
}
