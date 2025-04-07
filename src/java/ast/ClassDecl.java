package ast;

import java.util.List;
import java.util.Optional;

public final class ClassDecl extends Decl {
    public ClassType curClassType;
    public Optional<ClassType> superClassType;
    public List<VarDecl> varDecls;
    public List<FunDef> funDefs;

    public ClassDecl(ClassType curClassType, Optional<ClassType> superClassType,
                    List<VarDecl> varDecls, List<FunDef> funDefs) {
        this.curClassType = curClassType;
        this.superClassType = superClassType;
        this.varDecls = varDecls;
        this.funDefs = funDefs;
    }

    public ClassDecl(ClassType curClassType, ClassType superClassType,
                    List<VarDecl> varDecls, List<FunDef> funDefs) {
        this(curClassType, Optional.of(superClassType), varDecls, funDefs);
    }

    public ClassDecl(ClassType curClassType, List<VarDecl> varDecls, List<FunDef> funDefs) {
        this(curClassType, Optional.empty(), List.of(), List.of());
    }

    @Override
    public List<ASTNode> children() {
        return List.of();
    }
}
