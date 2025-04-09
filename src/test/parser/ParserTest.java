package parser;

import ast.ASTPrinter;
import ast.Program;
import org.junit.Test;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.io.*;

import lexer.Scanner;
import lexer.Tokeniser;
import parser.Parser;

public class ParserTest {

    private Parser createParserFromString(String input) throws IOException {
        File tempFile = File.createTempFile("parser_input", ".txt");

        tempFile.deleteOnExit();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))) {
            writer.write(input);
        }

        Scanner scanner = new Scanner(tempFile);
        Tokeniser tokeniser = new Tokeniser(scanner);
        return new Parser(tokeniser);
    }

    @Test
    public void testIncludeWithSpaces() throws IOException {
        String code =
                "   #include   \"myHeader.h\"    \n" +
                        "   int main() { return 0; }     \n";

        Parser parser = createParserFromString(code);
        parser.parse();

        assertEquals(
                "Parser should successfully parse #include with extra spaces.",
                0,
                parser.getNumErrors()  // or whichever method you use to track errors
        );
    }

    @Test
    public void testIncludeAngleBracketsShouldFail() throws IOException {
        String input =
                "#include <stdio.h>\n" +
                        "int main() {\n" +
                        "    return 0;\n" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();

        // We expect at least 1 error because the grammar doesn't allow <...>
        assertTrue("Expected parse errors for #include <stdio.h>.",
                parser.getNumErrors() > 0);
    }

    @Test
    public void testIncludeStringLiteralShouldPass() throws IOException {
        String input =
                "#include \"stdio.h\"\n" +
                        "int main() {\n" +
                        "    return 0;\n" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();

        assertEquals("Expected no parse errors for #include \"stdio.h\".",
                0, parser.getNumErrors());
    }

    @Test
    public void testAllSyntaxCategoriesWithSpaces() throws IOException {
        String input =
                "  \n" +
                        "#include   \"myheader.h\"  \n" +
                        "    \n" +
                        "  struct   Foo  {\n" +
                        "    int   x   ;\n" +
                        "    char  y  ;\n" +
                        "  }   ;   \n" +
                        "\n" +
                        "   int   main   (   )  \n" +
                        "   {\n" +
                        "       int    a   ;\n" +
                        "       a  =   3  ;\n" +
                        "       while   (   a   <   10   )  \n" +
                        "       {\n" +
                        "          a  =  a  +  1  ;\n" +
                        "       }\n" +
                        "       return   a  ;\n" +
                        "   }\n";
        Parser parser = createParserFromString(input);
        parser.parse();

        assertEquals("Expected no parse errors with extra whitespace everywhere.",
                0, parser.getNumErrors());
    }

    @Test
    public void testVoidMainVoidSignature() throws IOException {
        String input =
                "int main(void) {\n" +
                        "    return 0;\n" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();

        // If your grammar doesn't allow 'void' in the params in place of type+IDENT,
        // you might expect an error.
        // For demonstration, let's check if it fails:
        assertTrue("Expected parse error if grammar does not allow (void).",
                parser.getNumErrors() > 0);
    }

    @Test
    public void testComments() throws IOException {
        // This sample includes both a block comment and a line comment:
        String input =
                "#include \"stdio.h\"  /* block comment */\n" +
                        "// line comment here\n" +
                        "int main() {\n" +
                        "    /* another comment */\n" +
                        "    // one more\n" +
                        "    return 0;\n" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();

        // If your lexer properly discards comments, there should be no errors:
        assertEquals("Expected no parse errors if comments are properly handled.",
                0, parser.getNumErrors());
    }

    @Test
    public void testMegaAllSyntaxFeatures() throws IOException {
        String input =
                "   #include  \"example.h\"   \n" +               // 1) include with extra spaces
                        "   struct   MyStruct   {\n" +                   // 2) struct definition
                        "       int   x  ;  \n" +
                        "       char  y  ;  \n" +
                        "   }   ;   \n" +
                        "\n" +
                        "   int  globalVar   ;   \n" +                   // 3) global variable
                        "   char*   pGlobal  ;   \n" +                   //    pointer type
                        "   int  globalArray  [  5  ] ; \n" +            //    single-dimensional array
                        "   \n" +
                        "   int  foo  (  int  a,   int  b  )  ;   \n" +   // 4) function *declaration*
                        "\n" +
                        "   int  foo ( int a,  int b )   \n" +            // 5) function *definition*
                        "   {\n" +
                        "       int  i ;\n" +
                        "       struct MyStruct  ms  ;\n" +
                        "       i = a + b ;\n" +
                        "       while ( i < 10 ) {\n" +
                        "           i = i + 1 ;\n" +
                        "           if ( i == 5 )  break   ;\n" +
                        "           else  continue ;\n" +
                        "       }\n" +
                        "       ms.x = i ;\n" +
                        "       ms.y = 'z'  ;\n" +
                        "       return   ms.x ;\n" +
                        "   }\n" +
                        "\n" +
                        "   int  main()    \n" +
                        "   {\n" +
                        "       int a  [ 2 ]  ;\n" +                      // 6) local multi-dimensional arrays
                        "       a [ 0 ] =  1  ;\n" +
                        "       a [ 1 ] =  2  ;\n" +
                        "       foo ( a [ 0 ] , a [ 1 ] )  ;\n" +         // 7) function call with array indexing
                        "       return 0;\n" +
                        "   }\n";

        Parser parser = createParserFromString(input);
        parser.parse();

        // If your grammar matches all these constructs, we expect 0 errors:
        assertEquals("Expected full parse success for mega C code sample.",
                0, parser.getNumErrors());
    }

    @Test
    public void testMissingSemicolonShouldFail() throws IOException {
        String input =
                "int main() {\n" +
                        "    int x\n" +   // MISSING semicolon
                        "    x = 5;\n" +
                        "    return x;\n" +
                        "}\n";

        Parser parser = createParserFromString(input);
        parser.parse();

        // We expect at least 1 error for the missing semicolon after 'int x'
        assertTrue("Expected parse error for missing semicolon.",
                parser.getNumErrors() > 0);
    }

    // --- Test multiple includes (include ::= "#include" STRING_LITERAL)
    @Test
    public void testMultipleIncludes() throws IOException {
        String input =
                "#include \"header1.h\"\n" +
                        "#include \"header2.h\"\n" +
                        "int main() { return 0; }\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Multiple includes should parse without errors.", 0, parser.getNumErrors());
    }

    // --- Test valid struct declaration (structdecl ::= structtype "{" (vardecl)+ "}" ";")
    @Test
    public void testValidStructDecl() throws IOException {
        String input =
                "struct Foo { int a; char b; };\n" +
                        "int main() { return 0; }\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Valid struct declaration must parse without errors.", 0, parser.getNumErrors());
    }

    // --- Test invalid struct declaration: missing at least one field (should fail)
    @Test
    public void testStructDeclEmptyFails() throws IOException {
        String input =
                "struct Empty { };\n" +
                        "int main() { return 0; }\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertTrue("A struct declaration with no fields should produce an error.", parser.getNumErrors() > 0);
    }

    // --- Test variable declaration with multi-dimensional arrays
    // (vardecl ::= type IDENT ("[" INT_LITERAL "]")* ";")
    @Test
    public void testVarDeclMultiArray() throws IOException {
        String input =
                "int matrix[3][4];\n" +
                        "int main() { return 0; }\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Multi-dimensional array declaration should succeed.", 0, parser.getNumErrors());
    }

    // --- Test function declaration (prototype) and function definition
    // (vardecl_funcdef_or_funcdecl ::= type IDENT ( is_vardecl | is_fundef_or_fundecl ))
    @Test
    public void testFunctionDeclAndDef() throws IOException {
        String input =
                "int foo(int a, char b);\n" +   // function prototype (declaration)
                        "int foo(int a, char b) { return a; }\n" +  // function definition
                        "int main() { return foo(1, 'c'); }\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Function declaration and definition must parse without errors.", 0, parser.getNumErrors());
    }

    // --- Test parameters including array parameters
    // (params ::= [ type IDENT ("[" INT_LITERAL "]")* ("," type IDENT ("[" INT_LITERAL "]")* )* ])
    @Test
    public void testFunctionParamsArrays() throws IOException {
        String input =
                "int foo(int a[10], char b) { return a[0] + b; }\n" +
                        "int main() { int arr[10]; return foo(arr, 'c'); }\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Function parameters (with array dimensions) must parse correctly.", 0, parser.getNumErrors());
    }

    // ===============================================================
    // Tests for Statements and Blocks
    // ===============================================================

    // --- Test if statement without else
    // (ifStmnt ::= "if" "(" exp ")" withOrWithoutElse)
    @Test
    public void testIfWithoutElse() throws IOException {
        String input =
                "int main() { if (1) return 1; return 0; }\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("if-statement without else should parse without errors.", 0, parser.getNumErrors());
    }

    // --- Test if statement with else and ambiguous (dangling else) construct
    @Test
    public void testIfElseAmbiguity() throws IOException {
        String input =
                "int main() {" +
                        "  if (1) " +
                        "     if (0) return 0; else return 1;" +
                        "  return 0;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Dangling else should be resolved unambiguously by the grammar.", 0, parser.getNumErrors());
    }

    // --- Test while statement
    // (nonIfStmt ::= "while" "(" exp ")" stmt)
    @Test
    public void testWhileStatement() throws IOException {
        String input =
                "int main() {" +
                        "  int i;" +
                        "  while(i < 10) { i = i + 1; }" +
                        "  return i;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("while statement should parse without errors.", 0, parser.getNumErrors());
    }

    // --- Test return statement with and without an expression
    // (nonIfStmt ::= "return" [exp] ";")
    @Test
    public void testReturnStatements() throws IOException {
        String input =
                "int main() {" +
                        "  return 0;" +
                        "}\n" +
                        "void foo() {" +
                        "  return;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Return statements (with and without expression) must parse correctly.", 0, parser.getNumErrors());
    }

    // --- Test continue and break statements
    // (nonIfStmt ::= "continue" ";"  and  "break" ";")
    @Test
    public void testContinueBreak() throws IOException {
        String input =
                "int main() {" +
                        "  while(1) {" +
                        "    continue;" +
                        "    break;" +
                        "  }" +
                        "  return 0;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("continue and break statements must parse correctly.", 0, parser.getNumErrors());
    }

    // --- Test a block with variable declarations and statements
    // (block ::= "{" (vardecl)* (stmt)* "}")
    @Test
    public void testBlockWithDeclsAndStmts() throws IOException {
        String input =
                "int main() {" +
                        "  { int a; a = 5; }" +
                        "  return 0;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("A block with declarations and statements must parse without errors.", 0, parser.getNumErrors());
    }

    // --- Test an empty block (allowed because both (vardecl)* and (stmt)* can be empty)
    @Test
    public void testEmptyBlock() throws IOException {
        String input =
                "int main() {" +
                        "  {}" +
                        "  return 0;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("An empty block should be parsed successfully.", 0, parser.getNumErrors());
    }

    // ===============================================================
    // Tests for Expressions
    // ===============================================================

    // --- Test assignment expression and right-associativity: exp ::= exp1 "=" (exp | exp1)
    @Test
    public void testAssignmentExpression() throws IOException {
        String input =
                "int main() {" +
                        "  int a; int b; int c;" +
                        "  a = b = c = 0;" +
                        "  return a;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Assignment expressions (right-associative) must parse without errors.", 0, parser.getNumErrors());
    }

    // --- Test logical OR and AND expressions (exp1 and exp2)
    @Test
    public void testLogicalExpressions() throws IOException {
        String input =
                "int main() {" +
                        "  int a; int b;" +
                        "  a = (a || b) && (a && b);" +
                        "  return a;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Logical expressions must parse without errors.", 0, parser.getNumErrors());
    }

    // --- Test equality (exp3) and relational (exp4) expressions
    @Test
    public void testEqualityAndRelationalExpressions() throws IOException {
        String input =
                "int main() {" +
                        "  int a; int b;" +
                        "  a = (a == b) != (a != b);" +
                        "  a = (a < b) + (a > b) + (a <= b) + (a >= b);" +
                        "  return a;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Equality and relational expressions must parse without errors.", 0, parser.getNumErrors());
    }

    // --- Test arithmetic expressions (exp5 and exp6)
    @Test
    public void testArithmeticExpressions() throws IOException {
        String input =
                "int main() {" +
                        "  int a;" +
                        "  a = 3 + 4 - 5 * 6 / 2 % 3;" +
                        "  return a;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Arithmetic expressions must parse without errors.", 0, parser.getNumErrors());
    }

    // --- Test unary expressions (exp7): address-of, dereference, unary minus/plus
    @Test
    public void testUnaryExpressions() throws IOException {
        String input =
                "int main() {" +
                        "  int a; int *p;" +
                        "  a = 0;" +
                        "  p = &a;" +
                        "  a = *p;" +
                        "  a = -a;" +
                        "  a = +a;" +
                        "  return a;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Unary expressions must parse without errors.", 0, parser.getNumErrors());
    }

    // --- Test typecast expressions (part of exp7)
    // (typecast ::= "(" type ")" exp)
    @Test
    public void testTypecastExpression() throws IOException {
        String input =
                "int main() {" +
                        "  int a;" +
                        "  a = (int) a;" +
                        "  return a;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Typecast expressions must parse without errors.", 0, parser.getNumErrors());
    }

    // --- Test parenthesized expressions and literal expressions (exp9)
    @Test
    public void testLiteralAndParenthesizedExpressions() throws IOException {
        String input =
                "int main() {" +
                        "  int a;" +
                        "  a = (((42))) + 'c' + \"hello\"[0];" +
                        "  return a;" +
                        "}\n";
        /*
         * Note:
         * - 42 is an INT_LITERAL.
         * - 'c' is a CHAR_LITERAL.
         * - "hello" is a STRING_LITERAL and then the matrix_brqt production ("[" exp "]")
         *   is applied to access a character.
         */
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Literal and parenthesized expressions must parse without errors.", 0, parser.getNumErrors());
    }

    // --- Test sizeof expressions (exp9 ::= sizeof "(" type ")")
    @Test
    public void testSizeofExpression() throws IOException {
        String input =
                "int main() {" +
                        "  int a;" +
                        "  a = sizeof(int);" +
                        "  return a;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("sizeof expression must parse without errors.", 0, parser.getNumErrors());
    }

    // --- Test function call expressions (funccall_params)
    @Test
    public void testFunctionCallExpression() throws IOException {
        String input =
                "int foo(int x) { return x; }\n" +
                        "int main() {" +
                        "  int a;" +
                        "  a = foo(3 + 4);" +
                        "  return a;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Function call expressions must parse without errors.", 0, parser.getNumErrors());
    }

    // --- Test array access expressions (matrix_brqt)
    @Test
    public void testArrayAccessExpression() throws IOException {
        String input =
                "int main() {" +
                        "  int arr[5];" +
                        "  int a;" +
                        "  a = arr[2];" +
                        "  return a;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Array access expressions must parse without errors.", 0, parser.getNumErrors());
    }

    // --- Test struct field access expressions (struct_field_access)
    @Test
    public void testStructFieldAccessExpression() throws IOException {
        String input =
                "struct Point { int x; int y; };\n" +
                        "int main() {" +
                        "  struct Point p;" +
                        "  int a;" +
                        "  a = p.x;" +
                        "  return a;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Struct field access expressions must parse without errors.", 0, parser.getNumErrors());
    }

    // --- Test a chained expression that mixes function call, array access, and struct field access.
    // This ensures that exp8’s repetition (funccall_params | matrix_brqt | struct_field_access)* works.
    @Test
    public void testChainedExpressions() throws IOException {
        String input =
                "struct Data { int arr[5]; };\n" +
                        "struct Data foo() { struct Data d; d.arr[2] = 42; return d; }\n" +
                        "int main() {" +
                        "  int a;" +
                        "  a = foo().arr[2];" +
                        "  return a;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Chained expressions must parse without errors.", 0, parser.getNumErrors());
    }

    // ===============================================================
    // Tests for Error Recovery and Edge Cases
    // ===============================================================

    // --- Test missing semicolon in a variable declaration (vardecl)
    @Test
    public void testMissingSemicolonInVarDecl() throws IOException {
        String input =
                "int main() {" +
                        "  int a" +   // MISSING semicolon here
                        "  a = 5;" +
                        "  return a;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertTrue("Missing semicolon in variable declaration must trigger an error.", parser.getNumErrors() > 0);
    }

    // --- Test missing parenthesis in an if statement
    @Test
    public void testMissingParenthesisInIf() throws IOException {
        String input =
                "int main() {" +
                        "  if 1) return 1; else return 0;" +  // missing opening parenthesis
                        "  return 0;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertTrue("Missing parenthesis in if statement must trigger an error.", parser.getNumErrors() > 0);
    }

    // --- Test ambiguous typecast versus parenthesized expression.
    // The grammar distinguishes a typecast if the token following "(" is a type keyword.
    @Test
    public void testAmbiguousTypecastVsParen() throws IOException {
        String input =
                "int main() {" +
                        "  int a;" +
                        "  a = (int)(a * 2);" +
                        "  return a;" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Ambiguous typecast versus parenthesized expression must parse correctly.", 0, parser.getNumErrors());
    }

    @Test
    public void testSortLinkedList() throws IOException {
        String input =
                // A struct for a linked list node:
                "struct Node { int value; struct Node* next; };\n" +
                        // A function that sorts the list using only while loops:
                        "void sortList(struct Node* head) {\n" +
                        "    int swapped;\n" +
                        "    struct Node* ptr;\n" +
                        "    struct Node* lptr;\n" +
                        "    if (head == 0) return;\n" +
                        "    swapped = 1;\n" +
                        "    lptr = 0;\n" +
                        "    while (swapped) {\n" +
                        "        swapped = 0;\n" +
                        "        ptr = head;\n" +
                        "        while (((*ptr).next) != lptr) {\n" +
                        "            if (((*ptr).value) > ((*((*ptr).next)).value)) {\n" +
                        "                int temp;\n" +
                        "                temp = (*ptr).value;\n" +
                        "                (*ptr).value = (*((*ptr).next)).value;\n" +
                        "                (*((*ptr).next)).value = temp;\n" +
                        "                swapped = 1;\n" +
                        "            }\n" +
                        "            ptr = (*ptr).next;\n" +
                        "        }\n" +
                        "        lptr = ptr;\n" +
                        "    }\n" +
                        "}\n" +
                        // A main function that builds a small linked list and calls sortList:
                        "int main() {\n" +
                        "    struct Node a;\n" +
                        "    a.value = 3;\n" +
                        "    b.value = 1;\n" +
                        "    c.value = 2;\n" +
                        "    a.next = &b;\n" +
                        "    b.next = &c;\n" +
                        "    c.next = 0;\n" +
                        "    sortList(&a);\n" +
                        "    return 0;\n" +
                        "}\n";

        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Sort linked list should parse without errors.", 0, parser.getNumErrors());
    }

    @Test
    public void testStructPointerDereference() throws IOException {
        String input =
                // A simple struct definition:
                "struct Point { int x; };\n" +
                        "int main() {\n" +
                        "    struct Point p;\n" +
                        "    struct Point* ptr;\n" +
                        "    p.x = 5;\n" +
                        "    ptr = &p;\n" +
                        // Use pointer dereference (with parentheses) followed by field access:
                        "    (*ptr).x = 10;\n" +
                        "    return (*ptr).x;\n" +
                        "}\n";

        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Struct pointer dereference should parse without errors.", 0, parser.getNumErrors());
    }

    @Test
    public void testStructDeclAndStructType() throws IOException {
        String input =
                "struct Point {int x; };\n" +
                        "int main() { struct Point p; }\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Struct declaration and struct type should parse without errors.", 0, parser.getNumErrors());
    }


    @Test
    public void testClassDeclarationAndOOPFeatures() throws IOException {
        String input =
                "class MyClass {\n" +
                        "    int x;\n" +
                        "    void setX(int val) {\n" +
                        "        x = val;\n" +
                        "    }\n" +
                        "    int getX() {\n" +
                        "        return x;\n" +
                        "    }\n" +
                        "}\n" +
                        "int main() {\n" +
                        "    class MyClass obj;\n" +
                        "    int result;\n" +
                        "    obj = new class MyClass();\n" +
                        "    obj.setX(42);\n" +
                        "    result = obj.getX();\n" +
                        "    return result;\n" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Class declaration and OOP features should parse without errors.", 0, parser.getNumErrors());
    }

    @Test
    public void testClassInheritance() throws IOException {
        String input =
                "class BaseClass {\n" +
                        "    int baseField;\n" +
                        "    void baseMethod() {\n" +
                        "        baseField = 10;\n" +
                        "    }\n" +
                        "}\n" +
                        "class DerivedClass extends BaseClass {\n" +
                        "    int derivedField;\n" +
                        "    void derivedMethod() {\n" +
                        "        derivedField = baseField + 5;\n" +
                        "    }\n" +
                        "}\n" +
                        "int main() {\n" +
                        "    class DerivedClass obj;\n" +
                        "    obj = new class DerivedClass();\n" +
                        "    obj.baseMethod();\n" +
                        "    obj.derivedMethod();\n" +
                        "    return obj.derivedField;\n" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Class inheritance should parse without errors.", 0, parser.getNumErrors());
    }

    // Test structs containing instances of class types
    @Test
    public void testStructWithClassInstances() throws IOException {
        String input =
                "class MyClass { int a; }\n" +
                        "struct Holder { class MyClass obj; };\n" +
                        "int main() { struct Holder h; h.obj.a = 5; return h.obj.a; }\n";

        Parser parser = createParserFromString(input);
        parser.parse();

        assertEquals("Struct with class instances must parse correctly.", 0, parser.getNumErrors());
    }

    // Test pointer to class inside a struct
    @Test
    public void testPointerToClassInsideStruct() throws IOException {
        String input =
                "class Node { int data; }\n" +
                        "struct List { class Node* head; };\n" +
                        "int main() { struct List list; list.head = new class Node(); (*list.head).data = 42; return (*list.head).data; }\n";

        Parser parser = createParserFromString(input);
        parser.parse();

        assertEquals("Pointer to class inside struct must parse without errors.", 0, parser.getNumErrors());
    }

    // Test struct containing an array of class instances
    @Test
    public void testStructContainingClassArray() throws IOException {
        String input =
                "class Item { int value; }\n" +
                        "struct Collection { class Item items[10]; };\n" +
                        "int main() { struct Collection col; col.items[0].value = 20; return col.items[0].value; }\n";

        Parser parser = createParserFromString(input);
        parser.parse();

        assertEquals("Struct containing an array of class instances must parse correctly.", 0, parser.getNumErrors());
    }

    @Test
    public void testClassTypecasting() throws IOException {

        String input =
            """
                int main() {
                vcourse = (class Course) new class VirtualCourse();
                }
                
            """;

        Parser parser = createParserFromString(input);
        Program program = parser.parse();
        new ASTPrinter(new PrintWriter(System.out)).visit(program); // print to stdout

        assertEquals("Struct containing an array of class instances must parse correctly.", 0, parser.getNumErrors());
    }



    @Test
    public void testClassExamples() throws IOException {
        String input =
                """
                                class Course {
                                    char name[20];
                                    int credit;
                                    int courseWorkScore;
                                               
                                    void whereToAttend(){
                                        print_s((char*)"Not determined! The course will be held virtually or in person!\\n");
                                    }
                                    int hasExam(){
                                        if(courseWorkScore == 100)
                                            return 0;
                                        else
                                            return 1;
                                    }
                                }
                                
                                class VirtualCourse extends Course {
                                    char zoomLink[200];
                                     void whereToAttend(){
                                            print_s((char*)"The course is going to be held on Zoom!\\n");
                                        }
                                    
                                }
                                
                                 
                                 void main(){
                                     class Course comp520;
                                     int credit;
                                     class Course course;
                                     class Course vcourse;
                                     course = new class Course();
                                     vcourse = (class Course) new class VirtualCourse();
                                 
                                     course.whereToAttend();
                                     vcourse.whereToAttend();
                                     
                                     
                                     comp520 = new class Course();
                                     credit = comp520.credit; // field access
                                     comp520.credit = 4;      // field assignment
                                     
                                     course = (class Course) vcourse;
                                     
                                     
                                    if(comp520.hasExam())
                                        print_s((char*)"Be ready for the exam!\\n");
                                    else
                                        print_s((char*)"Be ready for the project implementation!:)\\n");
                                 }

                        """;

        Parser parser = createParserFromString(input);
        Program program = parser.parse();
        new ASTPrinter(new PrintWriter(System.out)).visit(program); // print to stdout

        assertEquals("Struct containing an array of class instances must parse correctly.", 0, parser.getNumErrors());
    }
    @Test
    public void testNestedClassDeclaration() throws IOException {
        String input = """
            class Outer {
                int getInnerA() {
                    class Inner i;
                    i = new class Inner();
                    i.a = 5;
                    return i.a;
                }
            }
            int main() {
                class Outer o;
                o = new class Outer();
                return o.getInnerA();
            }
            """;
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Nested class declaration should have no semantic errors.",
                0, parser.getNumErrors());
    }

    // Extra Test 3: Self-reference in a Class Field (should pass)
    @Test
    public void testSelfReferenceField() throws IOException {
        String input = """
            class Node {
                class Node next;
            }
            int main() {
                class Node n;
                n = new class Node();
                n.next = new class Node();
                return 0;
            }
            """;
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Self-reference in a class field should have no semantic errors.",
                0, parser.getNumErrors());
    }

    // Extra Test 4: Valid Method Overloading (should pass if supported)
    @Test
    public void testMethodOverloading() throws IOException {
        String input = """
            class Overload {
                int foo() { return 1; }
                int foo(int x) { return x + 1; }
            }
            int main() {
                class Overload o;
                int a;
                int b;
                o = new class Overload();
                a = o.foo();
                b = o.foo(5);
                return a + b;
            }
            """;
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Method overloading should have no semantic errors.",
                0, parser.getNumErrors());
    }

    // Extra Test 5: Multiple Field Declarations (should pass)
    @Test
    public void testMultipleFieldDeclarations() throws IOException {
        String input = """
            class MultiField {
                int a;
                int b;
            }
            int main() {
                class MultiField m;
                m = new class MultiField();
                m.a = 3;
                m.b = 4;
                return m.a + m.b;
            }
            """;
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Multiple field declarations in one class should have no semantic errors.",
                0, parser.getNumErrors());
    }

    // Extra Test 6: Invalid Unrelated Class Cast (should fail)
    @Test
    public void testInvalidUnrelatedClassCast() throws IOException {
        String input = """
            class A { }
            class B { }
            int main() {
                class A a;
                a = (A) new class B(); // invalid cast between unrelated classes
                return 0;
            }
            """;
        Parser parser = createParserFromString(input);
        parser.parse();
        assertTrue("Casting between unrelated classes should trigger a semantic error.",
                parser.getNumErrors() > 0);
    }

