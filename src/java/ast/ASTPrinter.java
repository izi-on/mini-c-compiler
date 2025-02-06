package ast;

import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Stream;

public class ASTPrinter {

    private final PrintWriter writer;

    public ASTPrinter(PrintWriter writer) {
        this.writer = writer;
    }

    private void insideOf(Runnable func) {
        writer.print("(");
        func.run();
        writer.print(")");
    }

    private void insideOf(Runnable func, String open, String close) {
        writer.print(open);
        func.run();
        writer.print(close);
    }

    private void withSeparation(List<Runnable> funcs, String separator) {
        for (int i = 0; i < funcs.size(); i++) {
            funcs.get(i).run();
            if (i < funcs.size() - 1) {
                writer.print(separator);
            }
        }
    }

    // Helper method that accepts one or more streams of items to print.
    private void nodePartsPrintOrder(Stream<?>... parts) {
        withSeparation(
                Arrays.stream(parts)
                        .flatMap(Function.identity())
                        .map(item -> (Runnable) () -> visit(item))
                        .toList(), ","
        );
    }

    public void visit(Object object) {
        switch (object) {
            case ASTNode node -> visit(node);
            case String str -> writer.print(str);
            case Integer i -> writer.print(i);
            case Character c -> writer.print(c);
            default -> {throw new IllegalArgumentException("Unexpected object: " + object);}
        }
    }
    public void visit(ASTNode node) {
        if (node == null)
            throw new IllegalStateException("Unexpected null value");


        // Base cases: print the name of the node ONLY.
        switch (node) {
            case BaseType bt -> {
                writer.print(bt.name());
                return;
            }
            case Op op -> {
                writer.print(op.name());
                return;
            }
            default -> { /* Continue with other logic*/ }
        }
        writer.print(node.getClass().getSimpleName());

        // Usage in the switch statement:
        insideOf(() -> {
            switch (node) {
                // --- Program node: a list of declarations ---
                case Program prog ->
                        nodePartsPrintOrder(prog.decls.stream());

                // --- Declarations ---
                case FunDecl fd ->
                        nodePartsPrintOrder(
                                Stream.of(fd.type),
                                Stream.of(fd.name),
                                fd.params.stream()
                        );

                case FunDef fd ->
                        nodePartsPrintOrder(
                                Stream.of(fd.type),
                                Stream.of(fd.name),
                                fd.params.stream(),
                                Stream.of(fd.block)
                        );

                case VarDecl vd ->
                        nodePartsPrintOrder(
                                Stream.of(vd.type),
                                Stream.of(vd.name)
                        );

                case StructType st ->
                        nodePartsPrintOrder(Stream.of(st.typeName));

                case IntLiteral il ->
                        nodePartsPrintOrder(Stream.of(il.value));

                case StrLiteral sl ->
                        nodePartsPrintOrder(Stream.of(sl.value));

                case ChrLiteral cl ->
                        nodePartsPrintOrder(Stream.of(cl.value));

                case VarExpr v ->
                        nodePartsPrintOrder(Stream.of(v.name));

                case FunCallExpr f ->
                        nodePartsPrintOrder(
                                Stream.of(f.name),
                                f.args.stream()
                        );

                default ->
                        nodePartsPrintOrder(node.children().stream());
            }
        });        // Flush after printing the whole program.
        switch (node) {
            case Program ignored -> writer.flush();
            default -> { }
        }
    }
}