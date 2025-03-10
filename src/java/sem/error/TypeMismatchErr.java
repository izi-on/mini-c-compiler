package sem.error;

import ast.ASTNode;

public class TypeMismatchErr extends AbstractError{

        public TypeMismatchErr(ASTNode expected, ASTNode got) {
            super("Expected " + expected.toString() + " but got " + got.toString() + " for name " + expected.toString());
        }

        @Override
        public String msg() {
            return this.details;
        }
}
