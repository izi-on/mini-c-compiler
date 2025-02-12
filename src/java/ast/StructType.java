package ast;

import java.util.ArrayList;
import java.util.List;

public non-sealed class StructType implements Type{
    public String typeName;

    public StructType(String typeName){
        this.typeName = typeName;
    }

    public boolean equals(Object o) {
        if (o instanceof StructType) {
            StructType that = (StructType) o;
            return this.typeName.equals(that.typeName);
        }
        return false;
    }

    @Override
    public List<ASTNode> children() {
        return new ArrayList<ASTNode>();
    }
}
