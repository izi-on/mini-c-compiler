package gen.error;

import ast.Expr;

/**
 * Custom error thrown when an expression type is encountered that cannot be processed
 * by the address code generator.
 */
public class UnexpectedExpressionError extends RuntimeException {
    private final Expr expression;

    public UnexpectedExpressionError(Expr expression) {
        super("Unexpected expression type: " + expression.getClass().getSimpleName());
        this.expression = expression;
    }

    public Expr getExpression() {
        return expression;
    }
} 