// ==== Additional Parser Tests for Class-Related Features ====

    @Test
    public void testEmptyClassDeclaration() throws IOException {
        String input = """
        class EmptyClass { }
        int main() { return 0; }
        """;
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Empty class declarations should parse without errors.",
                0, parser.getNumErrors());
    }

    @Test
    public void testClassOnlyMethods() throws IOException {
        String input = """
        class MethodsOnly {
            void method1() { return; }
            int method2(int x) { return x; }
        }
        int main() { 
            class MethodsOnly mo;
            mo = new class MethodsOnly();
            mo.method1();
            return mo.method2(10);
        }
        """;
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Class with only methods should parse without errors.",
                0, parser.getNumErrors());
    }

    @Test
    public void testClassSelfPointer() throws IOException {
        String input = """
        class Node {
            class Node* next;
            int val;
        }
        int main() {
            class Node n;
            n = new class Node();
            n.next = new class Node();
            n.val = 5;
            (*n.next).val = 10;
            return n.val + (*n.next).val;
        }
        """;
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Class self-reference with pointers should parse correctly.",
                0, parser.getNumErrors());
    }

    @Test
    public void testMultipleClassInstancesInExpression() throws IOException {
        String input = """
        class A { int val; }
        int main() {
            class A a; class A b;
            a = new class A(); b = new class A();
            a.val = 2; b.val = 3;
            return a.val * b.val;
        }
        """;
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Multiple class instances in an expression should parse without errors.",
                0, parser.getNumErrors());
    }

    @Test
    public void testClassInstanceArrayDecl() throws IOException {
        String input = """
        class Item { int val; }
        int main() {
            class Item arr[5];
            return 0;
        }
        """;
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Array declaration of class instances should parse correctly if allowed.",
                0, parser.getNumErrors());
    }

    @Test
    public void testChainedInstanceMethodCalls() throws IOException {
        String input = """
        class Chain {
            class Chain next() { return new class Chain(); }
            int value() { return 1; }
        }
        int main() {
            class Chain c;
            c = new class Chain();
            return c.next().next().value();
        }
        """;
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Chained method calls should parse without errors.",
                0, parser.getNumErrors());
    }

    @Test
    public void testNestedClassInsideMethodShouldFail() throws IOException {
        String input = """
        class Outer {
            void method() {
                class Inner { int x; }
            }
        }
        int main() { return 0; }
        """;
        Parser parser = createParserFromString(input);
        parser.parse();
        assertTrue("Nested class declarations inside methods should trigger parser errors.",
                parser.getNumErrors() > 0);
    }

    @Test
    public void testClassEmpty() throws IOException {
        String input = """
                class SomeClass {
                }
                
                int main() {return 0;}
                """;
        Parser parser = createParserFromString(input);
        parser.parse();
        assertEquals("Empty class should parse without errors.", 0, parser.getNumErrors());
    }

}