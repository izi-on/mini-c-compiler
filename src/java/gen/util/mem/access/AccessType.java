package gen.util.mem.access;

import gen.asm.OpCode;

public interface AccessType {
    OpCode.Store Save();
    OpCode.Load Load();
    Integer Size();
}
