package ast;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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
            System.out.println("Checkin equality for aggregate type " + this);
            return types.equals(at.types);
        }
        return false;
    }

    @Override
    public String toString() {
        return children().stream().map(c -> c.toString()).collect(Collectors.joining(","));
    }
}
