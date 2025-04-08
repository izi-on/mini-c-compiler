package ast;

import java.util.List;
import java.util.Optional;

public final class ClassType implements Type {
    public String name;
    public Optional<ClassDecl> classDecl; // to search up fields and methods of a class
    public ClassType(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "ClassType{" +
                "name='" + name + '\'' +
                '}';
    }

    public boolean equals(Object o) {
        if (o instanceof ClassType) {
            ClassType that = (ClassType) o;
            return this.name.equals(that.name);
        }
        return false;
    }

    public int hashCode() {
        return name.hashCode();
    }

    @Override
    public List<ASTNode> children() {
        return List.of();
    }
}
