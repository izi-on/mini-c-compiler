package sem.error;

import ast.BaseType;
import ast.Type;

public class UnexpectedTypeErr extends AbstractError {
    public UnexpectedTypeErr(Type type) {
        super("");
        if (type instanceof Enum<?>) {
            details = ((BaseType) type).toString();
        } else {
            details = type.getClass().getSimpleName();
        }
    }

    @Override
    public String msg() {
        return "Unexpected type: " + this.details;
    }
}
