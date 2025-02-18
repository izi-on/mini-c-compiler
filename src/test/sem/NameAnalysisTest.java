package sem;

import static org.junit.jupiter.api.Assertions.*;

import ast.*;
import sem.error.*;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * Test cases for the NameAnalyzer pass.
 */
public class NameAnalysisTest {

    /**
     * Test that two global variable declarations with the same name generate an error.
     */
    @Test
    void testDuplicateGlobalVarDecl() {
        VarDecl var1 = new VarDecl(BaseType.INT, "x");
        VarDecl var2 = new VarDecl(BaseType.INT, "x");
        List<Decl> decls = new ArrayList<>();
        decls.add(var1);
        decls.add(var2);
        Program prog = new Program(decls);
        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);
        assertTrue(na.getNumErrors() > 0, "Duplicate global variable declarations should cause an error");
    }

    /**
     * Test that a global variable is visible inside a function.
     * The VarExpr in the function body should be linked to the global VarDecl.
     */
    @Test
    void testValidGlobalVarUsage() {
        VarDecl globalX = new VarDecl(BaseType.INT, "x");
        // Build a function: int main() { return x; }
        VarExpr varExpr = new VarExpr("x");
        Return ret = new Return(varExpr);
        List<Stmt> stmts = new ArrayList<>();
        stmts.add(ret);
        Block mainBlock = new Block(new ArrayList<>(), stmts);
        FunDef mainFunc = new FunDef(BaseType.INT, "main", new ArrayList<>(), mainBlock);
        List<Decl> decls = new ArrayList<>();
        decls.add(globalX);
        decls.add(mainFunc);
        Program prog = new Program(decls);
        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);
        assertNotNull(varExpr.vd, "VarExpr should be linked to a declaration");
        assertEquals(globalX, varExpr.vd, "VarExpr should link to the global variable declaration");
        assertEquals(0, na.getNumErrors(), "No errors expected for valid usage");
    }

    /**
     * Test shadowing: an inner variable declaration should hide an outer one.
     * In function foo() { { int x; return x; } }, the VarExpr should link to the inner declaration.
     */
    @Test
    void testShadowing() {
        VarDecl globalX = new VarDecl(BaseType.INT, "x");
        // In function foo, declare a new local x that shadows the global one.
        VarDecl localX = new VarDecl(BaseType.INT, "x");
        VarExpr varExpr = new VarExpr("x");
        Return ret = new Return(varExpr);
        List<Stmt> innerStmts = new ArrayList<>();
        innerStmts.add(ret);
        Block innerBlock = new Block(new ArrayList<>(List.of(localX)), innerStmts);
        List<Stmt> stmts = new ArrayList<>();
        stmts.add(innerBlock);
        Block funcBlock = new Block(new ArrayList<>(), stmts);
        FunDef fooFunc = new FunDef(BaseType.INT, "foo", new ArrayList<>(), funcBlock);
        List<Decl> decls = new ArrayList<>();
        decls.add(globalX);
        decls.add(fooFunc);
        Program prog = new Program(decls);
        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);
        assertNotNull(varExpr.vd, "VarExpr should be linked to a declaration");
        assertEquals(localX, varExpr.vd, "VarExpr should link to the local (shadowing) variable");
        assertEquals(0, na.getNumErrors(), "No errors expected for proper shadowing");
    }

    /**
     * Test that duplicate function declarations (prototypes) are detected.
     */
    @Test
    void testDuplicateFunctionDeclaration() {
        FunDecl func1 = new FunDecl(BaseType.INT, "foo", new ArrayList<>());
        FunDecl func2 = new FunDecl(BaseType.INT, "foo", new ArrayList<>());
        List<Decl> decls = new ArrayList<>();
        decls.add(func1);
        decls.add(func2);
        Program prog = new Program(decls);
        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);
        assertTrue(na.getNumErrors() > 0, "Duplicate function declarations should cause an error");
    }

    /**
     * Test that a function declaration and a function definition with mismatching types cause an error.
     */
    @Test
    void testFunctionDeclarationDefinitionMismatch() {
        FunDecl funcDecl = new FunDecl(BaseType.INT, "foo", new ArrayList<>());
        // Create a function definition with a different return type (e.g. CHAR instead of INT)
        Block emptyBlock = new Block(new ArrayList<>(), new ArrayList<>());
        FunDef funcDef = new FunDef(BaseType.CHAR, "foo", new ArrayList<>(), emptyBlock);
        List<Decl> decls = new ArrayList<>();
        decls.add(funcDecl);
        decls.add(funcDef);
        Program prog = new Program(decls);
        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);
        assertTrue(na.getNumErrors() > 0, "Function declaration/definition type mismatches should cause an error");
    }

    /**
     * Test that calling an undeclared function produces an error.
     */
    @Test
    void testUndeclaredFunctionCall() {
        // Create a function main that calls foo(), but no declaration for foo exists.
        FunCallExpr callFoo = new FunCallExpr("foo", new ArrayList<>());
        ExprStmt callStmt = new ExprStmt(callFoo);
        List<Stmt> stmts = new ArrayList<>();
        stmts.add(callStmt);
        stmts.add(new Return(new IntLiteral(0)));
        Block block = new Block(new ArrayList<>(), stmts);
        FunDef mainFunc = new FunDef(BaseType.INT, "main", new ArrayList<>(), block);
        Program prog = new Program(new ArrayList<>(List.of(mainFunc)));
        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);
        assertTrue(na.getNumErrors() > 0, "Calling an undeclared function should cause an error");
    }

    /**
     * Test that a struct declaration with duplicate field names produces an error.
     */
    @Test
    void testDuplicateStructField() {
        VarDecl field1 = new VarDecl(BaseType.INT, "bar");
        VarDecl field2 = new VarDecl(BaseType.INT, "bar");
        List<VarDecl> fields = new ArrayList<>();
        fields.add(field1);
        fields.add(field2);
        StructTypeDecl structDecl = new StructTypeDecl("foo_t", fields);
        Program prog = new Program(new ArrayList<>(List.of(structDecl)));
        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);
        assertTrue(na.getNumErrors() > 0, "Duplicate struct fields should cause an error");
    }

    /**
     * Test that built-in functions are recognized.
     * (Built-in functions are added by NameAnalyzer.addDummyFuncs.)
     */
    @Test
    void testBuiltInFunctions() {
        // Create a function main that calls print_s.
        FunCallExpr callPrintS = new FunCallExpr("print_s", new ArrayList<>());
        ExprStmt callStmt = new ExprStmt(callPrintS);
        List<Stmt> stmts = new ArrayList<>();
        stmts.add(callStmt);
        stmts.add(new Return(new IntLiteral(0)));
        Block block = new Block(new ArrayList<>(), stmts);
        FunDef mainFunc = new FunDef(BaseType.INT, "main", new ArrayList<>(), block);
        List<Decl> decls = new ArrayList<>();
        decls.add(mainFunc);
        Program prog = new Program(decls);
        // Add built-in functions
        NameAnalyzer.addDummyFuncs(prog);
        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);
        assertEquals(0, na.getNumErrors(), "Built-in functions should not produce errors");
        assertNotNull(callPrintS.fd, "Built-in function call should be linked to its dummy declaration");
    }

    /**
     * Test that a function parameter is in scope inside the function body.
     */
    @Test
    void testFunctionParameterScoping() {
        VarDecl paramA = new VarDecl(BaseType.INT, "a");
        VarExpr varA = new VarExpr("a");
        Return ret = new Return(varA);
        Block block = new Block(new ArrayList<>(), new ArrayList<>(List.of(ret)));
        FunDef fooFunc = new FunDef(BaseType.INT, "foo", new ArrayList<>(List.of(paramA)), block);
        Program prog = new Program(new ArrayList<>(List.of(fooFunc)));
        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);
        assertNotNull(varA.vd, "Parameter usage should be linked to its declaration");
        assertEquals(paramA, varA.vd, "VarExpr should be linked to the corresponding parameter declaration");
        assertEquals(0, na.getNumErrors(), "No errors expected for valid parameter scoping");
    }

    /**
     * Test that a variable declared inside a block is not visible outside that block.
     */
    @Test
    void testVariableOutOfScope() {
        // Build a function: int foo() { { int x; } return x; }
        VarDecl localX = new VarDecl(BaseType.INT, "x");
        VarExpr varX = new VarExpr("x");
        Block innerBlock = new Block(new ArrayList<>(List.of(localX)), new ArrayList<>());
        Return ret = new Return(varX);
        List<Stmt> stmts = new ArrayList<>();
        stmts.add(innerBlock);
        stmts.add(ret);
        Block block = new Block(new ArrayList<>(), stmts);
        FunDef fooFunc = new FunDef(BaseType.INT, "foo", new ArrayList<>(), block);
        Program prog = new Program(new ArrayList<>(List.of(fooFunc)));
        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);
        assertTrue(na.getNumErrors() > 0, "Using a variable outside its block scope should cause an error");
    }

    @Test
    void testGlobalShadowing2() {
        // Global variable: int x;
        VarDecl globalX = new VarDecl(BaseType.INT, "x");

        // Function foo: declares a local variable 'x' that shadows the global
        VarDecl localXFoo = new VarDecl(BaseType.INT, "x");
        VarExpr usageInFoo = new VarExpr("x");
        Return retFoo = new Return(usageInFoo);
        // Build foo's block: declare local x and then return x (should resolve to localXFoo)
        Block fooBlock = new Block(new ArrayList<>(List.of(localXFoo)), new ArrayList<>(List.of(retFoo)));
        FunDef foo = new FunDef(BaseType.INT, "foo", new ArrayList<>(), fooBlock);

        // Function bar: does not declare a local x; usage should resolve to global x
        VarExpr usageInBar = new VarExpr("x");
        Return retBar = new Return(usageInBar);
        Block barBlock = new Block(new ArrayList<>(), new ArrayList<>(List.of(retBar)));
        FunDef bar = new FunDef(BaseType.INT, "bar", new ArrayList<>(), barBlock);

        List<Decl> decls = new ArrayList<>();
        decls.add(globalX);
        decls.add(foo);
        decls.add(bar);
        Program prog = new Program(decls);

        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);

        // In foo, the usage of 'x' must resolve to the local declaration (localXFoo)
        assertNotNull(usageInFoo.vd, "Usage in foo should be linked to a declaration");
        assertEquals(localXFoo, usageInFoo.vd, "Usage in foo should resolve to the local 'x'");

        // In bar, the usage of 'x' must resolve to the global declaration (globalX)
        assertNotNull(usageInBar.vd, "Usage in bar should be linked to a declaration");
        assertEquals(globalX, usageInBar.vd, "Usage in bar should resolve to the global 'x'");

        assertEquals(0, na.getNumErrors(), "No errors expected for proper shadowing in globalShadowing2");
    }

    @Test
    void testNestedGlobalShadowing() {
        // Global variable: int x;
        VarDecl globalX = new VarDecl(BaseType.INT, "x");

        // Function foo: declares a local variable 'x' that shadows the global
        VarDecl localX = new VarDecl(BaseType.INT, "x");
        // Inside foo, create an inner block that does NOT redeclare 'x'
        VarExpr innerUsage = new VarExpr("x");
        Block innerBlock = new Block(new ArrayList<>(), new ArrayList<>(List.of(new ExprStmt(innerUsage))));

        // Also in foo, use 'x' in the outer block
        VarExpr outerUsage = new VarExpr("x");
        List<Stmt> fooStmts = new ArrayList<>();
        fooStmts.add(innerBlock);
        fooStmts.add(new Return(outerUsage));
        Block fooBlock = new Block(new ArrayList<>(List.of(localX)), fooStmts);
        FunDef foo = new FunDef(BaseType.INT, "foo", new ArrayList<>(), fooBlock);

        // Function bar: no local declaration; usage should resolve to the global variable
        VarExpr barUsage = new VarExpr("x");
        Block barBlock = new Block(new ArrayList<>(), new ArrayList<>(List.of(new Return(barUsage))));
        FunDef bar = new FunDef(BaseType.INT, "bar", new ArrayList<>(), barBlock);

        List<Decl> decls = new ArrayList<>();
        decls.add(globalX);
        decls.add(foo);
        decls.add(bar);
        Program prog = new Program(decls);

        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);

        // Inside foo, both innerUsage and outerUsage should resolve to localX.
        assertNotNull(innerUsage.vd, "Inner usage in foo should be linked to a declaration");
        assertEquals(localX, innerUsage.vd, "Inner usage in foo should resolve to the local 'x'");

        assertNotNull(outerUsage.vd, "Outer usage in foo should be linked to a declaration");
        assertEquals(localX, outerUsage.vd, "Outer usage in foo should resolve to the local 'x'");

        // In bar, usage should resolve to the global variable.
        assertNotNull(barUsage.vd, "Usage in bar should be linked to a declaration");
        assertEquals(globalX, barUsage.vd, "Usage in bar should resolve to the global 'x'");

        assertEquals(0, na.getNumErrors(), "No errors expected for proper nested shadowing");
    }

    @Test
    public void testLocalVariableShadowsFunction() {
        // Global function: int foo() { return 42; }
        FunDef globalFoo = new FunDef(
                BaseType.INT,
                "foo",
                new ArrayList<>(),
                new Block(
                        new ArrayList<>(),
                        new ArrayList<>(List.of(new Return(new IntLiteral(42))))
                )
        );

        // In function bar:
        // (a) In the outer block, a call to foo() should resolve to the global function.
        FunCallExpr callFooOuter = new FunCallExpr("foo", new ArrayList<>());

        // (b) In an inner block, declare a local variable named "foo" (type int).
        VarDecl localFoo = new VarDecl(BaseType.INT, "foo");
        // Inside that inner block, use the identifier as a variable.
        VarExpr usageFooLocal = new VarExpr("foo");
        // Also, attempt to call foo() within the inner block.
        // Since the local variable shadows the global function, this function call should be flagged as erroneous.
        FunCallExpr callFooLocal = new FunCallExpr("foo", new ArrayList<>());

        // Build the inner block: it declares the local variable and then contains two expression statements.
        Block innerBlock = new Block(
                new ArrayList<>(List.of(localFoo)),
                new ArrayList<>(List.of(new ExprStmt(usageFooLocal), new ExprStmt(callFooLocal)))
        );

        // Build the outer block of function bar:
        // First, perform a function call to foo() (should resolve to the global function).
        // Then, include the inner block that introduces the shadowing.
        // Finally, return 0.
        List<Stmt> barStmts = new ArrayList<>();
        barStmts.add(new ExprStmt(callFooOuter));
        barStmts.add(innerBlock);
        barStmts.add(new Return(new IntLiteral(0)));
        Block barBlock = new Block(new ArrayList<>(), barStmts);
        FunDef bar = new FunDef(BaseType.INT, "bar", new ArrayList<>(), barBlock);

        // Build the program containing the global function and function bar.
        List<Decl> decls = new ArrayList<>();
        decls.add(globalFoo);
        decls.add(bar);
        Program prog = new Program(decls);

        // Run the name analysis pass.
        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);

        // --- Check outer block usage ---
        // The outer call to foo() should resolve to the global function.
        assertNotNull(callFooOuter.fd, "The outer call to foo() should be linked to a function declaration");
        assertEquals(globalFoo, callFooOuter.fd, "The outer call should resolve to the global function 'foo'");

        // --- Check inner block usage ---
        // The variable usage inside the inner block should resolve to the local variable.
        assertNotNull(usageFooLocal.vd, "The usage of foo in the inner block should be linked to a declaration");
        assertEquals(localFoo, usageFooLocal.vd, "The inner usage should resolve to the local variable 'foo'");

        // The function call inside the inner block is an error because lookup returns a variable.
        // We expect that the NameAnalyzer has recorded at least one error.
        assertTrue(na.getNumErrors() > 0, "A function call to a shadowed identifier should produce a name error");
    }
}