package ast;

import java.util.List;

public final class ClassType implements Type {
    public String name;
    public ClassType(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "ClassType{" +
                "name='" + name + '\'' +
                '}';
    }

    @Override
    public List<ASTNode> children() {
        return List.of();
    }
}
