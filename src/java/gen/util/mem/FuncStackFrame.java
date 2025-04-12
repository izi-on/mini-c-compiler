package gen.util.mem;

import ast.FunDef;

public class FuncStackFrame extends StackFrame {
    public FunDef func;
    boolean isClassMethod = false;

    public FuncStackFrame(FunDef stackOfFunc) {
        this.func = stackOfFunc;
    }
}
