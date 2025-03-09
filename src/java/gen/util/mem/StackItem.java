package gen.util.mem;

public enum StackItem {
    RETURN_VAL,
    RETURN_ADDR,
    FRAME_POINTER,
    STACK_POINTER_OFFSET, // this is set by the mem allocator after the stack frame is created. This will tell code generators by how much to offset the stack pointer
    POINTER_OFFSET, // used by struct to get its size
}
