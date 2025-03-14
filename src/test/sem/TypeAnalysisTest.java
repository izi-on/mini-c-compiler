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
        assertEquals(0, ta.getNumErrors(), "Pointer operations should produce no errors");
    }

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
     * int i;
     * i = 0;
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
     * int i;
     * (i+2) = 3;
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

    @Test
    public void testGlobalShadowingTypes() {
        // Global variable: int x;
        VarDecl globalX = new VarDecl(BaseType.INT, "x");

        // Function foo: declares a local variable x of type char that shadows the global x.
        VarDecl localX = new VarDecl(BaseType.CHAR, "x");
        VarExpr usageInFoo = new VarExpr("x");
        // The function returns the usage of x.
        Return retFoo = new Return(usageInFoo);
        // Build foo's block with the local declaration and return statement.
        Block fooBlock = new Block(new ArrayList<>(List.of(localX)), new ArrayList<>(List.of(retFoo)));
        FunDef foo = new FunDef(BaseType.CHAR, "foo", new ArrayList<>(), fooBlock);

        // Function bar: does not declare a local variable x.
        // Thus, usage of x in bar should resolve to the global variable.
        VarExpr usageInBar = new VarExpr("x");
        Return retBar = new Return(usageInBar);
        Block barBlock = new Block(new ArrayList<>(), new ArrayList<>(List.of(retBar)));
        FunDef bar = new FunDef(BaseType.INT, "bar", new ArrayList<>(), barBlock);

        // Build the program with the global declaration and both functions.
        List<Decl> decls = new ArrayList<>();
        decls.add(globalX);
        decls.add(foo);
        decls.add(bar);
        Program prog = new Program(decls);

        // Run the type analysis pass.
        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);

        // Check that the usage in foo has type char (the local declaration),
        // while the usage in bar has type int (from the global variable).
        assertEquals(BaseType.CHAR, usageInFoo.type, "Usage in foo should resolve to the locally declared type (char)");
        assertEquals(BaseType.INT, usageInBar.type, "Usage in bar should resolve to the global type (int)");

        // Expect no type errors.
        assertEquals(0, ta.getNumErrors(), "No type errors expected when shadowing is correctly handled");
    }

    @Test
    public void testFunctionShadowedByLocalVariable() {
        // Global function: int foo() { return 42; }
        Block fooBlock = new Block(
                new ArrayList<>(),
                List.of(new Return(new IntLiteral(42)))
        );
        FunDef globalFoo = new FunDef(BaseType.INT, "foo", new ArrayList<>(), fooBlock);

        // Function bar:
        // Declare a local variable 'foo' that shadows the global function.
        VarDecl localFoo = new VarDecl(BaseType.INT, "foo");
        // Then, in the same function, attempt to call 'foo()'
        FunCallExpr callFoo = new FunCallExpr("foo", new ArrayList<>());
        // Return the result of the call
        Return ret = new Return(callFoo);
        // The block for bar has the local declaration and then the return statement.
        Block barBlock = new Block(
                new ArrayList<>(List.of(localFoo)),
                new ArrayList<>(List.of(ret))
        );
        FunDef bar = new FunDef(BaseType.INT, "bar", new ArrayList<>(), barBlock);

        // Build the program with both declarations.
        List<Decl> decls = new ArrayList<>();
        decls.add(globalFoo);
        decls.add(bar);
        Program prog = new Program(decls);

        // Run semantic analysis (which includes type analysis)
        SemanticAnalyzer sem = new SemanticAnalyzer();
        sem.analyze(prog);

        // Since the call to 'foo()' inside 'bar' should resolve to the local variable (not a function),
        // type analysis should record an error.
        assertTrue(sem.getNumErrors() > 0, "Expected an error due to a function being shadowed by a local variable");
    }


    @Test
    void testDuplicateStructDefinition() {
        // Create the first struct "Point" with one field.
        VarDecl field1 = new VarDecl(BaseType.INT, "x");
        List<VarDecl> fields1 = new ArrayList<>();
        fields1.add(field1);
        StructTypeDecl struct1 = new StructTypeDecl("Point", fields1);

        // Create a second struct "Point" (duplicate) with a different field.
        VarDecl field2 = new VarDecl(BaseType.INT, "y");
        List<VarDecl> fields2 = new ArrayList<>();
        fields2.add(field2);
        StructTypeDecl struct2 = new StructTypeDecl("Point", fields2);

        // Build a program that contains both struct declarations.
        List<Decl> decls = new ArrayList<>();
        decls.add(struct1);
        decls.add(struct2);
        // Adding a dummy main function to complete the program.
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), new Block(new ArrayList<>(), new ArrayList<>()));
        decls.add(mainFun);
        Program prog = new Program(decls);

        // Run name analysis.
        TypeAnalyzer ta = new TypeAnalyzer();
         ta.visit(prog);

        // The duplicate struct definitions should be detected.
        assertTrue( ta.getNumErrors() > 0, "Duplicate struct definitions should cause a name analysis error");
    }

    /**
     * Test that a local variable shadows a global variable.
     * Global variable x is declared as int, but the local x is declared as char.
     * The usage of x inside main should resolve to the local declaration.
     * Function main returns a char to match the type of the local x.
     */
    @Test
    public void testGlobalLocalShadowing() {
        // Global variable: int x;
        VarDecl globalX = new VarDecl(BaseType.INT, "x");

        // In main, declare a local variable x of type char (shadows global x).
        VarDecl localX = new VarDecl(BaseType.CHAR, "x");
        VarExpr usageLocal = new VarExpr("x"); // Should resolve to local x (char)

        // Function returns the local x.
        Return ret = new Return(usageLocal);
        // Block that declares the local variable and then returns it.
        Block mainBlock = new Block(new ArrayList<>(List.of(localX)), new ArrayList<>(List.of(ret)));

        // Function main returns char.
        FunDef mainFun = new FunDef(BaseType.CHAR, "main", new ArrayList<>(), mainBlock);
        List<Decl> decls = new ArrayList<>();
        decls.add(globalX);
        decls.add(mainFun);
        Program prog = new Program(decls);

        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);

        // The usage of x should be resolved to the local declaration (char).
        assertEquals(BaseType.CHAR, usageLocal.type, "Local shadowing should override global x with type char.");
        assertEquals(0, ta.getNumErrors(), "No errors expected for valid global/local shadowing.");
    }

    /**
     * Test nested block shadowing.
     * Global x is of type int.
     * In an inner block, a new x (of type char) is declared.
     * A VarExpr inside the inner block should resolve to the inner x,
     * while a VarExpr outside the inner block (but in the same function) resolves to the global x.
     * The function returns the global x so its type is int.
     */
    @Test
    public void testNestedBlockShadowing() {
        // Global variable: int x;
        VarDecl globalX = new VarDecl(BaseType.INT, "x");
        VarExpr usageGlobal = new VarExpr("x"); // Outside inner block, should be int.

        // Inner block: declare a local x of type char.
        VarDecl innerLocalX = new VarDecl(BaseType.CHAR, "x");
        VarExpr usageInner = new VarExpr("x"); // Should resolve to innerLocalX (char)
        // Use inner x in an expression statement.
        ExprStmt innerExprStmt = new ExprStmt(usageInner);
        Block innerBlock = new Block(new ArrayList<>(List.of(innerLocalX)), new ArrayList<>(List.of(innerExprStmt)));

        // Function main: includes the inner block as a statement, then returns usageGlobal.
        Return outerRet = new Return(usageGlobal);
        Block outerBlock = new Block(new ArrayList<>(), new ArrayList<>(List.of(innerBlock, outerRet)));
        // Function returns int.
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), outerBlock);

        List<Decl> decls = new ArrayList<>();
        decls.add(globalX);
        decls.add(mainFun);
        Program prog = new Program(decls);

        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);

        // Inside the inner block, x should be of type char.
        assertEquals(BaseType.CHAR, usageInner.type, "Inner block shadowing should yield type char for x.");
        // Outside the inner block, x should resolve to the global variable (int).
        assertEquals(BaseType.INT, usageGlobal.type, "Outside inner block, x should refer to global int.");
        assertEquals(0, ta.getNumErrors(), "No errors expected for valid nested block shadowing.");
    }

    /**
     * Test that a function parameter shadows a global variable,
     * and that an inner block within the function can further shadow the parameter.
     * Global x is int, but the function parameter x is char.
     * Then an inner block declares x as int.
     * The function returns the parameter x (char), so all return types match.
     */
    @Test
    public void testFunctionParameterAndInnerBlockShadowing() {
        // Global variable: int x;
        VarDecl globalX = new VarDecl(BaseType.INT, "x");

        // Function parameter: char x shadows global x.
        VarDecl paramX = new VarDecl(BaseType.CHAR, "x");
        VarExpr usageParam = new VarExpr("x"); // In function body, should resolve to parameter x (char)

        // Inner block inside the function: declare local x of type int.
        VarDecl innerLocalX = new VarDecl(BaseType.INT, "x");
        VarExpr usageInner = new VarExpr("x"); // Should resolve to innerLocalX (int)
        ExprStmt innerExpr = new ExprStmt(usageInner);
        Block innerBlock = new Block(new ArrayList<>(List.of(innerLocalX)), new ArrayList<>(List.of(innerExpr)));

        // Function body: includes the inner block, then returns usageParam.
        Return bodyRet = new Return(usageParam);
        Block funcBlock = new Block(new ArrayList<>(), new ArrayList<>(List.of(innerBlock, bodyRet)));

        // Function returns char (matching the parameter type).
        FunDef fooFun = new FunDef(BaseType.CHAR, "foo", new ArrayList<>(List.of(paramX)), funcBlock);
        List<Decl> decls = new ArrayList<>();
        decls.add(globalX);
        decls.add(fooFun);
        Program prog = new Program(decls);

        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);

        // In the inner block, x should resolve to int.
        assertEquals(BaseType.INT, usageInner.type, "Inner block should shadow parameter x with type int.");
        // In the function body (outside the inner block), x should resolve to the parameter (char).
        assertEquals(BaseType.CHAR, usageParam.type, "Function parameter x should shadow global x and yield type char.");
        assertEquals(0, ta.getNumErrors(), "No errors expected for valid parameter and inner block shadowing.");
    }

    /**
     * Test multiple levels of shadowing within a single function.
     * Global y is int.
     * In the function body, two inner blocks each shadow y:
     *   - The first inner block declares y as char.
     *   - The second inner block declares y as pointer to int.
     * The function returns the global y (int), ensuring that the differing types do not conflict
     * with the overall strict typing.
     */
    @Test
    public void testMultipleLevelsOfShadowing() {
        // Global variable: int y;
        VarDecl globalY = new VarDecl(BaseType.INT, "y");
        VarExpr usageGlobal = new VarExpr("y"); // Outside inner blocks, should be int.

        // First inner block: shadow y with char.
        VarDecl block1Y = new VarDecl(BaseType.CHAR, "y");
        VarExpr usageBlock1 = new VarExpr("y"); // Should resolve to block1Y (char)
        ExprStmt stmtBlock1 = new ExprStmt(usageBlock1);
        Block block1 = new Block(new ArrayList<>(List.of(block1Y)), new ArrayList<>(List.of(stmtBlock1)));

        // Second inner block: shadow y with pointer to int.
        VarDecl block2Y = new VarDecl(new PointerType(BaseType.INT), "y");
        VarExpr usageBlock2 = new VarExpr("y"); // Should resolve to block2Y (pointer to int)
        ExprStmt stmtBlock2 = new ExprStmt(usageBlock2);
        Block block2 = new Block(new ArrayList<>(List.of(block2Y)), new ArrayList<>(List.of(stmtBlock2)));

        // Function main: returns usageGlobal, so function type is int.
        Return retGlobal = new Return(usageGlobal);
        Block funcBlock = new Block(new ArrayList<>(), new ArrayList<>(List.of(block1, block2, retGlobal)));
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), funcBlock);

        List<Decl> decls = new ArrayList<>();
        decls.add(globalY);
        decls.add(mainFun);
        Program prog = new Program(decls);

        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);

        // In block1, y should be char.
        assertEquals(BaseType.CHAR, usageBlock1.type, "First inner block should shadow y with type char.");
        // In block2, y should be pointer to int.
        assertEquals(new PointerType(BaseType.INT), usageBlock2.type, "Second inner block should shadow y with type pointer to int.");
        // Outside the inner blocks, y should refer to the global variable (int).
        assertEquals(BaseType.INT, usageGlobal.type, "Global y should remain of type int.");
        assertEquals(0, ta.getNumErrors(), "No errors expected for valid multiple level shadowing.");
    }

    @Test
    public void testGlobalLocalShadowingStruct() {
        // Declare struct type GlobalStruct with a dummy field.
        VarDecl globalDummy = new VarDecl(BaseType.INT, "dummy");
        StructTypeDecl globalStructDecl = new StructTypeDecl("GlobalStruct", new ArrayList<>(List.of(globalDummy)));

        // Declare struct type LocalStruct with a dummy field.
        VarDecl localDummy = new VarDecl(BaseType.INT, "dummy");
        StructTypeDecl localStructDecl = new StructTypeDecl("LocalStruct", new ArrayList<>(List.of(localDummy)));

        // Global variable x of type GlobalStruct.
        VarDecl globalX = new VarDecl(new StructType("GlobalStruct"), "x");

        // In main, declare local variable x of type LocalStruct (this shadows global x).
        VarDecl localX = new VarDecl(new StructType("LocalStruct"), "x");
        // Usage of x inside main: should resolve to the local declaration.
        VarExpr usageLocal = new VarExpr("x");

        // Return the local x.
        Return ret = new Return(usageLocal);
        Block mainBlock = new Block(new ArrayList<>(List.of(localX)), new ArrayList<>(List.of(ret)));

        // Function main returns a LocalStruct.
        FunDef mainFun = new FunDef(new StructType("LocalStruct"), "main", new ArrayList<>(), mainBlock);

        // Build the program with the struct declarations, global variable, and function.
        List<Decl> decls = new ArrayList<>();
        decls.add(globalStructDecl);
        decls.add(localStructDecl);
        decls.add(globalX);
        decls.add(mainFun);
        Program prog = new Program(decls);

        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);

        // Expect that the usage of x resolves to the local declaration of type LocalStruct.
        assertEquals(new StructType("LocalStruct"), usageLocal.type,
                "Local shadowing should override global x with type LocalStruct.");
        assertEquals(0, ta.getNumErrors(), "No errors expected for valid global/local shadowing with structs.");
    }

    /**
     * Test nested block shadowing with structs.
     * Global variable x is of type GlobalStruct.
     * An inner block declares a local x of type InnerStruct.
     * Inside the inner block, x should resolve to InnerStruct;
     * outside the inner block, x refers to the global GlobalStruct.
     */
    @Test
    public void testNestedBlockShadowingStruct() {
        // Declare struct type GlobalStruct.
        VarDecl globalDummy = new VarDecl(BaseType.INT, "dummy");
        StructTypeDecl globalStructDecl = new StructTypeDecl("GlobalStruct", new ArrayList<>(List.of(globalDummy)));

        // Declare struct type InnerStruct.
        VarDecl innerDummy = new VarDecl(BaseType.INT, "dummy");
        StructTypeDecl innerStructDecl = new StructTypeDecl("InnerStruct", new ArrayList<>(List.of(innerDummy)));

        // Global variable x of type GlobalStruct.
        VarDecl globalX = new VarDecl(new StructType("GlobalStruct"), "x");
        // Outside the inner block, usage of x.
        VarExpr usageGlobal = new VarExpr("x");

        // Inner block: declare a new x of type InnerStruct.
        VarDecl innerLocalX = new VarDecl(new StructType("InnerStruct"), "x");
        VarExpr usageInner = new VarExpr("x"); // This should resolve to innerLocalX.
        ExprStmt innerStmt = new ExprStmt(usageInner);
        Block innerBlock = new Block(new ArrayList<>(List.of(innerLocalX)), new ArrayList<>(List.of(innerStmt)));

        // Main block: includes the inner block and then returns the global x.
        Return ret = new Return(usageGlobal);
        Block mainBlock = new Block(new ArrayList<>(), new ArrayList<>(List.of(innerBlock, ret)));

        // Function main returns GlobalStruct.
        FunDef mainFun = new FunDef(new StructType("GlobalStruct"), "main", new ArrayList<>(), mainBlock);

        List<Decl> decls = new ArrayList<>();
        decls.add(globalStructDecl);
        decls.add(innerStructDecl);
        decls.add(globalX);
        decls.add(mainFun);
        Program prog = new Program(decls);

        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);

        // Inside inner block, x should be of type InnerStruct.
        assertEquals(new StructType("InnerStruct"), usageInner.type,
                "Inner block shadowing should yield type InnerStruct for x.");
        // Outside inner block, x should refer to the global variable.
        assertEquals(new StructType("GlobalStruct"), usageGlobal.type,
                "Outside inner block, x should refer to global GlobalStruct.");
        assertEquals(0, ta.getNumErrors(), "No errors expected for valid nested block shadowing with structs.");
    }

    /**
     * Test that a function parameter of a struct type shadows a global variable,
     * and that an inner block within the function can further shadow the parameter.
     * Global variable x is of type GlobalStruct.
     * The function parameter x is of type ParamStruct.
     * An inner block then declares x as type InnerStruct.
     * The function returns the parameter x (of type ParamStruct).
     */
    @Test
    public void testFunctionParameterAndInnerBlockShadowingStruct() {
        // Declare struct type GlobalStruct.
        VarDecl globalDummy = new VarDecl(BaseType.INT, "dummy");
        StructTypeDecl globalStructDecl = new StructTypeDecl("GlobalStruct", new ArrayList<>(List.of(globalDummy)));

        // Declare struct type ParamStruct.
        VarDecl paramDummy = new VarDecl(BaseType.INT, "dummy");
        StructTypeDecl paramStructDecl = new StructTypeDecl("ParamStruct", new ArrayList<>(List.of(paramDummy)));

        // Declare struct type InnerStruct.
        VarDecl innerDummy = new VarDecl(BaseType.INT, "dummy");
        StructTypeDecl innerStructDecl = new StructTypeDecl("InnerStruct", new ArrayList<>(List.of(innerDummy)));

        // Global variable x of type GlobalStruct.
        VarDecl globalX = new VarDecl(new StructType("GlobalStruct"), "x");

        // Function parameter: x of type ParamStruct (shadows global x).
        VarDecl paramX = new VarDecl(new StructType("ParamStruct"), "x");
        VarExpr usageParam = new VarExpr("x"); // Should resolve to the parameter.

        // Inner block: declare a local x of type InnerStruct.
        VarDecl innerLocalX = new VarDecl(new StructType("InnerStruct"), "x");
        VarExpr usageInner = new VarExpr("x"); // Should resolve to innerLocalX.
        ExprStmt innerStmt = new ExprStmt(usageInner);
        Block innerBlock = new Block(new ArrayList<>(List.of(innerLocalX)), new ArrayList<>(List.of(innerStmt)));

        // Function body: includes the inner block, then returns the parameter.
        Return ret = new Return(usageParam);
        Block funcBlock = new Block(new ArrayList<>(), new ArrayList<>(List.of(innerBlock, ret)));

        // Function foo returns ParamStruct.
        FunDef fooFun = new FunDef(new StructType("ParamStruct"), "foo", new ArrayList<>(List.of(paramX)), funcBlock);

        List<Decl> decls = new ArrayList<>();
        decls.add(globalStructDecl);
        decls.add(paramStructDecl);
        decls.add(innerStructDecl);
        decls.add(globalX);
        decls.add(fooFun);
        Program prog = new Program(decls);

        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);

        // In the inner block, x should resolve to InnerStruct.
        assertEquals(new StructType("InnerStruct"), usageInner.type,
                "Inner block should shadow parameter x with type InnerStruct.");
        // In the function body (outside the inner block), x should resolve to the parameter.
        assertEquals(new StructType("ParamStruct"), usageParam.type,
                "Function parameter x should shadow global x and yield type ParamStruct.");
        assertEquals(0, ta.getNumErrors(), "No errors expected for valid parameter and inner block shadowing with structs.");
    }

    /**
     * Test multiple levels of shadowing using structs.
     * Global variable y is of type GlobalStruct.
     * In the function body, two inner blocks shadow y:
     *   - The first inner block declares y as type Block1Struct.
     *   - The second inner block declares y as a pointer to Block2Struct.
     * The function returns the global y (of type GlobalStruct).
     */
    @Test
    public void testMultipleLevelsOfShadowingStruct() {
        // Declare struct type GlobalStruct.
        VarDecl globalDummy = new VarDecl(BaseType.INT, "dummy");
        StructTypeDecl globalStructDecl = new StructTypeDecl("GlobalStruct", new ArrayList<>(List.of(globalDummy)));

        // Declare struct type Block1Struct.
        VarDecl block1Dummy = new VarDecl(BaseType.INT, "dummy");
        StructTypeDecl block1StructDecl = new StructTypeDecl("Block1Struct", new ArrayList<>(List.of(block1Dummy)));

        // Declare struct type Block2Struct.
        VarDecl block2Dummy = new VarDecl(BaseType.INT, "dummy");
        StructTypeDecl block2StructDecl = new StructTypeDecl("Block2Struct", new ArrayList<>(List.of(block2Dummy)));

        // Global variable y of type GlobalStruct.
        VarDecl globalY = new VarDecl(new StructType("GlobalStruct"), "y");
        VarExpr usageGlobal = new VarExpr("y"); // Outside inner blocks, should be GlobalStruct.

        // First inner block: shadow y with Block1Struct.
        VarDecl block1Y = new VarDecl(new StructType("Block1Struct"), "y");
        VarExpr usageBlock1 = new VarExpr("y"); // Resolves to block1Y.
        ExprStmt stmtBlock1 = new ExprStmt(usageBlock1);
        Block block1 = new Block(new ArrayList<>(List.of(block1Y)), new ArrayList<>(List.of(stmtBlock1)));

        // Second inner block: shadow y with a pointer to Block2Struct.
        VarDecl block2Y = new VarDecl(new PointerType(new StructType("Block2Struct")), "y");
        VarExpr usageBlock2 = new VarExpr("y"); // Resolves to block2Y.
        ExprStmt stmtBlock2 = new ExprStmt(usageBlock2);
        Block block2 = new Block(new ArrayList<>(List.of(block2Y)), new ArrayList<>(List.of(stmtBlock2)));

        // Function main returns the global y (GlobalStruct).
        Return ret = new Return(usageGlobal);
        Block mainBlock = new Block(new ArrayList<>(), new ArrayList<>(List.of(block1, block2, ret)));
        FunDef mainFun = new FunDef(new StructType("GlobalStruct"), "main", new ArrayList<>(), mainBlock);

        List<Decl> decls = new ArrayList<>();
        decls.add(globalStructDecl);
        decls.add(block1StructDecl);
        decls.add(block2StructDecl);
        decls.add(globalY);
        decls.add(mainFun);
        Program prog = new Program(decls);

        TypeAnalyzer ta = new TypeAnalyzer();
        ta.visit(prog);

        // In block1, y should resolve to Block1Struct.
        assertEquals(new StructType("Block1Struct"), usageBlock1.type,
                "First inner block should shadow y with type Block1Struct.");
        // In block2, y should resolve to pointer to Block2Struct.
        assertEquals(new PointerType(new StructType("Block2Struct")), usageBlock2.type,
                "Second inner block should shadow y with type pointer to Block2Struct.");
        // Outside inner blocks, y remains GlobalStruct.
        assertEquals(new StructType("GlobalStruct"), usageGlobal.type,
                "Global y should remain of type GlobalStruct.");
        assertEquals(0, ta.getNumErrors(), "No errors expected for valid multiple level shadowing with structs.");
    }
}
