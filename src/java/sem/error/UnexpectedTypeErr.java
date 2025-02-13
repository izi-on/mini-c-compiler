package sem.error;

import ast.Type;

public class UnexpectedTypeErr extends AbstractError {
    public UnexpectedTypeErr(Type type) {
        super(type.getClass().getSimpleName());
    }

    @Override
    public String msg() {
        return "Unexpected type: " + this.details;
    }
}
