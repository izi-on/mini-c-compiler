package sem.error;

import ast.Decl;

public class DoubleDeclErr extends AbstractError {
    public DoubleDeclErr(Decl details) {
        super(details.type + " " + details.name);
    }

    public String msg() {
        return "Double declaration error: " + details;
    }
}
