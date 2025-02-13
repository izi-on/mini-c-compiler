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
}