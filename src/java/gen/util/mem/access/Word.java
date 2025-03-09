package gen.util.mem.access;

import gen.TypeSizeGetter;
import gen.asm.OpCode;

public class Word implements AccessType {
    @Override
    public OpCode.Store Save() {
        return OpCode.SW;
    }

    @Override
    public OpCode.Load Load() {
        return OpCode.LW;
    }

    @Override
    public Integer Size() {
        return TypeSizeGetter.WORD_SIZE;
    }
}
