package gen;

import ast.*;

import java.util.Optional;

public class MarkFunctionsAsMethodCalls {

    Optional<ClassType> insideOfClass = Optional.empty();
    public void visit(ASTNode node) {
        switch (node) {
            case FunDef funDef -> {
                if (insideOfClass.isEmpty())
                    return;
                funDef.methodOfClass = insideOfClass;
            }
            case ClassDecl classDecl -> {
                // Enter the class
                insideOfClass = Optional.of(classDecl.curClassType);
                classDecl.funDefs.forEach(this::visit);
                insideOfClass = Optional.empty();
            }
            default -> {node.children().forEach(this::visit);}
        }
    }

}
