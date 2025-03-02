package gen.util.mem;

import ast.FunDef;

public class FuncStackFrame extends StackFrame {
    public FunDef func;

    public FuncStackFrame(FunDef stackOfFunc) {
        this.func = stackOfFunc;
    }
}
