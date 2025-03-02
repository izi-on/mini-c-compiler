package gen.util.mem;

import ast.Decl;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

public abstract class StackFrame {
    private Map<StackItem, Integer> offsets = new HashMap<>();
    private Map<Decl, Integer> declOffsets = new HashMap<>();

    // getters
    public Optional<Integer> offsetOf(StackItem item) {
        return Optional.ofNullable(offsets.get(item));
    };
    public Optional<Integer> offsetOf(Decl item) {
        return Optional.ofNullable(declOffsets.get(item));
    };

    // setters
    public void setOffset(StackItem item, int offset) {
        offsets.put(item, offset);
    }
    public void setOffset(Decl item, int offset) {
        declOffsets.put(item, offset);
    }
}
