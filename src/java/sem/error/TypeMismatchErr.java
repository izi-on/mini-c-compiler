package sem.error;

import ast.ASTNode;

public class TypeMismatchErr extends AbstractError{

        public TypeMismatchErr(ASTNode expected, ASTNode got) {
            super("Expected " + expected.getClass().getSimpleName() + " but got " + got.getClass().getSimpleName() + "for name " + expected.toString());
        }

        @Override
        public String msg() {
            return null;
        }
}
