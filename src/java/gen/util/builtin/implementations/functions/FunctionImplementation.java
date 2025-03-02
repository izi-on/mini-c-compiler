package gen.util.builtin.implementations.functions;

import ast.FunDef;
import gen.util.builtin.implementations.BaseImplementation;

abstract class FunctionImplementation implements BaseImplementation<FunDef> {
    String funcName;

    public FunctionImplementation(String funcName) {
        this.funcName = funcName;
    }

    public boolean hasImplementationFor(FunDef t) {
        return t.name.equals(funcName);
    }
}
