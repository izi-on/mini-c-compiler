package gen;

import ast.ASTPrinter;
import ast.Program;
import lexer.Scanner;
import lexer.Tokeniser;
import org.junit.jupiter.api.Test;
import parser.Parser;
import regalloc.NaiveRegAlloc;
import sem.SemanticAnalyzer;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class CodeGenTest {
    private String runCode(String code) throws IOException, InterruptedException {
        Path tempFile = Files.createTempFile("temp", ".tmp");
        Files.write(tempFile, code.getBytes(StandardCharsets.UTF_8));
        try {
            // Step 1: Parsing
            Scanner scanner = new Scanner(tempFile.toFile());
            Tokeniser tokeniser = new Tokeniser(scanner);
            Parser parser = new Parser(tokeniser);
            Program prog = parser.parse();
            if (tokeniser.hasErrors()) {
                System.out.println("Lexing failed with " + tokeniser.getNumErrors() + " errors.");
                System.exit(1);
            }
            if (parser.hasErrors()) {
                System.out.println("Parsing failed with " + parser.getNumErrors() + " errors.");
                System.exit(1);
            }
            System.out.println("Parsing: pass");

            // Step 2: Semantic Analysis
            SemanticAnalyzer sem = new SemanticAnalyzer();
            sem.analyze(prog);
            if (sem.hasErrors()) {
                System.out.println("Semantic analysis failed with " + sem.getNumErrors() + " errors.");
                System.exit(1);
            }
            System.out.println("Semantic analysis: pass");

            // Step 3: Code Generation
            // Here we use our default register allocator, NaiveRegAlloc.
            CodeGenerator codegen = new CodeGenerator(NaiveRegAlloc.INSTANCE);
            Path tempOutput = Files.createTempFile("output", ".asm");
            codegen.emitProgram(prog, tempOutput.toFile());
            System.out.println("Code generated successfully in " + tempOutput.toAbsolutePath());

            // Step 4: Run the MARS simulation on the generated code and capture the output
            ProcessBuilder pb = new ProcessBuilder("java", "-jar", "Mars4_5.jar", "sm", "nc", "me", tempOutput.toAbsolutePath().toString());
            pb.redirectErrorStream(true);
            Process p = pb.start();
            p.waitFor();
            String output = new String(p.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
            output = output.replaceAll("\\R$", ""); // remove MARS trailing newline
            return output;
        } catch (FileNotFoundException e) {
            System.err.println("Source file not found: " + tempFile.toFile().getAbsolutePath());
            throw e;
        } catch (IOException e) {
            System.err.println("Error reading file: " + tempFile.toFile().getAbsolutePath());
            throw e;
        } catch (InterruptedException e) {
            System.err.println("Error running MARS simulation");
            throw e;
        }
    }

    @Test
    public void testCodeGenEmptyMain() throws IOException, InterruptedException {
        String code = """
            int main() {
                return 0;
            }
        """;
        String expectedOutput = "";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Empty main should produce no output");
    }

    @Test
    public void testPrintI() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(42);
                return 0;
            }
        """;
        String expectedOutput = "42";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "print_i(42) should print 42");
    }

    @Test
    public void testFunctionCall() throws IOException, InterruptedException {
        String code = """
            int foo() {
                return 42;
            }
            int main() {
                print_i(foo());
                return 0;
            }
        """;
        String expectedOutput = "42";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "foo() should return 42");
    }

    @Test
    public void testLocalVarDecl() throws IOException, InterruptedException {
        String code = """
            int main() {
                int x;
                x = 42;
                print_i(x);
                return 0;
            }
        """;
        String expectedOutput = "42";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "int x = 42; print_i(x); should print 42");
    }

    @Test
    public void testGlobalVarDecl() throws IOException, InterruptedException {
        String code = """
            int x;
            int foo() {
                x = 42;
            }
            
            int main() {
                foo();
                print_i(x);
                return 0;
            }
        """;
        String expectedOutput = "42";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Global int x = 42; print_i(x); should print 42");
    }

    @Test
    public void testIfMain() throws IOException, InterruptedException {
        String code = """
            int main() {
                if (1) {
                    print_i(42);
                }
                return 0;
            }
        """;
        String expectedOutput = "42";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "if (1) print_i(42); should print 42");
    }

    @Test
    public void testIfElse() throws IOException, InterruptedException {
        String code = """
            int main() {
                if (0) {
                    print_i(42);
                } else {
                    print_i(24);
                }
                return 0;
            }
        """;
        String expectedOutput = "24";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "if (0) print_i(42); else print_i(24); should print 24");
    }

    @Test
    public void testAddition() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(40+2);
                return 0;
            }
        """;
        String expectedOutput = "42";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "40+2 should equal 42");
    }

    @Test
    public void testSubtraction() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(45-3);
                return 0;
            }
        """;
        String expectedOutput = "42";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "45-3 should equal 42");
    }

    @Test
    public void testMultiplication() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(6*7);
                return 0;
            }
        """;
        String expectedOutput = "42";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "6*7 should equal 42");
    }

    @Test
    public void testDivision() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(84/2);
                return 0;
            }
        """;
        String expectedOutput = "42";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "84/2 should equal 42");
    }

    @Test
    public void testModulo() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(85%43);
                return 0;
            }
        """;
        String expectedOutput = "42";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "85%43 should equal 42");
    }

    @Test
    public void testLessThanTrue() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(40<42);
                return 0;
            }
        """;
        String expectedOutput = "1";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "40<42 should be true (1)");
    }

    @Test
    public void testLessThanFalse() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(42<40);
                return 0;
            }
        """;
        String expectedOutput = "0";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "42<40 should be false (0)");
    }

    @Test
    public void testGreaterThanTrue() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(42>40);
                return 0;
            }
        """;
        String expectedOutput = "1";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "42>40 should be true (1)");
    }

    @Test
    public void testGreaterThanFalse() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(40>42);
                return 0;
            }
        """;
        String expectedOutput = "0";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "40>42 should be false (0)");
    }

    @Test
    public void testLessEqualTrue() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(42<=42);
                return 0;
            }
        """;
        String expectedOutput = "1";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "42<=42 should be true (1)");
    }

    @Test
    public void testLessEqualFalse() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(43<=42);
                return 0;
            }
        """;
        String expectedOutput = "0";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "43<=42 should be false (0)");
    }

    @Test
    public void testGreaterEqualTrue() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(42>=42);
                return 0;
            }
        """;
        String expectedOutput = "1";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "42>=42 should be true (1)");
    }

    @Test
    public void testGreaterEqualFalse() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(41>=42);
                return 0;
            }
        """;
        String expectedOutput = "0";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "41>=42 should be false (0)");
    }

    @Test
    public void testEqualityTrue() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(42==42);
                return 0;
            }
        """;
        String expectedOutput = "1";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "42==42 should be true (1)");
    }

    @Test
    public void testEqualityFalse() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(42==43);
                return 0;
            }
        """;
        String expectedOutput = "0";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "42==43 should be false (0)");
    }

    @Test
    public void testInequalityTrue() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(42!=43);
                return 0;
            }
        """;
        String expectedOutput = "1";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "42!=43 should be true (1)");
    }

    @Test
    public void testInequalityFalse() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(42!=42);
                return 0;
            }
        """;
        String expectedOutput = "0";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "42!=42 should be false (0)");
    }

    @Test
    public void testLogicalOrTrue() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(1||0);
                return 0;
            }
        """;
        String expectedOutput = "1";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "1||0 should be true (1)");
    }

    @Test
    public void testLogicalOrFalse() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(0||0);
                return 0;
            }
        """;
        String expectedOutput = "0";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "0||0 should be false (0)");
    }

    @Test
    public void testLogicalAndTrue() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(1&&1);
                return 0;
            }
        """;
        String expectedOutput = "1";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "1&&1 should be true (1)");
    }

    @Test
    public void testLogicalAndFalse() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_i(1&&0);
                return 0;
            }
        """;
        String expectedOutput = "0";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "1&&0 should be false (0)");
    }

    @Test
    public void testRecursion() throws IOException, InterruptedException {
        String code = """
            int foo(int x) {
                if (x == 0) {
                    return 0;
                } else {
                    return foo(x-1);
                }
            }
            
            int main() {
                print_i(foo(5));
            }
        """;
        String expectedOutput = "0";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "foo(5) should return 0");
    }

    @Test
    public void testLoop() throws IOException, InterruptedException {
        String code = """
            int main() {
                int i;
                i = 0;
                while (i < 5) {
                    i = i + 1;
                }
                print_i(i);
                return 0;
            }
        """;
        String expectedOutput = "5";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "while loop should print 5");
    }

    @Test
    public void testLoopBreak() throws IOException, InterruptedException {
        String code = """
            int main() {
                int i;
                i = 0;
                while (1) {
                    i = i + 1;
                    if (i == 5) {
                        break;
                    }
                }
                print_i(i);
                return 0;
            }
        """;
        String expectedOutput = "5";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "while loop with break should print 5");
    }

    @Test
    public void testLoopContinue() throws IOException, InterruptedException {
        String code = """
            int main() {
                int i;
                i = 0;
                while (i < 5) {
                    i = i + 1;
                    if (i == 3) {
                        continue;
                    }
                    print_i(i);
                }
                return 0;
            }
        """;
        String expectedOutput = "1245";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "while loop with continue should print 1245");
    }

    @Test
    public void testConsecutiveFuncCalls() throws IOException, InterruptedException {
        String code = """
            int x;
            int foo(int i) {
                x = x + 1;
            }
            
            int main() {
                int i;
                i = 5;
                x = 2;
                foo(i);
                foo(i);
                print_i(x);
                return 0;
            }
        """;
        String expectedOutput = "4";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "consecutive foo() calls should return 42");
    }

    @Test
    public void testNestedLoop() throws IOException, InterruptedException {
        String code = """
            int x;
            int main() {
                int i;
                int x;
                i = 5;
                x = 2;
                print_i(x);
                print_i(i);
                return 0;
            }
        """;
        String expectedOutput = "25"; // k value concatenated with i value
        String output = runCode(code);
        assertEquals(expectedOutput, output, "nested while loop should print 25");
    }
}
