package gen;

import ast.ASTPrinter;
import ast.Program;
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
                        return 0;
                    }
                """;
        String expectedOutput = "4,1,4,4,8,12,3,20,5";
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
                int remainder;
                int result[20];
                
                idx = 0;
                while (num) {
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
}
