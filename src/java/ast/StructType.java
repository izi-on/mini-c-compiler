package ast;

import java.util.ArrayList;
import java.util.List;

public non-sealed class StructType implements Type{
    String typeName;

    public StructType(String typeName){
        this.typeName = typeName;
    }

    @Override
    public List<ASTNode> children() {
        return new ArrayList<ASTNode>();
    }
}
