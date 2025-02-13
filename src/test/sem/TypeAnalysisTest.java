package sem;

import static org.junit.jupiter.api.Assertions.*;

import ast.*;
import ast.BaseType;
import ast.ArrayType;
import ast.ChrLiteral;
import ast.FunCallExpr;
import ast.FunDef;
import ast.IntLiteral;
import ast.SizeOfExpr;
import ast.StrLiteral;
import ast.VarDecl;
import ast.VarExpr;
import ast.AddressOfExpr;
import ast.ValueAtExpr;
import ast.BinOp;
import ast.Op;
import ast.Assign;
import ast.TypecastExpr;
import ast.FieldAccessExpr;
import ast.StructType;
import ast.StructTypeDecl;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TypeAnalysisTest {

    @Test
    public void testIntLiteralType() {
        TypeAnalyzer ta = new TypeAnalyzer();
        IntLiteral intLit = new IntLiteral(42);
        Type t = ta.visit(intLit);
        assertEquals(BaseType.INT, t, "IntLiteral should have type int");
        assertEquals(0, ta.getNumErrors());
    }

    @Test
    public void testStrLiteralType() {
        TypeAnalyzer ta = new TypeAnalyzer();
        String s = "Hello";
        StrLiteral strLit = new StrLiteral(s);
        Type t = ta.visit(strLit);
        // Expected type: char array with length = s.length() + 1
        ArrayType expected = new ArrayType(BaseType.CHAR, s.length() + 1);
        assertEquals(expected, t, "String literal should have type char[s.length+1]");
        assertEquals(0, ta.getNumErrors());
    }

    @Test
    public void testChrLiteralType() {
        TypeAnalyzer ta = new TypeAnalyzer();
        ChrLiteral chrLit = new ChrLiteral("a");
        Type t = ta.visit(chrLit);
        assertEquals(BaseType.CHAR, t, "Character literal should have type char");
        assertEquals(0, ta.getNumErrors());
    }

    @Test
    public void testBinOpAddition() {
        TypeAnalyzer ta = new TypeAnalyzer();
        // 3 + 4
        BinOp binop = new BinOp(new IntLiteral(3), Op.ADD, new IntLiteral(4));
        Type t = ta.visit(binop);
        assertEquals(BaseType.INT, t, "Addition should yield type int");
        assertEquals(0, ta.getNumErrors());
    }

    @Test
    public void testAssignmentCorrect() {
        // Construct a program with a global variable and a main function that assigns to it.
        VarDecl globalX = new VarDecl(BaseType.INT, "x");
        VarExpr varX = new VarExpr("x");
        // x = 5;
        Assign assign = new Assign(varX, new IntLiteral(5));
        ExprStmt assignStmt = new ExprStmt(assign);
        // return x;
        Return retStmt = new Return(varX);
        List<Stmt> stmts = new ArrayList<>();
        stmts.add(assignStmt);
        stmts.add(retStmt);
        Block mainBlock = new Block(new ArrayList<>(), stmts);
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), mainBlock);
        List<Decl> decls = new ArrayList<>();
        decls.add(globalX);
        decls.add(mainFun);
        Program prog = new Program(decls);

        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);
        // Assignment should yield type int and no errors should be reported.
        assertEquals(0, ta.getNumErrors(), "Assignment with matching types should not produce errors");
    }

    @Test
    public void testAssignmentTypeMismatch() {
        // Program where x (int) is assigned a char literal 'a'
        VarDecl globalX = new VarDecl(BaseType.INT, "x");
        VarExpr varX = new VarExpr("x");
        // x = 'a';  // 'a' is char while x is int.
        Assign assign = new Assign(varX, new ChrLiteral("a"));
        ExprStmt assignStmt = new ExprStmt(assign);
        Return retStmt = new Return(varX);
        List<Stmt> stmts = new ArrayList<>();
        stmts.add(assignStmt);
        stmts.add(retStmt);
        Block mainBlock = new Block(new ArrayList<>(), stmts);
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), mainBlock);
        List<Decl> decls = new ArrayList<>();
        decls.add(globalX);
        decls.add(mainFun);
        Program prog = new Program(decls);

        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);
        assertTrue(ta.getNumErrors() > 0, "Assignment with mismatched types should produce an error");
    }

    @Test
    public void testFunctionCallCorrect() {
        // Define a function: int foo(int a) { return a; }
        VarDecl paramA = new VarDecl(BaseType.INT, "a");
        // In the body, simply return the parameter.
        Return ret = new Return(new VarExpr("a"));
        List<Stmt> stmts = new ArrayList<>();
        stmts.add(ret);
        Block fooBlock = new Block(new ArrayList<>(), stmts);
        FunDef fooFun = new FunDef(BaseType.INT, "foo", List.of(paramA), fooBlock);

        // Create a function call: foo(10)
        FunCallExpr funCall = new FunCallExpr("foo", List.of(new IntLiteral(10)));

        // Main function: calls foo(10) then returns 0.
        Block mainBlock = new Block(new ArrayList<>(), List.of(new ExprStmt(funCall), new Return(new IntLiteral(0))));
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), mainBlock);

        List<Decl> decls = new ArrayList<>();
        decls.add(fooFun);
        decls.add(mainFun);
        Program prog = new Program(decls);

        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);
        // funCall should have type int
        assertEquals(BaseType.INT, funCall.type, "Function call should yield type int");
        assertEquals(0, ta.getNumErrors(), "Correct function call should produce no errors");
    }

    @Test
    public void testArrayAccessCorrect() {
        // Global variable: int arr[5];
        ArrayType arrType = new ArrayType(BaseType.INT, 5);
        VarDecl globalArr = new VarDecl(arrType, "arr");
        VarExpr varArr = new VarExpr("arr");
        // Expression: arr[2]
        ArrayAccessExpr arrAccess = new ArrayAccessExpr(varArr, new IntLiteral(2));

        // Main function: returns arr[2]
        Block mainBlock = new Block(new ArrayList<>(), List.of(new Return(arrAccess)));
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), mainBlock);
        List<Decl> decls = new ArrayList<>();
        decls.add(globalArr);
        decls.add(mainFun);
        Program prog = new Program(decls);

        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);
        // The array access should yield the element type, i.e. int.
        assertEquals(BaseType.INT, arrAccess.type, "Array access should yield type int");
        assertEquals(0, ta.getNumErrors(), "Correct array access should produce no errors");
    }

    @Test
    public void testPointerOperations() {
        // Global variable: int x;  and global pointer: int* p;
        VarDecl globalX = new VarDecl(BaseType.INT, "x");
        VarExpr varX = new VarExpr("x");
        // Address-of expression: &x  -> should yield PointerType(int)
        AddressOfExpr addrExpr = new AddressOfExpr(varX);
        // Global pointer p:
        PointerType ptrToInt = new PointerType(BaseType.INT);
        VarDecl globalP = new VarDecl(ptrToInt, "p");
        VarExpr varP = new VarExpr("p");
        // Value-at expression: *p  -> should yield int.
        ValueAtExpr valAtExpr = new ValueAtExpr(varP);

        // Main function with no body.
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), new Block(new ArrayList<>(), new ArrayList<>()));
        List<Decl> decls = new ArrayList<>();
        decls.add(globalX);
        decls.add(globalP);
        decls.add(mainFun);
        Program prog = new Program(decls);

        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog); // Populate the symbol table with globals
        Type addrType = ta.visit(addrExpr);
        Type valAtType = ta.visit(valAtExpr);
        assertEquals(new PointerType(BaseType.INT), addrType, "Address-of should yield pointer to int");
        assertEquals(BaseType.INT, valAtType, "Value-at should yield int");
        assertEquals(0, ta.getNumErrors(), "Pointer operations should produce no errors");    }

    @Test
    public void testTypeCast() {
        // Expression: (int)'a'
        ChrLiteral charLit = new ChrLiteral("a");
        TypecastExpr castExpr = new TypecastExpr(BaseType.INT, charLit);
        TypeAnalyzer ta = new TypeAnalyzer();
        Type t = ta.visit(castExpr);
        assertEquals(BaseType.INT, t, "Typecasting from char to int should yield int");
        assertEquals(0, ta.getNumErrors(), "Correct type cast should produce no errors");
    }

    @Test
    public void testSizeOf() {
        // Expression: sizeof(int)
        SizeOfExpr sizeExpr = new SizeOfExpr(BaseType.INT);
        TypeAnalyzer ta = new TypeAnalyzer();
        Type t = ta.visit(sizeExpr);
        assertEquals(BaseType.INT, t, "sizeof should yield type int");
        assertEquals(0, ta.getNumErrors(), "sizeof should produce no errors");
    }

    @Test
    public void testFieldAccess() {
        // Construct a struct declaration: struct Point { int x; int y; }
        VarDecl fieldX = new VarDecl(BaseType.INT, "x");
        VarDecl fieldY = new VarDecl(BaseType.INT, "y");
        List<VarDecl> fields = new ArrayList<>();
        fields.add(fieldX);
        fields.add(fieldY);
        StructTypeDecl structDecl = new StructTypeDecl("Point", fields);

        // Global variable: struct Point p;
        VarDecl globalP = new VarDecl(new StructType("Point"), "p");
        VarExpr varP = new VarExpr("p");
        // Field access: p.x
        FieldAccessExpr fieldAccess = new FieldAccessExpr(varP, "x");

        // Main function: return p.x;
        Block mainBlock = new Block(new ArrayList<>(), List.of(new Return(fieldAccess)));
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), mainBlock);

        List<Decl> decls = new ArrayList<>();
        decls.add(structDecl);
        decls.add(globalP);
        decls.add(mainFun);
        Program prog = new Program(decls);

        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);
        // Field access p.x should have type int.
        assertEquals(BaseType.INT, fieldAccess.type, "Field access should yield type int");
        assertEquals(0, ta.getNumErrors(), "Valid field access should produce no errors");
    }

    /**
     * Test that when a local declaration shadows a global variable,
     * a VarExpr inside the local block resolves to the local type.
     */
    @Test
    public void testLocalShadowingOverridesGlobal() {
        // Global variable: int x;
        VarDecl globalX = new VarDecl(BaseType.INT, "x");

        // In main, declare a local variable x of type char that shadows global x.
        VarDecl localX = new VarDecl(BaseType.CHAR, "x");
        // The variable use inside the block.
        VarExpr varX = new VarExpr("x");
        ExprStmt assign = new ExprStmt(new Assign(varX, new ChrLiteral("a")));
        Return ret = new Return(new IntLiteral(5));

        // Build a block that first declares localX then returns x.
        Block block = new Block(new ArrayList<>(List.of(localX)), new ArrayList<>(List.of(assign, ret)));
        // Define main with no parameters.
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), block);

        // Program: global declaration followed by main.
        List<Decl> decls = new ArrayList<>();
        decls.add(globalX);
        decls.add(mainFun);
        Program prog = new Program(decls);

        // Run type analysis.
        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);

        // The VarExpr should resolve to type char (from localX).
        assertEquals(BaseType.CHAR, varX.type, "Local shadowing should yield type char for x");
        assertEquals(0, ta.getNumErrors(), "No errors expected for valid local shadowing");
    }

    /**
     * Test that a function parameter shadows a global variable.
     * Here a global variable "h" of type int is shadowed by a function parameter "h" of type char.
     */
    @Test
    public void testParameterShadowingOverridesGlobal() {
        // Global variable: int h;
        VarDecl globalH = new VarDecl(BaseType.INT, "h");

        // Define main with a parameter "h" of type char.
        VarDecl paramH = new VarDecl(BaseType.CHAR, "h");
        VarExpr varH = new VarExpr("h");
        Return ret = new Return(varH);
        Block block = new Block(new ArrayList<>(), new ArrayList<>(List.of(ret)));
        FunDef mainFun = new FunDef(BaseType.CHAR, "main", new ArrayList<>(List.of(paramH)), block);

        // Program contains the global variable and main.
        List<Decl> decls = new ArrayList<>();
        decls.add(globalH);
        decls.add(mainFun);
        Program prog = new Program(decls);

        // Run type analysis.
        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);

        // The VarExpr 'h' should have type char (from the parameter), not int.
        assertEquals(BaseType.CHAR, varH.type, "Function parameter should shadow global h and yield type char");
        assertEquals(0, ta.getNumErrors(), "No errors expected for valid parameter shadowing");
    }

    /**
     * Test that when no local declaration exists,
     * a VarExpr refers to the global variable.
     */
    @Test
    public void testGlobalVariableUsedWhenNoLocalShadow() {
        // Global variable: int x;
        VarDecl globalX = new VarDecl(BaseType.INT, "x");

        // In main, there is no local declaration for x.
        VarExpr varX = new VarExpr("x");
        Return ret = new Return(varX);
        Block block = new Block(new ArrayList<>(), new ArrayList<>(List.of(ret)));
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), block);

        // Program consists of the global variable and main.
        List<Decl> decls = new ArrayList<>();
        decls.add(globalX);
        decls.add(mainFun);
        Program prog = new Program(decls);

        // Run type analysis.
        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);

        // The VarExpr should resolve to type int (from globalX).
        assertEquals(BaseType.INT, varX.type, "Without shadowing, x should have type int");
        assertEquals(0, ta.getNumErrors(), "No errors expected when no shadowing occurs");
    }

    @Test
    public void testVariableDeclaredWithUndeclaredStructType() {
        // Create a global variable declared with a struct type "NonExistent" (which is never defined)
        VarDecl var = new VarDecl(new StructType("NonExistent"), "v");

        // Build the program with the undeclared struct variable and the main function
        List<Decl> decls = new ArrayList<>();
        decls.add(var);
        Program prog = new Program(decls);

        // Run type analysis on the program
        TypeAnalyzer analyzer = new TypeAnalyzer();
        analyzer.visit(prog);

        assertTrue(analyzer.getNumErrors() > 0,
                "Declaring a variable with an undeclared struct type should produce a type analysis error");
    }

    @Test
    public void testVariableDeclaredWithDeclaredStructType() {
        // Create a struct declaration for "Point" with one field "x" of type int.
        VarDecl field = new VarDecl(BaseType.INT, "x");
        List<VarDecl> fields = new ArrayList<>();
        fields.add(field);
        StructTypeDecl structDecl = new StructTypeDecl("Point", fields);

        // Create a global variable 'p' declared with type StructType("Point")
        VarDecl globalVar = new VarDecl(new StructType("Point"), "p");

        // Create a main function that declares a local variable 'q' of type "Point"
        VarDecl localVar = new VarDecl(new StructType("Point"), "q");
        // Use 'q' in an expression so its type is checked.
        VarExpr localVarExpr = new VarExpr("q");
        Return ret = new Return(localVarExpr);

        // The main block now has one local variable declaration (q) and one statement (return q).
        List<VarDecl> localDecls = new ArrayList<>();
        localDecls.add(localVar);
        List<Stmt> stmts = new ArrayList<>();
        stmts.add(ret);
        Block mainBlock = new Block(localDecls, stmts);

        // Create the main function.
        FunDef mainFun = new FunDef(new StructType("Point"), "main", new ArrayList<>(), mainBlock);

        // Build the program: struct declaration, global variable, and main function.
        List<Decl> decls = new ArrayList<>();
        decls.add(structDecl);
        decls.add(globalVar);
        decls.add(mainFun);
        Program prog = new Program(decls);

        // Run type analysis on the program.
        TypeAnalyzer analyzer = new TypeAnalyzer();
        analyzer.visit(prog);

        // Since "Point" is declared, both the global 'p' and the local 'q' should resolve correctly.
        // We expect no errors from the type analysis.
        assertEquals(0, analyzer.getNumErrors(),
                "Variables declared with a properly declared struct type should produce no type errors");
    }

    @Test
    public void testInvalidRecursiveStruct() {
        // Create a struct "Node" with two fields:
        //  - an integer field "a"
        //  - a field "n" of type "struct Node" (direct recursive field, which is invalid)
        VarDecl fieldA = new VarDecl(BaseType.INT, "a");
        // This field is declared with type "struct Node" (without wrapping it in a PointerType)
        VarDecl fieldN = new VarDecl(new StructType("Node"), "n");
        List<VarDecl> fields = new ArrayList<>();
        fields.add(fieldA);
        fields.add(fieldN);

        // Construct the struct declaration
        StructTypeDecl nodeStruct = new StructTypeDecl("Node", fields);

        // Create a program that contains only this struct declaration
        Program prog = new Program(new ArrayList<>(List.of(nodeStruct)));

        // Run type analysis on the program.
        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);

        // We expect at least one error because the struct "Node" is recursively defined by value.
        assertTrue(ta.getNumErrors() > 0,
                "Recursive struct field without pointer should produce a type error");
    }

    @Test
    public void testValidRecursiveStructUsingPointer() {
        // Create a struct "Node" with two fields:
        //  - an integer field "a"
        //  - a field "next" of type pointer to "struct Node" (which is valid)
        VarDecl fieldA = new VarDecl(BaseType.INT, "a");
        VarDecl fieldNext = new VarDecl(new PointerType(new StructType("Node")), "next");
        List<VarDecl> fields = new ArrayList<>();
        fields.add(fieldA);
        fields.add(fieldNext);

        // Construct the struct declaration for "Node"
        StructTypeDecl nodeStruct = new StructTypeDecl("Node", fields);

        // Create a program containing just this struct declaration
        Program prog = new Program(new ArrayList<>(List.of(nodeStruct)));

        // Run type analysis on the program.
        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);

        // We expect zero errors because the recursive field is via a pointer.
        assertEquals(0, ta.getNumErrors(),
                "Recursive struct field via pointer should produce no type errors");
    }

    /**
     * Valid code: the left-hand side of the assignment is a VarExpr.
     * Example:
     *    int i;
     *    i = 0;
     */
    @Test
    public void testValidLValueAssignment() {
        // Global variable: int i;
        VarDecl iDecl = new VarDecl(BaseType.INT, "i");
        // In main, assignment: i = 0;
        VarExpr iVar = new VarExpr("i");
        Assign assign = new Assign(iVar, new IntLiteral(0));
        // Also return i (to complete main)
        Return ret = new Return(iVar);
        Block block = new Block(new ArrayList<>(), Arrays.asList(new ExprStmt(assign), ret));
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), block);
        Program prog = new Program(Arrays.asList(iDecl, mainFun));

        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);
        // Expect no errors because i is a valid lvalue.
        assertEquals(0, ta.getNumErrors(), "Valid lvalue assignment should produce no errors.");
    }

    /**
     * Invalid lvalue: (i + 2) is used on the left-hand side.
     * Example:
     *    int i;
     *    (i+2) = 3;
     */
    @Test
    public void testInvalidLValueAssignment_BinOp() {
        VarDecl iDecl = new VarDecl(BaseType.INT, "i");
        // LHS is a binary operation: i+2 (which is not a valid lvalue)
        BinOp nonLvalue = new BinOp(new VarExpr("i"), Op.ADD, new IntLiteral(2));
        Assign assign = new Assign(nonLvalue, new IntLiteral(3));
        // We add a return statement (using i) so that the function is complete.
        Return ret = new Return(new VarExpr("i"));
        Block block = new Block(new ArrayList<>(), Arrays.asList(new ExprStmt(assign), ret));
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), block);
        Program prog = new Program(Arrays.asList(iDecl, mainFun));

        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);
        assertTrue(ta.getNumErrors() > 0,
                "Using (i+2) as the left-hand side of an assignment should produce an error.");
    }

    /**
     * Invalid use of address-of: &3 where 3 is not an lvalue.
     */
    @Test
    public void testInvalidAddressOfNonLValue() {
        // &3 is not allowed because 3 (an IntLiteral) is not a valid lvalue.
        AddressOfExpr addrOfNonLValue = new AddressOfExpr(new IntLiteral(3));
        Return ret = new Return(addrOfNonLValue);
        Block block = new Block(new ArrayList<>(), Arrays.asList(new ExprStmt(addrOfNonLValue), ret));
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), block);
        Program prog = new Program(Arrays.asList(mainFun));

        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);
        assertTrue(ta.getNumErrors() > 0,
                "Applying & to a non-lvalue (3) should produce an error.");
    }

    /**
     * Invalid lvalue: foo().a where foo() is a function call (not an lvalue).
     */
    @Test
    public void testInvalidFieldAccessOnNonLValue() {
        VarDecl iDecl = new VarDecl(BaseType.INT, "i");
        // Create a function call expression foo() (which is not an lvalue)
        FunCallExpr fooCall = new FunCallExpr("foo", new ArrayList<>());
        // Then access field 'a' on it: foo().a is not an lvalue because foo() isn’t
        FieldAccessExpr fieldAccess = new FieldAccessExpr(fooCall, "a");
        // Use that as the LHS of an assignment: foo().a = i;
        Assign assign = new Assign(fieldAccess, new VarExpr("i"));
        Return ret = new Return(new VarExpr("i"));
        Block block = new Block(new ArrayList<>(), Arrays.asList(new ExprStmt(assign), ret));
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), block);
        Program prog = new Program(Arrays.asList(iDecl, mainFun));

        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);
        assertTrue(ta.getNumErrors() > 0,
                "Using foo().a (where foo() is not an lvalue) as the left-hand side should produce an error.");
    }
}

