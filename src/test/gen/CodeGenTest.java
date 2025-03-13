package gen;

import ast.ASTPrinter;
import ast.Program;
import gen.asm.AssemblyProgram;
import gen.asm.Label;
import gen.asm.Register;
import gen.util.mem.context.MemContext;
import lexer.Scanner;
import lexer.Tokeniser;
import org.junit.Ignore;
import org.junit.jupiter.api.BeforeEach;
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

//            // optional: print with ASTPrinter
//            ASTPrinter printer = new ASTPrinter(new PrintWriter(System.out));
//            printer.visit(prog);

            // Step 3: Code Generation
            // Here we use our default register allocator, NaiveRegAlloc.
            CodeGenerator codegen = new CodeGenerator(NaiveRegAlloc.INSTANCE);
            Path tempOutput = Files.createTempFile("output", ".asm");
            codegen.emitProgram(prog, tempOutput.toFile());
            System.out.println("Code generated successfully in " + tempOutput.toAbsolutePath());

            try (PrintWriter writer = new PrintWriter(new File("output.asm"))) {
                writer.write(new String(Files.readAllBytes(tempOutput), StandardCharsets.UTF_8));
            }            // Step 4: Run the MARS simulation on the generated code and capture the output

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

    @BeforeEach
    public void resetState() {
        MemContext.reset();
        NaiveRegAlloc.reset();
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
    public void testPrintThenFunctionCall() throws IOException, InterruptedException {
        String code = """
                int foo() {
                    return 42;
                }
                
                int main() {
                    int x;
                    print_i(5);
                    x = 10;
                    print_i(foo());
                    print_i(x);
                    return 0;
                }
        """;
        String expectedOutput = "54210";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Should print 54210");
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
                if (x == 1) {
                    return 1;
                } else {
                    return foo(x-1);
                }
            }
            
            int main() {
                print_i(foo(3));
            }
        """;
        String expectedOutput = "1";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "foo(5) should return 1");
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

    @Test
    public void testPrintC() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_c('a');
                return 0;
            }
        """;
        String expectedOutput = "a";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "print_c('a') should print a");
    }

    @Test
    public void testArray() throws IOException, InterruptedException {
        String code = """
            int main() {
                char arr[5];
                arr[0] = 'a';
                arr[1] = 'b';
                arr[2] = 'c';
                arr[3] = 'd';
                arr[4] = 'e';
                print_c(arr[0]);
                print_c(arr[1]);
                print_c(arr[2]);
                print_c(arr[3]);
                print_c(arr[4]);
                return 0;
            }
        """;
        String expectedOutput = "abcde";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Array access should print abcde");
    }

    @Test
    public void testGlobalArray() throws IOException, InterruptedException {
        String code = """
            char arr[5];
            int main() {
                arr[0] = 'a';
                arr[1] = 'b';
                arr[2] = 'c';
                arr[3] = 'd';
                arr[4] = 'e';
                print_c(arr[0]);
                print_c(arr[1]);
                print_c(arr[2]);
                print_c(arr[3]);
                print_c(arr[4]);
                return 0;
            }
        """;
        String expectedOutput = "abcde";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Global array access should print abcde");
    }



    @Test
    public void testPointer() throws IOException, InterruptedException {
        String code = """
            int main() {
                int x;
                int y;
                int* p;
                p = &y;
                x = 42;
                *p = x;
                print_i(y);
                return 0;
            }
        """;
        String expectedOutput = "42";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Pointer dereference should print 42");
    }

    @Test
    public void testPointerInFunction () throws IOException, InterruptedException {
        String code = """
            int foo(int* p){
                *p = 42;
            }
            
            int main() {
                int* p;
                int x;
                x = 5;
                p = &x;
                foo(p);
                print_i(x);
                return 0;
            }
        """;
        String expectedOutput = "42";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Pointer dereference in function should print 42");
    }

    @Test
    public void testShortCircuitAnd() throws IOException, InterruptedException {
        String code = """
            int x;
            int foo() {
                x = 10;
                return 0;
            }
            int bar() {
                x = 20;
                return 0;
            }
            int main() {
                x = 0;
                if (foo() && bar()) {
                } else {
                    print_i(x);
                }
                return 0;
            }
        """;
        String expectedOutput = "10";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Short-circuiting && should print 10");
    }

    @Test
    public void testShortCircuitOr() throws IOException, InterruptedException {
        String code = """
            int x;
            int foo() {
                x = 10;
                return 1;
            }
            int bar() {
                x = 20;
                return 0;
            }
            int main() {
                x = 0;
                if (foo() || bar()) {
                    print_i(x);
                }
                return 0;
            }
        """;
        String expectedOutput = "10";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Short-circuiting || should print 10");
    }

    @Test
    public void testString() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_s((char*)"Hello, world!");
                return 0;
            }
        """;
        String expectedOutput = "Hello, world!";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "print_s(\"Hello, world!\") should print Hello, world!");
    }

    @Test
    public void testCharReturn() throws IOException, InterruptedException {
        String code = """
            char foo() {
                return 'a';
            }
            int main() {
                print_c(foo());
                return 0;
            }
        """;
        String expectedOutput = "a";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "char foo() { return 'a'; } print_c(foo()); should print a");
    }

    @Test
    public void testMultiDimArray() throws IOException, InterruptedException {
        String code = """
            int main() {
                int arr[2][3];
                arr[0][0] = 1;
                arr[0][1] = 2;
                arr[0][2] = 3;
                arr[1][0] = 4;
                arr[1][1] = 5;
                arr[1][2] = 6;
                print_i(arr[0][0]);
                print_i(arr[0][1]);
                print_i(arr[0][2]);
                print_i(arr[1][0]);
                print_i(arr[1][1]);
                print_i(arr[1][2]);
                return 0;
            }
        """;
        String expectedOutput = "123456";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Multi-dimensional array access should print 123456");
    }

    @Test
    public void testSizeOf() throws IOException, InterruptedException {
        String code = """
                struct foo {
                    int x;
                    char y;
                };
                struct S1 {
                   char c1;
                   char c2;
                   int a;
                   char c3;
                 };
                 struct S2 {
                   char c1;
                   char c2;
                   char c3;
                 };
                 struct S3 {
                   char c1;
                   struct S1 s;
                   char c2;\s
                 };
                 struct S4 {
                   char c1;
                   struct S2 s;
                   char c2;\s
                 };
                 struct S5 {
                    struct S2 arr[3];
                 };
                                                                 
                    int main() {
                        print_i(sizeof(int));
                        print_c(',');
                        print_i(sizeof(char));
                        print_c(',');
                        print_i(sizeof(int*));
                        print_c(',');
                        print_i(sizeof(char*));
                        print_c(',');
                        print_i(sizeof(struct foo));
                        print_c(',');
                        print_i(sizeof(struct S1));
                        print_c(',');
                        print_i(sizeof(struct S2));
                        print_c(',');
                        print_i(sizeof(struct S3));
                        print_c(',');
                        print_i(sizeof(struct S4));
                        print_c(',');
                        print_i(sizeof(struct S5));
                        return 0;
                    }
                """;
        String expectedOutput = "4,1,4,4,8,12,3,20,5,9";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "sizeof(int), sizeof(char), sizeof(int*), sizeof(char*) should print 4,1,4,4,8,12,3,20,5");
    }

    @Test
    public void testSizeOfStruct() throws IOException, InterruptedException {
        String code = """
               struct S1 {
                     char c1;
                     char c2;
                     int a;
                     char c3;
               };
                   
               struct Point {
                    char a;
                    char b;
                    struct S1 lol[3];
                };

                   
                int main() {
                    print_i(sizeof(struct S1));
                    print_c(',');
                    print_i(sizeof(struct Point));
                    return 0;
                }
                """;
        String expectedOutput = "12,40";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Should be size 12");
    }

    @Test
    public void testStructAssignment() throws IOException, InterruptedException {
        String code = """
            struct Point {
                int x;
                int y;
            };
            
            int main() {
                struct Point p1;
                struct Point p2;
                
                p1.x = 10;
                p1.y = 20;
                
                p2 = p1;  // Should copy the values
                p1.x = 30; // Modifying p1 should not affect p2
                
                print_i(p2.x); // Should be 10
                print_i(p2.y); // Should be 20
                return 0;
            }
        """;
        String expectedOutput = "1020";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Struct assignment should copy values");
    }

    @Test
    public void testNestedStructAssignment() throws IOException, InterruptedException {
        String code = """
            struct Inner {
                int val;
                char c;
            };
            
            struct Outer {
                struct Inner inner;
                int x;
            };
            
            int main() {
                struct Outer o1;
                struct Outer o2;
                
                o1.inner.val = 42;
                o1.inner.c = 'A';
                o1.x = 10;
                
                o2 = o1;  // Should perform deep copy
                o1.inner.val = 99; // Modifying o1 should not affect o2
                o1.inner.c = 'Z';
                
                print_i(o2.inner.val); // Should be 42
                print_c(o2.inner.c);   // Should be 'A'
                print_i(o2.x);         // Should be 10
                return 0;
            }
        """;
        String expectedOutput = "42A10";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Nested struct assignment should copy all values");
    }

    @Test
    public void testStructPassByValue() throws IOException, InterruptedException {
        String code = """
            struct Data {
                int a;
                int b;
            };
            
            int modify(struct Data d) {
                d.a = 99;  // This should modify the local copy only
                d.b = 88;  // Not the original
                return 0;
            }
            
            int main() {
                struct Data data;
                data.a = 10;
                data.b = 20;
                
                modify(data);  // Should pass by value
                
                print_i(data.a); // Should still be 10
                print_i(data.b); // Should still be 20
                return 0;
            }
        """;
        String expectedOutput = "1020";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Structs should be passed by value to functions");
    }
//
//    @Ignore("Requires stdin")
//    @Test
//    public void testReadI() throws IOException, InterruptedException {
//        String code = """
//            int main() {
//                int x;
//                int y;
//                x = read_i();
//                y = read_i();
//                print_i(x+y);
//                return 0;
//            }
//        """;
//        String expectedOutput = "";
//        String output = runCode(code);
//        assertEquals(expectedOutput, output, "Empty main should produce no output");
//    }
//
//    @Ignore("Requires stdin")
//    @Test
//    public void testReadC() throws IOException, InterruptedException {
//        String code = """
//            int main() {
//                char x;
//                char y;
//                x = read_c();
//                y = read_c();
//                print_c(x);
//                print_c(y);
//                return 0;
//            }
//        """;
//        String expectedOutput = "";
//        String output = runCode(code);
//        assertEquals(expectedOutput, output, "Empty main should produce no output");
//    }
//
    @Test
    public void testMcmalloc() throws IOException, InterruptedException {
        String code = """
        int main() {
            int *p;
            p = (int*) mcmalloc(sizeof(int));
            *p = 1234;
            print_i(*p);
            return 0;
        }
    """;
        String expectedOutput = "1234";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "mcmalloc should correctly allocate memory and support read/write operations");
    }

    @Test
    public void testFibonacci() throws IOException, InterruptedException {
        String code = """
                int fib_rec(int n) {
                    if (n < 2) {
                        return n;
                    } else {
                        return fib_rec(n-1) + fib_rec(n-2);
                    }
                }
                
                int fib_iter(int n) {
                    int a;
                    int b;
                    int temp;
                    int i;
                    a = 0;
                    b = 1;
                    if (n == 0) {
                        return 0;
                    }
                    i = 1;
                    while (i < n) {
                        temp = a + b;
                        a = b;
                        b = temp;
                        i = i + 1;
                    }
                    return b;
                }
                        
                
                int main() {
                    print_i(fib_iter(10));
                    print_c(',');
                    print_i(fib_rec(10));
                    return 0;
                }
                """;
        String expectedOutput = "55,55";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Both recursive and iterative Fibonacci functions should return 55 for input 10");
    }

    @Test
    public void testHelloWorld() throws IOException, InterruptedException {
        String code = """
            int main() {
                print_s((char*)"Hello World");
            }
        """;
        String expectedOutput = "Hello World";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Should print hello world");
    }

    @Test
    public void testRecursiveStructReturnAndMcmalloc() throws IOException, InterruptedException {
        String code = """
        // Define a Node struct with an integer value and a pointer to the next Node.
        struct Node {
            int value;
            struct Node* next;
            int exists;
            int hasNext;
        };
        
        // Recursive function that returns a Node struct.
        // It allocates memory with mcmalloc for the 'next' node when needed.
        struct Node* createNode(int n) {
            struct Node* result;
            struct Node* nextNode;
            result = (struct Node*) mcmalloc(sizeof(struct Node));
            (*result).value = n;
            (*result).exists = 1;
            if (n == 0) {
                // Base case: termination of recursion.
            } else {
                // Allocate memory for the next node using mcmalloc,
                // then recursively build the next Node.
                nextNode = (struct Node*) mcmalloc(sizeof(struct Node));
                nextNode = createNode(n - 1);
                (*result).next = nextNode;
                (*result).hasNext = 1;
            }
            return result;
        }
        
        int main() {
            // Create a linked list starting from 3 down to 0.
            struct Node head;
            struct Node* current;
            
            current = &head;
            head = *createNode(3);
            
            // Traverse the list and print each node's value.
            // A comma is printed between values (but not after the last value).
            while ((*current).exists) {
                print_i((*current).value);
                if ((*current).hasNext) {
                    print_c(',');
                } else {
                    break;
                }
                current = (*current).next;
            }
            return 0;
        }
    """;
        String expectedOutput = "3,2,1,0";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Recursive struct return with mcmalloc should produce 3,2,1,0");
    }

    @Test
    public void test3DArray() throws IOException, InterruptedException {
        String code = """
            int main() {
                int arr[2][2][2];
                arr[0][0][0] = 1;
                arr[0][0][1] = 2;
                arr[0][1][0] = 3;
                arr[0][1][1] = 4;
                arr[1][0][0] = 5;
                arr[1][0][1] = 6;
                arr[1][1][0] = 7;
                arr[1][1][1] = 8;
                print_i(arr[0][0][0]);
                print_i(arr[0][0][1]);
                print_i(arr[0][1][0]);
                print_i(arr[0][1][1]);
                print_i(arr[1][0][0]);
                print_i(arr[1][0][1]);
                print_i(arr[1][1][0]);
                print_i(arr[1][1][1]);
                return 0;
            }
        """;
        String expectedOutput = "12345678";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "3D array test should print 12345678");
    }

    @Test
    public void testMultiDimCharArray() throws IOException, InterruptedException {
        String code = """
            int main() {
                char arr[2][3];
                arr[0][0] = 'H';
                arr[0][1] = 'i';
                arr[0][2] = '!';
                arr[1][0] = 'B';
                arr[1][1] = 'y';
                arr[1][2] = 'e';
                print_c(arr[0][0]);
                print_c(arr[0][1]);
                print_c(arr[0][2]);
                print_c(arr[1][0]);
                print_c(arr[1][1]);
                print_c(arr[1][2]);
                return 0;
            }
        """;
        String expectedOutput = "Hi!Bye";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Multi-dimensional char array should print 'Hi!Bye'");
    }

    @Test
    public void testMultiDimArrayWithLoop() throws IOException, InterruptedException {
        String code = """
            int main() {
                int arr[3][3];
                int i;
                int j;
                arr[0][0] = 1;
                arr[0][1] = 2;
                arr[0][2] = 3;
                arr[1][0] = 4;
                arr[1][1] = 5;
                arr[1][2] = 6;
                arr[2][0] = 7;
                arr[2][1] = 8;
                arr[2][2] = 9;
                i = 0;
                while (i < 3) {
                    j = 0;
                    while (j < 3) {
                        print_i(arr[i][j]);
                        j = j + 1;
                    }
                    i = i + 1;
                }
                return 0;
            }
        """;
        String expectedOutput = "123456789";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Looping through multi-dimensional array should print 123456789");
    }

    @Test
    public void testArrayWithStructs() throws IOException, InterruptedException {
        String code = """
        // Define a struct 'Point' with two integer fields.
        struct Point {
            char a;
            char b;
            int x;
            char c;
            int y;
        };
        
        int main() {
            // Declare an array of three Points.
            struct Point pts[3];
            
            // Initialize the array elements.
            pts[0].x = 1;
            pts[0].y = 2;
            pts[1].x = 3;
            pts[1].y = 4;
            pts[2].x = 5;
            pts[2].y = 6;
            
            // Print the values of each Point in the array.
            print_i(pts[0].x);
            print_i(pts[0].y);
            print_i(pts[1].x);
            print_i(pts[1].y);
            print_i(pts[2].x);
            print_i(pts[2].y);
            return 0;
        }
    """;
        String expectedOutput = "123456";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Array of structs should correctly store and access struct elements");
    }

    @Test
    public void testSortLinkedListWithFlags() throws IOException, InterruptedException {
        String code = """
        struct Node {
            int val;
            struct Node* next;
            int exists;
            int hasNext;
        };

        struct Node* newNode(int val) {
            struct Node* node;
            node = (struct Node*) mcmalloc(sizeof(struct Node));
            (*node).val = val;
            (*node).exists = 1;
            (*node).hasNext = 0;
            return node;
        }

        void sortList(struct Node* head) {
            int swapped;
            struct Node* ptr;
            swapped = 1;
            while (swapped) {
                swapped = 0;
                ptr = head;
                while ((*ptr).hasNext) {
                    if ((*ptr).val > (*((*ptr).next)).val) {
                        int temp;
                        temp = (*ptr).val;
                        (*ptr).val = (*((*ptr).next)).val;
                        (*((*ptr).next)).val = temp;
                        swapped = 1;
                    }
                    ptr = (*ptr).next;
                }
            }
        }

        int main() {
            struct Node* head;
            struct Node* second;
            struct Node* third;
            struct Node* fourth;
            struct Node* current;
            
            head = newNode(3);
            second = newNode(1);
            third = newNode(4);
            fourth = newNode(2);
            
            (*head).next = second;
            (*head).hasNext = 1;
            
            (*second).next = third;
            (*second).hasNext = 1;
            
            (*third).next = fourth;
            (*third).hasNext = 1;
            
            sortList(head);
            
            current = head;
            while (1) {
                print_i((*current).val);
                if ((*current).hasNext) {
                    print_c(',');
                    current = (*current).next;
                } else {
                    break;
                }
            }
            return 0;
        }
    """;
        String expectedOutput = "1,2,3,4";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Sorting a linked list with exists/hasNext flags should result in 1,2,3,4");
    }

    @Test
    public void testFuncallMultiDimArray() throws IOException, InterruptedException {
        String code = """
        int sumMatrix(int m[2][3]) {
            int i;
            int j;
            int sum;
            i = 0;
            sum = 0;
            while (i < 2) {
                j = 0;
                while (j < 3) {
                    sum = sum + m[i][j];
                    j = j + 1;
                }
                i = i + 1;
            }
            return sum;
        }
        
        int main() {
            int arr[2][3];
            arr[0][0] = 1;
            arr[0][1] = 2;
            arr[0][2] = 3;
            arr[1][0] = 4;
            arr[1][1] = 5;
            arr[1][2] = 6;
            print_i(sumMatrix(arr));
            return 0;
        }
    """;
        String expectedOutput = "21";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Function call with multi-dimensional array should return 21");
    }

    @Test
    public void testArrayInStruct() throws IOException, InterruptedException {
        String code = """
        struct Data {
            int nums[4];
            char a;
            char b;
            char c;
            int random;
            char letters[2];
        };
        
        int main() {
            struct Data d;
            d.nums[0] = 5;
            d.nums[1] = 10;
            d.nums[2] = 15;
            d.nums[3] = 20;
            d.letters[0] = 'a';
            d.letters[1] = 'b';
            print_i(d.nums[0]);
            print_c(',');
            print_i(d.nums[1]);
            print_c(',');
            print_i(d.nums[2]);
            print_c(',');
            print_i(d.nums[3]);
            print_c(',');
            print_c(d.letters[0]);
            print_c(',');
            print_c(d.letters[1]);
            return 0;
        }
    """;
        String expectedOutput = "5,10,15,20,a,b";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Array in struct should produce 5,10,15,20");
    }


    @Test
    public void testFuncallMultiDimArrayGlobal() throws IOException, InterruptedException {
        String code = """
        int sumMatrix(int m[2][3]) {
            int i;
            int j;
            int sum;
            i = 0;
            sum = 0;
            while (i < 2) {
                j = 0;
                while (j < 3) {
                    sum = sum + m[i][j];
                    j = j + 1;
                }
                i = i + 1;
            }
            return sum;
        }
        
        int arr[2][3];
        
        int main() {
            arr[0][0] = 1;
            arr[0][1] = 2;
            arr[0][2] = 3;
            arr[1][0] = 4;
            arr[1][1] = 5;
            arr[1][2] = 6;
            print_i(sumMatrix(arr));
            return 0;
        }
    """;
        String expectedOutput = "21";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Function call with multi-dimensional array should return 21");
    }

    @Test
    public void testArrayInStructGlobal() throws IOException, InterruptedException {
        String code = """
        struct Data {
            int nums[4];
            char a;
            char b;
            char c;
            int random;
            char letters[2];
        };
        
        struct Data d;
        
        int main() {
            d.nums[0] = 5;
            d.nums[1] = 10;
            d.nums[2] = 15;
            d.nums[3] = 20;
            d.letters[0] = 'a';
            d.letters[1] = 'b';
            print_i(d.nums[0]);
            print_c(',');
            print_i(d.nums[1]);
            print_c(',');
            print_i(d.nums[2]);
            print_c(',');
            print_i(d.nums[3]);
            print_c(',');
            print_c(d.letters[0]);
            print_c(',');
            print_c(d.letters[1]);
            return 0;
        }
    """;
        String expectedOutput = "5,10,15,20,a,b";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Array in struct should produce 5,10,15,20");
    }

    @Test
    public void testShadowing() throws IOException, InterruptedException {
        String code = """
        int x; // global variable
        int y; // global variable

        int f(int x) {
            print_i(x);  // should print 50
            print_c(',');
            {
                int y;
                y = 300;
                print_i(y);  // should print 300
            }
            return 0;
        }

        int main() {
            int x; // local x shadows global x
            int y; // local y shadows global y
            x = 10;
            y = 20;
            print_i(x);  // prints 10
            print_c(',');
            print_i(y);  // prints 20
            print_c(',');
            {
                int x;  // new block shadows outer x
                x = 30;
                print_i(x);  // prints 30
                print_c(',');
            }
            print_i(x);  // outer x remains 10
            print_c(',');
            f(50);       // f prints "50,300,"
            print_c(',');
            print_i(x);  // prints 10
            return 0;
        }
    """;
        String expectedOutput = "10,20,30,10,50,300,10";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Shadowing test should produce 10,20,30,10,50,300,10");
    }


    @Test
    public void testDecimalToBin() throws IOException, InterruptedException {
        String code = """
            void decToBin(int num) {
                int idx;
                int result[20];
                
                idx = 0;
                while (num) {
                    int remainder;
                    remainder = num % 2;
                    result[idx] = remainder;
                    idx = idx + 1;
                    num = num / 2;
                }
                idx = idx - 1;
                
                while (idx > -1) {
                    print_i(result[idx]);
                    idx = idx - 1;
                }
            }
            
            int main() {
                decToBin(22);
                return 0;
            }
        """;
        String expectedOutput = "10110";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Shadowing test should produce 10,20,30,10,50,300,10");
    }

    @Test
    public void testFactorial() throws IOException, InterruptedException {
        String code = """
        int factorial_rec(int n) {
            if (n <= 1) {
                return 1;
            } else {
                return n * factorial_rec(n - 1);
            }
        }
        
        int factorial_iter(int n) {
            int result;
            result = 1;
            while (n > 1) {
                result = result * n;
                n = n - 1;
            }
            return result;
        }
        
        int main() {
            print_i(factorial_rec(5));
            print_c(',');
            print_i(factorial_iter(5));
            return 0;
        }
    """;
        String expectedOutput = "120,120";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Factorial test should produce 120,120");
    }

    @Test
    public void testEscapeCharacters() throws IOException, InterruptedException {
        String code = """
        int main() {
            print_s((char*)"Hello\\nWorld\\tTabbed\\nBackslash: \\\\ \\nQuote: \\\"");
            return 0;
        }
        """;
        String expectedOutput = "Hello\nWorld\tTabbed\nBackslash: \\ \nQuote: \"";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Escape characters should be correctly interpreted");
    }

    @Test
    public void testReturnValStruct() throws IOException, InterruptedException {
        String code = """
                        struct Point {
                          int x;
                          int y;
                        };
                               
                        void modifyPoint(struct Point p) {
                          // Modify the struct passed by value
                          p.x = 100;
                          p.y = 200;
                               
                          // Print the modified values inside the function
                          print_i(p.x);
                          print_s((char*)" ");
                          print_i(p.y);
                          print_s((char*)" ");
                        }
                               
                        void main() {
                          struct Point original;
                               
                          // Initialize the struct
                          original.x = 10;
                          original.y = 20;
                               
                          // Print original values before function call
                          print_i(original.x);
                          print_s((char*)" ");
                          print_i(original.y);
                          print_s((char*)" ");
                               
                          // Call function passing struct by value
                          modifyPoint(original);
                               
                          // Print original values after function call
                          // These should remain unchanged if struct is truly passed by value
                          print_i(original.x);
                          print_s((char*)" ");
                          print_i(original.y);
                        }
                """;
        String expectedOutput = "10 20 100 200 10 20";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Escape characters should be correctly interpreted");
    }

    @Test
    public void testEscapeCharactersInStringLiteral() throws IOException, InterruptedException {
        String code = """
        int main() {
            print_s((char*)"A\\aB\\bC\\nD\\rE\\tF\\\\G\\'H\\\"I\\0J");
            return 0;
        }
        """;
        String expectedOutput = "A\u0007B\u0008C\nD\rE\tF\\G'H\"I";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Escape characters in string literal should be correctly interpreted");
    }

    @Test
    public void testEscapeCharactersUsingPrintC() throws IOException, InterruptedException {
        String code = """
        int main() {
            print_c('A');
            print_c('\\a');
            print_c('B');
            print_c('\\b');
            print_c('C');
            print_c('\\n');
            print_c('D');
            print_c('\\r');
            print_c('E');
            print_c('\\t');
            print_c('F');
            print_c('\\\\');
            print_c('G');
            print_c('\\\'');
            print_c('H');
            print_c('\\\"');
            print_c('I');
            print_c('\\0');
            return 0;
        }
        """;
        String expectedOutput = "A\u0007B\u0008C\nD\rE\tF\\G'H\"I\0";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Escape characters printed using print_c should produce the correct output");
    }

    @Test
    public void testGlobalAlignment() throws IOException, InterruptedException {
        String code = """
        // Global variable declarations
        int gi;             // global int
        char gc;            // global char
        int gtarget;        // target for pointer test
        int* gptr;          // global pointer
        int ga[3];          // global int array

        // A simple struct with an int and a char
        struct S {
            int a;
            char b;
        };
        struct S gs;        // global struct variable

        // A nested struct containing an array of struct S and an extra char
        struct Nested {
            struct S arr[2];
            char c;
        };
        struct Nested gn;   // global nested struct

        // Main function: assign values and then print them
        int main() {
            gi = 100;
            gc = 'Z';
            gtarget = 200;
            gptr = &gtarget;
            ga[0] = 1;
            ga[1] = 2;
            ga[2] = 3;
            gs.a = 400;
            gs.b = 'Q';
            gn.arr[0].a = 500;
            gn.arr[0].b = 'W';
            gn.arr[1].a = 600;
            gn.arr[1].b = 'E';
            gn.c = 'N';

            // Print all global values in sequence
            print_i(gi);      // 100
            print_c(gc);      // Z
            print_i(*gptr);   // 200
            print_i(ga[0]);   // 1
            print_i(ga[1]);   // 2
            print_i(ga[2]);   // 3
            print_i(gs.a);    // 400
            print_c(gs.b);    // Q
            print_i(gn.arr[0].a); // 500
            print_c(gn.arr[0].b); // W
            print_i(gn.arr[1].a); // 600
            print_c(gn.arr[1].b); // E
            print_c(gn.c);        // N
            return 0;
        }
        """;
        String expectedOutput = "100Z200123400Q500W600EN";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Global variable alignment test failed");
    }

    @Test
    public void testStructPaddingSimple() throws IOException, InterruptedException {
        String code = """
        struct Test1 {
            char a;
            int b;
            char c;
        };

        int main() {
            struct Test1 t;
            t.a = 'A';
            t.b = 1234;
            t.c = 'B';
            print_c(t.a);
            print_i(t.b);
            print_c(t.c);
            return 0;
        }
        """;
        String expectedOutput = "A1234B";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Struct padding simple test failed");
    }

    @Test
    public void testArrayOfStructs() throws IOException, InterruptedException {
        String code = """
        struct Data {
            char a;
            int b;
        };

        struct Data arr[3];

        int main() {
            arr[0].a = 'X'; arr[0].b = 10;
            arr[1].a = 'Y'; arr[1].b = 20;
            arr[2].a = 'Z'; arr[2].b = 30;
            print_c(arr[0].a);
            print_i(arr[0].b);
            print_c(arr[1].a);
            print_i(arr[1].b);
            print_c(arr[2].a);
            print_i(arr[2].b);
            return 0;
        }
        """;
        String expectedOutput = "X10Y20Z30";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Array of structs test failed");
    }

    @Test
    public void testCharIntGlobalOrder() throws IOException, InterruptedException {
        String code = """
        char c;
        int i;

        int main() {
            c = 'F';
            i = 2022;
            print_c(c);
            print_i(i);
            return 0;
        }
        """;
        String expectedOutput = "F2022";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Global char and int order test failed");
    }

    @Test
    public void testComplexNestedStruct() throws IOException, InterruptedException {
        String code = """
        struct Inner {
            char a;
            int b;
        };

        struct Outer {
            int x;
            struct Inner in;
            char c;
        };

        struct Outer o;

        int main() {
            o.x = 111;
            o.in.a = 'K';
            o.in.b = 222;
            o.c = 'L';
            print_i(o.x);
            print_c(o.in.a);
            print_i(o.in.b);
            print_c(o.c);
            return 0;
        }
        """;
        String expectedOutput = "111K222L";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Complex nested struct test failed");
    }

    @Test
    public void testMixedGlobals() throws IOException, InterruptedException {
        String code = """
        int i1;
        char c1;
        int i2;
        struct Mixed {
            char a;
            int b;
            char c;
        };
        struct Mixed m1;
        char c2;

        int main() {
            i1 = 111;
            c1 = 'A';
            i2 = 222;
            m1.a = 'B';
            m1.b = 333;
            m1.c = 'C';
            c2 = 'D';
            print_i(i1);
            print_c(c1);
            print_i(i2);
            print_c(m1.a);
            print_i(m1.b);
            print_c(m1.c);
            print_c(c2);
            return 0;
        }
        """;
        String expectedOutput = "111A222B333CD";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Mixed globals alignment test failed");
    }


    // TODO: fix this test
    @Test
    public void testArrayFunCall() throws IOException, InterruptedException {
        String code = """
                    struct Point {
                        char y[5];
                        int x[5];
                    };
                    
                    void modify(int arr[5]) {
                        arr[0] = 7;
                        arr[1] = 6;
                    }
                    
                    void modifyChar(char arr[5]) {
                        arr[2] = 'c';
                        arr[3] = 'd';
                    }
                    
                    int main() {
                        struct Point p;
                        modify(p.x);
                        modifyChar(p.y);
                        print_i(p.x[0]);
                        print_i(p.x[1]);
                        print_c(p.y[2]);
                        print_c(p.y[3]);
                        return 0;
                    }
                """;
        String output = runCode(code);
        assertEquals("76cd", output);
    }

    // TODO fix this
    @Test
    public void testArrayPassedByRef() throws IOException, InterruptedException {
        String code = """
                        struct Container {
                          char letters[3];
                          int values[3];
                          char tag;
                        };
                                
                        void modifyValues(int* values, int size) {
                          int i;
                          i = 0;
                          while (i < size) {
                            values[i] = values[i] * 2;
                            i = i + 1;
                          }
                        }
                        
                        void modifyLetters(char* letters, int size) {
                          int i;
                          i = 0;
                          while (i < size) {
                            letters[i] = 'd';
                            i = i + 1;
                          }
                        }
                                
                         
                        void main() {
                         struct Container grid[2][2][2];
                                
                          int i;
                          int j;
                          int k;
                                
                          i = 0;
                                
                          while (i < 2) {
                            j = 0;
                                
                            while (j < 2) {
                              k = 0;
                                
                              while (k < 2) {
                                int letterOffset;
                                
                                grid[i][j][k].values[0] = i*100 + j*10 + k + 1;
                                grid[i][j][k].values[1] = i*100 + j*10 + k + 2;
                                grid[i][j][k].values[2] = i*100 + j*10 + k + 3;
                                grid[i][j][k].letters[0] = 'a';
                                grid[i][j][k].letters[1] = 'b';
                                grid[i][j][k].letters[2] = 'c';
                                
                                letterOffset = i + j + k;
                                
                                
                                if (letterOffset == 0) {
                                  grid[i][j][k].tag = 'A';
                                }
                                
                                if (letterOffset == 1) {
                                  grid[i][j][k].tag = 'B';
                                }
                                
                                if (letterOffset == 2) {
                                  grid[i][j][k].tag = 'C';
                                }
                                
                                if (letterOffset == 3) {
                                  grid[i][j][k].tag = 'D';
                                }
                                
                                k = k + 1;
                              }
                                
                              j = j + 1;
                            }
                                
                            i = i + 1;
                          }
                                
                          // Print values before modification
                          print_i(grid[1][1][0].values[0]);
                          print_c(grid[1][1][0].letters[0]);
                          print_s((char*)" ");
                          print_i(grid[1][1][0].values[1]);
                          print_c(grid[1][1][0].letters[1]);
                          print_s((char*)" ");
                          print_i(grid[1][1][0].values[2]);
                          print_c(grid[1][1][0].letters[2]);
                          print_s((char*)" ");
                          print_c(grid[1][1][0].tag);
                          print_s((char*)"\\n");
                                
                          // Typecast and modify the array inside the struct
                          modifyValues((int*) grid[1][1][0].values, 3);
                          modifyLetters((char*) grid[1][1][0].letters, 3);
                                
                          // Print values after modification
                          print_i(grid[1][1][0].values[0]);
                          print_c(grid[1][1][0].letters[0]);
                          print_s((char*)" ");
                          print_i(grid[1][1][0].values[1]);
                          print_c(grid[1][1][0].letters[1]);
                          print_s((char*)" ");
                          print_i(grid[1][1][0].values[2]);
                          print_c(grid[1][1][0].letters[2]);
                          print_s((char*)" ");
                          print_c(grid[1][1][0].tag);
                        }
                """;
        String output = runCode(code);
        assertEquals("111a 112b 113c C\n222d 224d 226d C", output);
    }

    @Test
    public void testShadowingIfElseBlocks() throws IOException, InterruptedException {
        String code = """
        int main() {
            int val;
            val = 100;
            if (val == 100) {
                int val;
                val = 200;
                print_i(val);  // prints 200 (inner if-block)
                print_c(',');
            } else {
                int val;
                val = 300;
                print_i(val);  // would print 300 if executed
                print_c(',');
            }
            print_i(val); // prints 100 (outer variable remains unchanged)
            return 0;
        }
    """;
        String expectedOutput = "200,100";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "If-Else block shadowing test failed");
    }

    @Test
    public void testConsecutiveBlockShadowing() throws IOException, InterruptedException {
        String code = """
        int main() {
            int x;
            x = 5;
            {
                int x;
                x = 6;
                print_i(x);  // prints 6
                print_c(',');
            }
            {
                int x;
                x = 7;
                print_i(x);  // prints 7
                print_c(',');
            }
            print_i(x);  // prints 5 (outer x remains unchanged)
            return 0;
        }
    """;
        String expectedOutput = "6,7,5";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Consecutive block shadowing test failed");
    }

    @Test
    public void testShadowingInLoopWithInnerBlock() throws IOException, InterruptedException {
        String code = """
        int main() {
            int counter;
            counter = 0;
            while (counter < 3) {
                {
                    int counter;
                    counter = 50;
                    print_i(counter);  // prints 50 (inner block variable)
                    print_c(',');
                }
                print_i(counter);  // prints outer counter (0, then 1, then 2)
                if (counter < 2) {  // add separator only between iterations
                    print_c(',');
                }
                counter = counter + 1;
            }
            return 0;
        }
    """;
        // Expected for each iteration:
        // Iteration 0: inner prints 50, then outer prints 0 → "50,0"
        // Iteration 1: inner prints 50, then outer prints 1 → "50,1"
        // Iteration 2: inner prints 50, then outer prints 2 → "50,2"
        // Combined expected output: "50,0,50,1,50,2"
        String expectedOutput = "50,0,50,1,50,2";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Loop with inner block shadowing test failed");
    }
    @Test
    public void testGlobalShadowingLocal() throws IOException, InterruptedException {
        String code = """
        int a;  // global variable 'a'
        void init() {
            a = 10;
        }
        int main() {
            init();
            print_i(a);  // prints global a: 10
            print_c(',');
            {
                int a;  // local 'a' shadows global
                a = 20;
                print_i(a);  // prints local a: 20
                print_c(',');
            }
            print_i(a);  // prints global a again: 10
            return 0;
        }
    """;
        String expectedOutput = "10,20,10";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Local declaration should shadow the global variable within its block.");
    }

    @Test
    public void testGlobalShadowingInFunctionParameter() throws IOException, InterruptedException {
        String code = """
        int x; // global variable 'x'
        void init() {
            x = 5;
        }
        int f(int x) {  // parameter 'x' shadows global 'x'
            print_i(x); // prints parameter value: value passed to f()
            return 0;
        }
        int main() {
            init();
            print_i(x); // prints global x: 5
            print_c(',');
            f(15);      // prints 15 (function parameter)
            print_c(',');
            print_i(x); // prints global x again: 5
            return 0;
        }
    """;
        String expectedOutput = "5,15,5";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Function parameters should shadow globals without modifying them.");
    }

    @Test
    public void testGlobalShadowingAcrossFunctions() throws IOException, InterruptedException {
        String code = """
        int g;  // global variable 'g'
        void init() {
            g = 100;
        }
        int f() {
            print_i(g);  // prints global g: 100
            return 0;
        }
        int main() {
            int g;  // local g in main shadows the global in main's scope only
            init();
            g = 200;
            print_i(g);   // prints local g: 200
            print_c(',');
            f();          // prints 100, because f() uses the global g
            print_c(',');
            print_i(g);   // prints local g: 200
            return 0;
        }
    """;
        String expectedOutput = "200,100,200";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Functions without local shadowing should access the global variable.");
    }

    @Test
    public void testGlobalAndLocalMultipleShadowing() throws IOException, InterruptedException {
        String code = """
        int a;  // global variable 'a'
        int init() {
            a = 5;
        }
        int main() {
            init();
            print_i(a);   // prints global a: 5
            print_c(',');
            {
                int a;  // shadowing global a
                a = 10;
                print_i(a);  // prints local a: 10
                print_c(',');
                {
                    int a; // further shadowing in inner block
                    a = 15;
                    print_i(a);  // prints innermost a: 15
                    print_c(',');
                }
                print_i(a);    // prints the inner block a: 10
                print_c(',');
            }
            print_i(a);        // prints global a: 5
            return 0;
        }
    """;
        String expectedOutput = "5,10,15,10,5";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Multiple nested levels should preserve their own variable values and leave globals unchanged.");
    }

    @Test
    public void testGlobalShadowingWithParameterInnerBlock() throws IOException, InterruptedException {
        String code = """
        int b; // global variable 'b'
        int init() {
            b = 50;
        }
        int f(int b) { // parameter 'b' shadows global 'b'
            print_i(b); // prints function parameter: 100 (if passed 100)
            print_c(',');
            {
                int b; // inner block variable shadows function parameter
                b = 75;
                print_i(b); // prints 75
                print_c(',');
            }
            print_i(b); // prints original parameter value: 100
            return 0;
        }
        int main() {
            init();
            print_i(b);  // prints global b: 50
            print_c(',');
            f(100);      // prints "100,75,100"
            print_c(',');
            print_i(b);  // prints global b: 50 (unchanged)
            return 0;
        }
    """;
        String expectedOutput = "50,100,75,100,50";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Local and parameter shadowing should not affect the global variable.");
    }

    @Test
    public void testGlobalUsedInExpressionShadowing() throws IOException, InterruptedException {
        String code = """
        int c; // global variable 'c'
        int init() {
            c = 10;
        }
        int main() {
            int d;
            init();
            d = c + 5; // uses global c: 10 + 5 = 15
            print_i(d); // prints 15
            print_c(',');
            {
                int c; // local shadowing: now c is 20 in this block
                c = 20;
                d = c + 5; // 20 + 5 = 25
                print_i(d); // prints 25
                print_c(',');
            }
            d = c + 5; // outside block, global c is used: 10 + 5 = 15
            print_i(d); // prints 15
            return 0;
        }
    """;
        String expectedOutput = "15,25,15";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Expressions should use the nearest variable declaration in scope.");
    }
}
