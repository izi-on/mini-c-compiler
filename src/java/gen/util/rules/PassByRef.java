package gen.util.rules;

import ast.ArrayType;
import ast.Type;
import com.sun.jdi.Value;
import gen.util.value_holder.ValueHolder;

import java.util.Optional;

public class PassByRef {
    @FunctionalInterface
    public interface RunWithSubtype {
        ValueHolder run(Type subtype);
    }

    static public class ToExecute {
        Type toPointerize;

        private ToExecute() {}
        ToExecute(Type subtype) {
            this.toPointerize = subtype;
        }

        public Optional<ValueHolder> then(RunWithSubtype toRun) {
            return Optional.ofNullable(toRun.run(toPointerize));
        }

        public boolean getTruth() {
            return true;
        }
    }

    static class Null extends ToExecute {
        @Override
        public Optional<ValueHolder> then(RunWithSubtype toRun) {return Optional.empty();}

        @Override
        public boolean getTruth() {return false;}
    }

    public static ToExecute ifIs(Type type) {
        return switch (type) {
            case ArrayType at -> new ToExecute(at.arrayedType);
            default -> new Null();
        };
    }
}
