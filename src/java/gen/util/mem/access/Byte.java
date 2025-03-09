package gen.util.mem.access;

import gen.TypeSizeGetter;
import gen.asm.OpCode;

public class Byte implements AccessType {
    @Override
    public OpCode.Store Save() {
        return OpCode.SB;
    }

    @Override
    public OpCode.Load Load() {
        return OpCode.LB;
    }

    @Override
    public Integer Size() {
        return TypeSizeGetter.BYTE_SIZE;
    }
}
