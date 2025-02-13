package ast;

import java.util.ArrayList;
import java.util.List;

public final class AggregateType implements Type {
    public List<Type> types;

    @Override
    public List<ASTNode> children() {
        return new ArrayList<>(types);
    }

    public AggregateType(List<Type> types) {
        this.types = types;
    }

    public boolean equals(Object o) {
        if (o instanceof AggregateType) {
            AggregateType at = (AggregateType) o;
            return types.equals(at.types);
        }
        return false;
    }
}
