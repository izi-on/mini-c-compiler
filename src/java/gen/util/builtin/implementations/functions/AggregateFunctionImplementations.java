package gen.util.builtin.implementations.functions;

import ast.FunDef;
import gen.asm.AssemblyProgram;
import gen.util.builtin.implementations.BaseImplementation;

import java.util.List;

public class AggregateFunctionImplementations implements BaseImplementation<FunDef> {
    List<FunctionImplementation> funcImplementations;

    public AggregateFunctionImplementations(List<FunctionImplementation> funcImplementations) {
        this.funcImplementations = funcImplementations;
    }

    @Override
    public void applyImplementation(FunDef funDef, AssemblyProgram.TextSection ts) {
        if (!hasImplementationFor(funDef)) {
            throw new IllegalStateException("No implementation found for function " + funDef.name);
        }
        funcImplementations.stream().filter(impl -> impl.hasImplementationFor(funDef)).findFirst().ifPresent(impl -> impl.applyImplementation(funDef, ts));
    }

    @Override
    public boolean hasImplementationFor(FunDef funDef) {
        return funcImplementations.stream().anyMatch(impl -> impl.hasImplementationFor(funDef));
    }
}
