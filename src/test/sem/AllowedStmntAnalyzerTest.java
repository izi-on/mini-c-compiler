package sem;

import ast.*;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.Arrays;

public class AllowedStmntAnalyzerTest {

    @Test
    public void testValidContinueAndBreakInsideLoop() {
        // Build a while loop: while (1) { continue; break; }
        Expr condition = new IntLiteral(1);
        // Inside the loop body, include both a continue and a break statement.
        Continue continueStmt = new Continue();
        Break breakStmt = new Break();
        Block loopBody = new Block(new ArrayList<>(), Arrays.asList(continueStmt, breakStmt));
        While loop = new While(condition, loopBody);

        // Wrap the loop in a main block.
        Block mainBlock = new Block(new ArrayList<>(), Arrays.asList(loop));

        // Run the AllowedStmntAnalyzer
        AllowedStmntAnalyzer analyzer = new AllowedStmntAnalyzer();
        analyzer.visit(mainBlock);

        // Since both continue and break are used inside a loop, there should be no errors.
        assertEquals(0, analyzer.getNumErrors(), "No errors expected for continue and break inside a loop");
    }

    @Test
    public void testInvalidContinueOutsideLoop() {
        // Build a block with a continue statement not inside any loop.
        Continue continueStmt = new Continue();
        Block block = new Block(new ArrayList<>(), Arrays.asList(continueStmt));

        AllowedStmntAnalyzer analyzer = new AllowedStmntAnalyzer();
        analyzer.visit(block);

        // Since the continue is not nested inside any loop, an error should be reported.
        assertTrue(analyzer.getNumErrors() > 0, "Expected an error for a continue statement outside a loop");
    }

    @Test
    public void testInvalidBreakOutsideLoop() {
        // Build a block with a break statement not inside any loop.
        Break breakStmt = new Break();
        Block block = new Block(new ArrayList<>(), Arrays.asList(breakStmt));

        AllowedStmntAnalyzer analyzer = new AllowedStmntAnalyzer();
        analyzer.visit(block);

        // Since the break is not inside a loop, an error should be reported.
        assertTrue(analyzer.getNumErrors() > 0, "Expected an error for a break statement outside a loop");
    }
}