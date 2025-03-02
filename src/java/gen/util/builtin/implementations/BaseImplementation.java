package gen.util.builtin.implementations;

import gen.asm.AssemblyProgram;

public interface BaseImplementation<T> {
    public void applyImplementation(T t, AssemblyProgram.TextSection ts);
    public boolean hasImplementationFor(T t);
}
