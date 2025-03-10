package ast;

import java.util.ArrayList;
import java.util.List;

public non-sealed class ArrayType implements Type {
    public Type arrayedType;
    public int size;

    public ArrayType() {}
    public ArrayType(Type arrayedType, int size){
        this.arrayedType = arrayedType;
        this.size = size;
    }

    @Override
    public String toString() {
        return "Array of " + arrayedType.toString();
    }

    @Override
    public List<ASTNode> children() {
        List<ASTNode> children = new ArrayList<>();
        children.add(arrayedType);
        return children;
    }

    public boolean equals(Object o) {
        if (o instanceof ArrayType) {
            ArrayType that = (ArrayType) o;
            return this.arrayedType.equals(that.arrayedType) && this.size == that.size;
        }
        return false;
    }
}
