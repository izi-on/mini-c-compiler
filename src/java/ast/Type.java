package ast;

public sealed interface Type extends ASTNode
        permits AggregateType, ArrayType, BaseType, ClassType, PointerType, StructType {
}