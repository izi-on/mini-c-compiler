package ast;

public abstract sealed class Decl implements ASTNode
        permits ClassDecl, FunDecl, FunDef, StructTypeDecl, VarDecl {

    public Type type;
    public String name;
    public int fpOffset;
}
