package sem.error;

import sem.Symbol;

public class SymbolMismatchErr extends AbstractError {

    public SymbolMismatchErr(Symbol expected, Symbol got) {
        super("Expected " + expected.getClass().getSimpleName() + " but got " + got.getClass().getSimpleName() + " for name " + got.name);
    }

    @Override
    public String msg() {
        return this.details;
    }
}
