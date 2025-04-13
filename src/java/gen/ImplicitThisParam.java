package gen;

import ast.*;
import util.CompilerPass;

import java.util.Optional;
import java.util.stream.Stream;

public class ImplicitThisParam extends CompilerPass {
    static public String prefix = "this%";

    private Optional<ClassType> insideOfClass = Optional.empty();
    private Optional<VarDecl> insideOfClassPointer = Optional.empty();
    public void visit(ASTNode n) {
        switch (n) {
            case ast.FunDef fd -> {
                if (insideOfClass.isEmpty()) {
                    fd.children().forEach(this::visit);
                    return; // not inside a class, so no implicit this param
                }
                // add a pointer type to the class as the first parameter
                VarDecl pointerToObjectLayout = new VarDecl(
                        insideOfClass.get(),
                        prefix
                );
                fd.params.add(0, pointerToObjectLayout);
                insideOfClassPointer = Optional.of(pointerToObjectLayout);
                fd.children().forEach(this::visit);
                insideOfClassPointer = Optional.empty();
            }

            case ast.InstanceFunCallExpr ifce -> {
                // add a pointer type to the class as the first parameter
                ifce.funCallExpr.args.add(0, ifce.instanceExpr);

                // dont visit the funCallExpr since we already handle it with this case
                Stream.concat(Stream.of(ifce.instanceExpr), ifce.funCallExpr.children().stream()).forEach(this::visit);
            }

            case ast.FunCallExpr fce -> {
                // add a pointer type to the class as the first parameter
                if (insideOfClass.isPresent() && fce.isMethodCall() && insideOfClassPointer.isPresent()) {
                    fce.args.add(0, new VarExpr(prefix, insideOfClassPointer.get(), insideOfClass.get())); // TODO: this is a hack, should be a pointer to the class
                }
                fce.children().forEach(this::visit);
            }

            case ast.ClassDecl cd -> {
                // enter the class
                insideOfClass = Optional.of(cd.curClassType);
                cd.children().forEach(this::visit);
                insideOfClass = Optional.empty();
            }

            default -> {n.children().forEach(this::visit);} // nothing to do
        }
    }
}
