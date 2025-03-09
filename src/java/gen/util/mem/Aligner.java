package gen.util.mem;

import gen.TypeSizeGetter;

import java.util.Optional;

// ensure data is word aligned
public class Aligner {
    private final TypeSizeGetter typeSizeGetter;

    public Aligner(TypeSizeGetter typeSizeGetter) {
        this.typeSizeGetter = typeSizeGetter;
    }

    public Optional<Integer> align(String value) {
        int size = value.length();
        int remainder = (size + 1) % TypeSizeGetter.WORD_SIZE;
        if (remainder == 0) {
            return Optional.empty();
        }
        return Optional.of(4 - remainder);
    }
}
