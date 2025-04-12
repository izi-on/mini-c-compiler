package gen;

import ast.*;
import util.CompilerPass;

import java.util.Optional;

public class ImplicitThisParam extends CompilerPass {
    static public String prefix = "this%";

    private Optional<ClassType> insideOfClass = Optional.empty();
    public void visit(ASTNode n) {
        switch (n) {
            case ast.FunDef fd -> {
                visit(fd.block);
                if (insideOfClass.isEmpty())
                    return; // not inside a class, so no implicit this param
                // add a pointer type to the class as the first parameter
                VarDecl pointerToObjectLayout = new VarDecl(
                        insideOfClass.get(),
                        prefix
                );
                fd.params.add(0, pointerToObjectLayout);
            }
            case ast.InstanceFunCallExpr ifce -> {
                // add a pointer type to the class as the first parameter
                ifce.funCallExpr.args.add(0, ifce.instanceExpr);
            }
            case ast.ClassDecl cd -> {
                // enter the class
                insideOfClass = Optional.of(cd.curClassType);
                cd.funDefs.forEach(this::visit);
                insideOfClass = Optional.empty();
            }
            default -> {n.children().forEach(this::visit);} // nothing to do
        }
    }
}
