package sem;

import static org.junit.jupiter.api.Assertions.*;

import ast.*;
import sem.SemanticAnalyzer;
import parser.Parser;
import lexer.Scanner;
import lexer.Tokeniser;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class SemanticAnalysisEndToEndTest {

    /**
     * Helper: writes the given input string to a temporary file,
     * parses it using our Parser, and returns the resulting Program AST.
     */
    private Program parseProgramFromString(String input) throws IOException {
        File tempFile = File.createTempFile("semanticTest", ".c");
        tempFile.deleteOnExit();
        try (PrintWriter pw = new PrintWriter(new FileWriter(tempFile))) {
            pw.write(input);
        }
        Scanner scanner = new Scanner(tempFile);
        Tokeniser tokeniser = new Tokeniser(scanner);
        Parser parser = new Parser(tokeniser);
        Program prog =  parser.parse();
        if (parser.hasErrors()) {
            System.out.println("Parser has errors");
            throw new AssertionError();
        }
        return prog;
    }

    /**
     * Helper: runs semantic analysis on the program represented by the input string.
     * Returns the total number of errors detected.
     */
    private int runSemanticAnalysis(String input) throws IOException {
        Program prog = parseProgramFromString(input);
        SemanticAnalyzer sem = new SemanticAnalyzer();
        sem.analyze(prog);
        return sem.getNumErrors();
    }

    /**
     * Test 1: Double struct declarations should produce errors.
     */
    @Test
    public void testDoubleStructDeclaration() throws IOException {
        String input = """
            struct Foo { int a; };
            struct Foo { int b; };
            int main() { return 0; }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Double struct declarations should produce semantic errors");
    }

    /**
     * Test 2: Duplicate field declarations inside a struct cause errors.
     */
    @Test
    public void testDuplicateFieldInStruct() throws IOException {
        String input = """
            struct Bar { int a; int a; };
            int main() { return 0; }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Duplicate field declarations inside a struct should produce errors");
    }

    /**
     * Test 3: A global variable with the same name as a struct type is allowed.
     * Also, using the identifier in expressions should resolve to the variable.
     */
    @Test
    public void testGlobalVariableSameNameAsStructType() throws IOException {
        String input = """
            struct Baz { int x; };
            int Baz;
            int main() { return Baz; }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Global variable with same name as struct type should not produce errors");
    }

    /**
     * Test 4: A global variable and a struct field may share an identifier.
     * For example, a global variable "x" and a struct S with a field "x" are both allowed.
     */
    @Test
    public void testGlobalAndStructFieldSameName() throws IOException {
        String input = """
            int x;
            struct S { int x; int y; };
            int main() { 
                struct S s; 
                x = 10;
                s.x = 5; 
                return x + s.y; 
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Global variable and struct field sharing the same name should be allowed");
    }

    /**
     * Test 5: Using an undeclared struct type should produce a semantic error.
     */
    @Test
    public void testUndeclaredStructTypeUsage() throws IOException {
        String input = """
            struct NonExistent s;
            int main() { return 0; }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Using an undeclared struct type should produce semantic errors");
    }

    /**
     * Test 6: A valid recursive struct using a pointer is allowed.
     */
    @Test
    public void testValidRecursiveStructUsingPointer() throws IOException {
        String input = """
            struct Node { int value; struct Node* next; };
            int main() { 
                struct Node n; 
                return n.value; 
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Valid recursive struct using a pointer should not produce errors");
    }

    /**
     * Test 7: A recursive struct declared by value (i.e. not through a pointer) should produce errors.
     */
    @Test
    public void testInvalidRecursiveStructWithoutPointer() throws IOException {
        String input = """
            struct Node { int value; struct Node next; };
            int main() { return 0; }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Invalid recursive struct (without pointer) should produce errors");
    }

    /**
     * Test 8: Field access on a struct should have the correct type inferred.
     */
    @Test
    public void testStructFieldAccessType() throws IOException {
        String input = """
            struct Point { int x; int y; };
            int main() { 
                struct Point p; 
                p.x = 5; 
                return p.x; 
            }
            """;
        Program prog = parseProgramFromString(input);
        SemanticAnalyzer sem = new SemanticAnalyzer();
        sem.analyze(prog);
        // Traverse the AST to locate a FieldAccessExpr node.
        FieldAccessExpr fae = findFieldAccess(prog);
        assertNotNull(fae, "Expected to find a field access expression");
        // The type of the field access should be int.
        assertEquals(BaseType.INT, fae.type, "Field access on struct should have type int");
    }

    /**
     * Helper: recursively search the AST for a FieldAccessExpr.
     */
    private FieldAccessExpr findFieldAccess(ASTNode node) {
        if (node instanceof FieldAccessExpr) {
            return (FieldAccessExpr) node;
        }
        for (ASTNode child : node.children()) {
            FieldAccessExpr found = findFieldAccess(child);
            if (found != null) {
                return found;
            }
        }
        return null;
    }

    @Test
    public void testFibonacci() throws IOException {
        String input = """
            // Fibonacci program
            int main() {
              int n;
              int first;
              int second;
              int next;
              n = read_i();
              first = 0;
              second = 1;
              while (n > 0) {
                next = first + second;
                first = second;
                second = next;
                n = n - 1;
              }
              return first;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Fibonacci program should be semantically correct");
    }

    @Test
    public void testArithmeticInterpreter() throws IOException {
        String input = """
            // Arithmetic interpreter: use arithmetic operations correctly
            int main() {
              int a;
              int b;
              a = 3 + 4 * (5 - 2);
              b = a / 2;
              return b;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Arithmetic interpreter should be semantically correct");
    }

    // not quite a working version but close enough
    @Test
    public void testSortLinkedList() throws IOException {
        String input = """
            // Sort linked list
            struct Node { int value; struct Node* next; };
            void sortList(struct Node* head) {
              if ((*head).value == 0) return;
              // Dummy body
              return;
            }
            int main() {
              struct Node a;
              a.value = 3;
              sortList(&a);
              return 0;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Sort linked list program should be semantically correct");
    }

    @Test
    public void testPassArrayWithCorrectSize() throws IOException {
        String input = """
            // Function expecting an array of 5 integers
            int foo(int a[5]) { return a[0]; }
            int main() {
              int arr[5];
              return foo(arr);
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Passing an array with the correct size should be semantically correct");
    }

    @Test
    public void testPassArrayWithIncorrectSize() throws IOException {
        String input = """
            // Function expecting an array of 5 integers
            int foo(int a[5]) { return a[0]; }
            int main() {
              int arr[3];
              return foo(arr);
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Passing an array with incorrect size should produce semantic errors");
    }

    @Test
    public void testPassArrayWithIncorrectDims() throws IOException {
        String input = """
            // Function expecting a 2D array of dimensions 3x4
            int foo(int a[3][4]) { return a[0][0]; }
            int main() {
              int arr[3][5];
              return foo(arr);
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Passing an array with incorrect dimensions should produce semantic errors");
    }

    @Test
    public void testMinimal() throws IOException {
        String input = """
            int main() { return 0; }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "A minimal program should be semantically correct");
    }

    @Test
    public void testGlobalDeclaration_1() throws IOException {
        String input = """
            int globalVar;
            int main() { return globalVar; }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "A valid global declaration should be semantically correct");
    }

    @Test
    public void testDuplicateGlobalDeclarations_1() throws IOException {
        String input = """
            int x;
            int x;
            int main() { return x; }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Duplicate global variable declarations should produce semantic errors");
    }

    @Test
    public void testDuplicateGlobalDeclarations_2() throws IOException {
        String input = """
            int foo(int a) { return a; }
            int foo(int a) { return a; }
            int main() { return foo(1); }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Duplicate global function declarations should produce semantic errors");
    }

    @Test
    public void testManyDuplicateGlobalDeclarations() throws IOException {
        String input = """
            int y;
            int y;
            int y;
            int main() { return y; }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Many duplicate global declarations should produce semantic errors");
    }

    @Test
    public void testGlobalShadowing_1() throws IOException {
        String input = """
            int x;
            int foo() { int x; return x; }
            int main() { return x; }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Local shadowing of a global variable (inside foo) should be semantically correct");
    }

    @Test
    public void testGlobalShadowing_2() throws IOException {
        // Here we simulate a problematic global shadowing case:
        // For example, if a function declaration conflicts with a global variable
        String input = """
            int x;
            int x() { return 5; }
            int main() { return x; }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Global shadowing conflict (variable and function with same name) should produce errors");
    }

    @Test
    public void testGlobalShadowing_3() throws IOException {
        // A case where a function declaration and a duplicate prototype conflict
        String input = """
            int x;
            int foo() { return 5; }
            int foo() { return 6; }
            int main() { return x; }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Duplicate function declarations (shadowing a global) should produce errors");
    }

    @Test
    public void testGlobalShadowing_4() throws IOException {
        String input = """
            int x;
            int foo() { int y; y = x; return y; }
            int main() { return x; }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Valid global shadowing where no conflict occurs should pass");
    }

    @Test
    public void testLocalShadowing_1() throws IOException {
        String input = """
            int main() {
              int a;
              a = 5;
              { int a; a = 10; }
              return a;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Local shadowing within nested blocks should be semantically correct");
    }

    @Test
    public void testLocalShadowing_2() throws IOException {
        String input = """
            int main() {
              int a;
              { int a; a = 10; return a; }
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Local shadowing with immediate usage should be semantically correct");
    }

    @Test
    public void testMutualRecursion() throws IOException {
        // Two mutually recursive functions that are declared but not defined correctly.
        String input = """
            int even(int n);
            int odd(int n);
            int even(int n) { if (n == 0) return 1; else return odd(n-1); }
            int odd(int n) { if (n == 0) return 0; else return even(n-1); }
            int main() { return even(4); }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Mutual recursion should not produce semantic errors");
    }

    @Test
    public void testUndeclaredFunction_1() throws IOException {
        String input = """
            int main() { return foo(1); }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Call to an undeclared function should produce semantic errors");
    }

    @Test
    public void testUndeclaredFunction_2() throws IOException {
        String input = """
            int main() { return bar(); }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Call to an undeclared function should produce semantic errors");
    }

    @Test
    public void testUndeclaredParameter() throws IOException {
        // Use a parameter that is not declared inside a function body.
        String input = """
            int foo(int a) { return b; }
            int main() { return foo(1); }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Using an undeclared parameter should produce semantic errors");
    }

    @Test
    public void testPrint_s() throws IOException {
        String input = """
            int main() {char* bruh; bruh = (char*) "hello"; print_s(bruh); return 0; }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Call to built-in print_s should be semantically correct");
    }

    @Test
    public void testPrint_i() throws IOException {
        String input = """
            int main() { print_i(123); return 0; }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Call to built-in print_i should be semantically correct");
    }

    @Test
    public void testPrint_c() throws IOException {
        String input = """
            int main() { print_c('a'); return 0; }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Call to built-in print_c should be semantically correct");
    }

    @Test
    public void testRead_i() throws IOException {
        String input = """
            int main() { int x; x = read_i(); return x; }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Call to built-in read_i should be semantically correct");
    }

    @Test
    public void testRead_c() throws IOException {
        String input = """
            char main() { char c; c = read_c(); return c; }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Call to built-in read_c should be semantically correct");
    }

    @Test
    public void testGlobalVariableAssignment_1() throws IOException {
        String input = """
            int x;
            int main() { x = 20; return x; }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Correct global variable assignment should be semantically correct");
    }

    @Test
    public void testGlobalVariableAssignment_2() throws IOException {
        // Type mismatch: global x is int, but assigned a char.
        String input = """
            int x;
            int main() { x = 'a'; return x; }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Global variable type should be respected in assignment");
    }

    @Test
    public void testLocalVariableAssignment_1() throws IOException {
        String input = """
            int main() {
              int x;
              x = 10;
              return x;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Correct local variable assignment should be semantically correct");
    }

    @Test
    public void testLocalVariableAssignment_2() throws IOException {
        // Type mismatch in local assignment
        String input = """
            int main() {
              int x;
              x = 'b';
              return x;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Local variable assignment with type mismatch should produce semantic errors");
    }

    @Test
    public void testVoidVariable() throws IOException {
        // Declare a variable of type void (should be an error)
        String input = """
            void x;
            int main() { return 0; }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Declaration of a variable of type void should produce semantic errors");
    }

    @Test
    public void testMainReturn_1() throws IOException {
        String input = """
            int main() { return 0; }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Main returning an int should be semantically correct");
    }

    @Test
    public void testMainReturn_2() throws IOException {
        // Main returns a char instead of int
        String input = """
            int main() { return 'a'; }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Main returning a char when int is expected should produce semantic errors");
    }

    @Test
    public void testArityMismatch_1() throws IOException {
        // Function foo expects one argument but is called with none.
        String input = """
            int foo(int a) { return a; }
            int main() { return foo(); }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Function call with arity mismatch should produce semantic errors");
    }

    @Test
    public void testArityMismatch_2() throws IOException {
        // Function foo expects two arguments but is called with one.
        String input = """
            int foo(int a, int b) { return a + b; }
            int main() { return foo(1); }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Function call with arity mismatch should produce semantic errors");
    }

    @Test
    public void testFunctionReturns_1() throws IOException {
        // Function returns correct type
        String input = """
            int foo() { return 5; }
            int main() { return foo(); }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Function returning correct type should be semantically correct");
    }

    @Test
    public void testFunctionReturns_2() throws IOException {
        // Function declared to return int returns a char
        String input = """
            int foo() { return 'a'; }
            int main() { return foo(); }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Function returning wrong type should produce semantic errors");
    }

    @Test
    public void testArithmetics_1() throws IOException {
        String input = """
            int main() {
              int a;
              a = 3 + 4 * 2;
              return a;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Valid arithmetic expressions should be semantically correct");
    }

    @Test
    public void testArithmetics_2() throws IOException {
        // Type error: adding int and char
        String input = """
            int main() {
              int a;
              a = 3 + 'b';
              return a;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Arithmetic expressions with type error should produce semantic errors");
    }

    @Test
    public void testArithmetics_3() throws IOException {
        // Type error: subtraction between mismatched types
        String input = """
            int main() {
              int a;
              a = 'a' - 2;
              return a;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Arithmetic expression with mismatched types should produce semantic errors");
    }

    @Test
    public void testFunctionCall_1() throws IOException {
        // Call a function with wrong argument types.
        String input = """
            int foo(int a) { return a; }
            int main() { return foo('a'); }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Function call with wrong argument type should produce semantic errors");
    }

    @Test
    public void testFunctionCall_2() throws IOException {
        // Correct function call.
        String input = """
            int foo(int a) { return a; }
            int main() { return foo(123); }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Correct function call should be semantically correct");
    }

    @Test
    public void testConditional_1() throws IOException {
        // If condition is not an int.
        String input = """
            int main() {
              if ('a') return 1; else return 0;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "If condition with non-int type should produce semantic errors");
    }

    @Test
    public void testConditional_2() throws IOException {
        // Else-if chain with wrong condition type.
        String input = """
            int main() {
              if (1) return 1;
              else if ("hello") return 0;
              else return 2;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "If condition with non-int type in else-if should produce semantic errors");
    }

    @Test
    public void testConditional_3() throws IOException {
        // Missing condition type check.
        String input = """
            int main() {
              if (2 + 2) return 1; else return 0;
            }
            """;
        int errors = runSemanticAnalysis(input);
        // Here, 2+2 is int so it should pass; we assume no error.
        assertEquals(0, errors, "Valid int condition in if should be semantically correct");
    }

    @Test
    public void testConditional_4() throws IOException {
        // Condition returns a char.
        String input = """
            int main() {
              if ('c') return 1; else return 0;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "If condition returning a char should produce semantic errors");
    }

    @Test
    public void testShadowing_6() throws IOException {
        // Local variable shadows an outer variable correctly.
        String input = """
            int x;
            int main() {
              int x;
              return x;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Valid local shadowing should be semantically correct");
    }

    @Test
    public void testShadowing_7() throws IOException {
        // Two nested blocks with valid shadowing.
        String input = """
            int main() {
              int x;
              {
                int x;
                {
                  int x;
                }
              }
              return x;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Valid nested shadowing should be semantically correct");
    }

    @Test
    public void testShadowing_12() throws IOException {
        // A problematic case: for instance, a function parameter and a local variable with the same name
        String input = """
            int foo(int x) { 
              int x; 
              x = 5;
              return x; 
            }
            int main() { return foo(1); }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Invalid shadowing (duplicate declaration in same scope) should produce semantic errors");
    }

    @Test
    public void testValidLvalues() throws IOException {
        String input = """
            int main() {
              int a;
              a = 10;
              return a;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Valid lvalue usage should be semantically correct");
    }

    @Test
    public void testInvalidLvalue() throws IOException {
        // Example: (a + 1) is not an lvalue.
        String input = """
            int main() {
              int a;
              (a + 1) = 5;
              return a;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Invalid lvalue usage should produce semantic errors");
    }

    @Test
    public void testStructDecl() throws IOException {
        // A struct declaration with a field type error (e.g., void field)
        String input = """
            struct S { void a; };
            int main() { return 0; }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Struct declaration with void field should produce semantic errors");
    }

    @Test
    public void testStructDeclAndUse() throws IOException {
        // A correct struct declaration and usage.
        String input = """
            struct S { int a; };
            int main() {
              struct S s;
              s.a = 10;
              return s.a;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Correct struct declaration and use should be semantically correct");
    }

    @Test
    public void testStructNesting() throws IOException {
        // A struct that contains another struct
        String input = """
            struct Inner { int a; };
            struct Outer { struct Inner in; int b; };
            int main() {
              struct Outer o;
              o.in.a = 5;
              return o.b;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Valid struct nesting should be semantically correct");
    }

    @Test
    public void testAssignmentExpression_1() throws IOException {
        String input = """
            int main() {
              int a;
              a = 5;
              return a;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "A correct assignment expression should be semantically correct");
    }

    @Test
    public void testAssignmentExpression_2() throws IOException {
        // Assignment type mismatch
        String input = """
            int main() {
              int a;
              a = 'x';
              return a;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Assignment expression with type mismatch should produce semantic errors");
    }

    @Test
    public void testAssignmentExpression_3() throws IOException {
        String input = """
            int main() {
              int a;
              a = 3;
              return a;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "A correct assignment expression should be semantically correct");
    }

    @Test
    public void testMultidimArrayDecl() throws IOException {
        String input = """
            int matrix[3][4];
            int main() { return matrix[0][0]; }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Correct multidimensional array declaration should be semantically correct");
    }

    @Test
    public void testMultidimArrayAccess_1() throws IOException {
        String input = """
            int matrix[3][4];
            int main() { return matrix[1][2]; }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Correct multidimensional array access should be semantically correct");
    }

    @Test
    public void testMultidimArrayAccess_2() throws IOException {
        // Accessing with an incorrect number of indices or size mismatch.
        String input = """
            int matrix[3][4];
            int main() { return matrix[1][2][0]; }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Incorrect multidimensional array access should produce semantic errors");
    }

    @Test
    public void testReturnStmnt() throws IOException {
        String input = """
            int foo() { return 5; }
            int main() { return foo(); }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Valid return statement should be semantically correct");
    }

    @Test
    public void testReturnStmntHasErrorsWhenVoidAndReturns() throws IOException {
        String input = """
            void foo() { return 5; }
            int main() { return foo(); }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Return statement with void function and return value should produce semantic errors");
    }

    @Test
    public void testReturnStmntHasErrorsWhenNonVoidAndNoReturns() throws IOException {
        String input = """
            int foo() {return;}
            int main() { return foo(); }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Return statement with non-void function and no return value should produce semantic errors");
    }

    @Test
    public void testReturnInsideOtherBodies() throws IOException {
        String input = """
            int foo(int x) {
                if (x > 0) {
                    return 1;
                } else {
                    return 0;
                }
                while (x < 10) {
                    return 1;
                }
            }
            int main() { return foo(1); }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Return statement inside if-else should be semantically correct");
    }

    @Test
    public void testDifferentReturnTypesOfDifferentFunctions() throws IOException {
        String input = """
            int foo() { return 1; }
            char bar() { return 'a'; }
            int main() { return foo() + bar(); }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors > 0, "Different return types of different functions should produce semantic errors");
    }

    @Test
    public void testArrayAndPointerReturnTypes() throws IOException {
        String input = """
            int* foo() { int smthg[5]; return &(smthg[1]); }
            int main() { return *foo(); }
            """;
        int errors = runSemanticAnalysis(input);
        assertTrue(errors == 0, "Array and pointer return types should produce semantic errors");
    }

    @Test
    public void testHiddenMaybe() throws IOException {
        String input = """
                int k;
                void foo(int a){}
                void main(){
                if(1){
                char k;
                }
                foo(k);
                }
        """;
    }

    @Test
    public void testStrAssignment() throws IOException {
        String input = """
            int main() {
                  char *str;
                  str = (char*) "hello";
                  return 0;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Valid string assignment should be semantically correct");
    }

    @Test
    public void testNestedStructs() throws IOException {
        String input = """
            struct Inner { int a; };
            struct Outer { struct Inner in; int b; };
            int main() {
              struct Outer o;
              o.in.a = 5;
              return o.b;
            }
            """;
        int errors = runSemanticAnalysis(input);
        assertEquals(0, errors, "Valid nested structs should be semantically correct");
    }
}