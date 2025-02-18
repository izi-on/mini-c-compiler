package sem;

import org.junit.Test;
import java.util.ArrayList;
import java.util.Arrays;
import ast.*;
import sem.NameAnalyzer;

import static org.junit.jupiter.api.Assertions.*;

public class NameAnalysisShadowingTest {

    /**
     * Test that a local variable shadows a global variable.
     * Global x (int) is declared and then in main a local x (char) is declared.
     * The usage in main should resolve to the local variable.
     */
    @Test
    public void testGlobalLocalShadowing() {
        // Global variable: int x;
        VarDecl globalX = new VarDecl(BaseType.INT, "x");
        // In main, declare a local variable x of type char.
        VarDecl localX = new VarDecl(BaseType.CHAR, "x");
        // Use x in main block
        VarExpr useX = new VarExpr("x");
        Return ret = new Return(useX);
        Block block = new Block(new ArrayList<>(Arrays.asList(localX)), new ArrayList<>(Arrays.asList(ret)));
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), block);
        Program prog = new Program(new ArrayList<>(Arrays.asList(globalX, mainFun)));

        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);

        assertNotNull(useX.vd, "Usage of 'x' should be linked to a declaration.");
        assertEquals(localX, useX.vd, "Local declaration should shadow the global one for identifier 'x'.");
    }

    @Test
    public void testGlobalParamShadowing() {
        // Global variable: int x;
        VarDecl globalX = new VarDecl(BaseType.INT, "x");
        // Function with parameter x of type char.
        VarDecl paramX = new VarDecl(BaseType.CHAR, "x");
        // Use x in function body
        VarExpr useX = new VarExpr("x");
        Return ret = new Return(useX);
        Block block = new Block(new ArrayList<>(), new ArrayList<>(Arrays.asList(ret)));
        FunDef func = new FunDef(BaseType.INT, "func", new ArrayList<>(Arrays.asList(paramX)), block);
        Program prog = new Program(new ArrayList<>(Arrays.asList(globalX, func)));

        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);

        assertNotNull(useX.vd, "Usage of 'x' should be linked to a declaration.");
        assertEquals(paramX, useX.vd, "Parameter declaration should shadow the global one for identifier 'x'.");
    }

    @Test
    public void testGlobalNestedScopeShadowing() {
        // Global variable: int x;
        VarDecl globalX = new VarDecl(BaseType.INT, "x");
        // In main, declare a local variable x of type char.
        VarDecl localX = new VarDecl(BaseType.CHAR, "x");
        // In a nested block, declare another local variable x of type int.
        VarDecl nestedX = new VarDecl(BaseType.INT, "x");
        // Use x in nested block
        VarExpr useX = new VarExpr("x");
        Return ret = new Return(useX);
        Block nestedBlock = new Block(new ArrayList<>(Arrays.asList(nestedX)), new ArrayList<>(Arrays.asList(ret)));
        Block mainBlock = new Block(new ArrayList<>(Arrays.asList(localX)), new ArrayList<>(Arrays.asList(nestedBlock)));
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), mainBlock);
        Program prog = new Program(new ArrayList<>(Arrays.asList(globalX, mainFun)));

        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);

        assertNotNull(useX.vd, "Usage of 'x' should be linked to a declaration.");
        assertEquals(nestedX, useX.vd, "Nested declaration should shadow the outer and global one for identifier 'x'.");
    }

    @Test
    public void testGlobalStructFieldShadowing() {
        // Global variable: int x;
        VarDecl globalX = new VarDecl(BaseType.INT, "x");
        // Struct with field x of type char.
        StructTypeDecl structDecl = new StructTypeDecl("TestStruct", new ArrayList<>(Arrays.asList(new VarDecl(BaseType.CHAR, "x"))));
        // Use x in main block
        VarExpr useX = new VarExpr("x");
        Return ret = new Return(useX);
        Block block = new Block(new ArrayList<>(), new ArrayList<>(Arrays.asList(ret)));
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), block);
        Program prog = new Program(new ArrayList<>(Arrays.asList(globalX, structDecl, mainFun)));

        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);

        assertNotNull(useX.vd, "Usage of 'x' should be linked to a declaration.");
        assertEquals(globalX, useX.vd, "Struct field should not shadow the global variable for identifier 'x'.");
    }

    @Test
    public void testGlobalFunctionShadowing() {
        // Global variable: int x;
        VarDecl globalX = new VarDecl(BaseType.INT, "x");
        // Function with the same name as the global variable.
        FunDef func = new FunDef(BaseType.INT, "x", new ArrayList<>(), new Block(new ArrayList<>(), new ArrayList<>()));
        // Use x in main block
        VarExpr useX = new VarExpr("x");
        Return ret = new Return(useX);
        Block block = new Block(new ArrayList<>(), new ArrayList<>(Arrays.asList(ret)));
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), block);
        Program prog = new Program(new ArrayList<>(Arrays.asList(globalX, func, mainFun)));

        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);

        assertNotNull(useX.vd, "Usage of 'x' should be linked to a declaration.");
        assertEquals(globalX, useX.vd, "Function declaration should not shadow the global variable for identifier 'x'.");
    }

    @Test
    public void testVariableShadowsStructType() {
        // Declare a struct type "MyStruct"
        StructTypeDecl structDecl = new StructTypeDecl("MyStruct", new ArrayList<>());

        // Declare a variable "MyStruct" of type int
        VarDecl varDecl = new VarDecl(BaseType.INT, "MyStruct");

        // Use "MyStruct" in the main block (should resolve to the variable, not the struct type)
        VarExpr useMyStruct = new VarExpr("MyStruct");
        Return ret = new Return(useMyStruct);
        Block block = new Block(new ArrayList<>(Arrays.asList(varDecl)), new ArrayList<>(Arrays.asList(ret)));
        FunDef mainFun = new FunDef(BaseType.INT, "main", new ArrayList<>(), block);

        // Create the program with the struct declaration, variable declaration, and main function
        Program prog = new Program(new ArrayList<>(Arrays.asList(structDecl, mainFun)));

        // Run the name analyzer
        NameAnalyzer na = new NameAnalyzer();
        na.visit(prog);

        // Assert that the usage of "MyStruct" is linked to the variable declaration
        assertNotNull(useMyStruct.vd, "Usage of 'MyStruct' should be linked to a declaration.");
        assertEquals(varDecl, useMyStruct.vd, "Variable declaration should shadow the struct type for identifier 'MyStruct'.");
    }
}