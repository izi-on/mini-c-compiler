package test.lexer;

import static org.junit.jupiter.api.Assertions.*;

import lexer.Scanner;
import lexer.Token;
import lexer.Token.Category;
import lexer.Tokeniser;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.nio.file.Path;

/**
 * Example JUnit 5 tests for the Tokeniser class.
 */
class TokeniserTest {

    /**
     * Helper method to tokenize an entire file and return the resulting tokens (excluding EOF).
     */
    private List<Token> tokenizeFile(File sourceFile) throws IOException {
        Scanner scanner = new Scanner(sourceFile);
        Tokeniser tokeniser = new Tokeniser(scanner);

        List<Token> tokens = new ArrayList<>();
        Token t;
        do {
            t = tokeniser.nextToken();
            tokens.add(t);
        } while (t.category != Category.EOF);

        return tokens;
    }

    @Test
    void testSingleCharacterSymbols(@TempDir Path tempDir) throws IOException {
        String code = "= { } ( ) [ ] ; , . + - * / % & < >";
        File sourceFile = tempDir.resolve("singleSymbols.c").toFile();
        try (FileWriter fw = new FileWriter(sourceFile)) {
            fw.write(code);
        }

        List<Token> tokens = tokenizeFile(sourceFile);

        // We expect the tokens: ASSIGN, LBRA, RBRA, LPAR, RPAR, LSBR, RSBR, SC, COMMA, DOT,
        // PLUS, MINUS, ASTERISK, DIV, REM, AND, LT, GT
        Category[] expectedCategories = {
                Category.ASSIGN, Category.LBRA, Category.RBRA, Category.LPAR, Category.RPAR,
                Category.LSBR, Category.RSBR, Category.SC, Category.COMMA, Category.DOT,
                Category.PLUS, Category.MINUS, Category.ASTERISK, Category.DIV, Category.REM,
                Category.AND, Category.LT, Category.GT, Category.EOF
        };

        assertEquals(expectedCategories.length, tokens.size());
        for (int i = 0; i < expectedCategories.length; i++) {
            assertEquals(expectedCategories[i], tokens.get(i).category,
                    "Token " + i + " mismatch in single character symbols test.");
        }
    }

    @Test
    void testMultiCharacterSymbols(@TempDir Path tempDir) throws IOException {
        String code = "== != <= >= && ||";
        File sourceFile = tempDir.resolve("multiSymbols.c").toFile();
        try (FileWriter fw = new FileWriter(sourceFile)) {
            fw.write(code);
        }

        List<Token> tokens = tokenizeFile(sourceFile);

        // We expect: EQ, NE, LE, GE, LOGAND, LOGOR
        Category[] expectedCategories = {
                Category.EQ, Category.NE, Category.LE, Category.GE,
                Category.LOGAND, Category.LOGOR, Category.EOF
        };

        assertEquals(expectedCategories.length, tokens.size());
        for (int i = 0; i < expectedCategories.length; i++) {
            assertEquals(expectedCategories[i], tokens.get(i).category,
                    "Token " + i + " mismatch in multi-character symbols test.");
        }
    }

    @Test
    void testKeywords(@TempDir Path tempDir) throws IOException {
        // All keywords from Token.Category used in createRootSymbols
        String code = "if else while return struct sizeof continue break #include int void char";
        File sourceFile = tempDir.resolve("keywords.c").toFile();
        try (FileWriter fw = new FileWriter(sourceFile)) {
            fw.write(code);
        }

        List<Token> tokens = tokenizeFile(sourceFile);

        // We expect each of them to become the corresponding category.
        Category[] expectedCategories = {
                Category.IF, Category.ELSE, Category.WHILE, Category.RETURN,
                Category.STRUCT, Category.SIZEOF, Category.CONTINUE, Category.BREAK,
                Category.INCLUDE, Category.INT, Category.VOID, Category.CHAR,
                Category.EOF
        };

        assertEquals(expectedCategories.length, tokens.size());
        for (int i = 0; i < expectedCategories.length; i++) {
            assertEquals(expectedCategories[i], tokens.get(i).category,
                    "Token " + i + " mismatch in keyword test.");
        }
    }

    @Test
    void testIdentifiersAndIntegers(@TempDir Path tempDir) throws IOException {
        // The tokenizer uses isValidVariableName() and isValidInt()
        String code = "_varName var123 12345";
        // Actually, "0abc" fails isValidInt, but it may pass as an IDENTIFIER if first char isn't digit?
        // We'll see how your tokenizer behaves.
        // Once it sees a letter after digits, it becomes an IDENTIFIER as well.

        File sourceFile = tempDir.resolve("identifiers.c").toFile();
        try (FileWriter fw = new FileWriter(sourceFile)) {
            fw.write(code);
        }

        List<Token> tokens = tokenizeFile(sourceFile);

        Category[] expectedCategories = {
                Category.IDENTIFIER, Category.IDENTIFIER, Category.INT_LITERAL, Category.EOF
        };

        assertEquals(expectedCategories.length, tokens.size());
        for (int i = 0; i < expectedCategories.length; i++) {
            assertEquals(expectedCategories[i], tokens.get(i).category,
                    "Token " + i + " mismatch in identifiers/integers test.");
        }
    }

    @Test
    void testCharLiterals(@TempDir Path tempDir) throws IOException {
        // Valid and invalid char literals
        String code = "'a' '\\n' '\\0' 'b' '' 'ab' '\\x'";
        File sourceFile = tempDir.resolve("chars.c").toFile();
        try (FileWriter fw = new FileWriter(sourceFile)) {
            fw.write(code);
        }

        List<Token> tokens = tokenizeFile(sourceFile);

        // Based on parseCharLiteral and validateCharLiteralContent:
        //  'a'    => CHAR_LITERAL, data="a"
        //  '\\n'  => CHAR_LITERAL, data="\n"
        //  '\\0'  => CHAR_LITERAL, data="\0"
        //  'b'    => CHAR_LITERAL, data="b"
        //  ''     => invalid => INVALID
        //  'ab'   => invalid => INVALID
        //  '\\x'  => invalid => INVALID (escape character 'x' not in ESCAPABLE_CHARS)
        // Then EOF
        Category[] expectedCategories = {
                Category.CHAR_LITERAL, Category.CHAR_LITERAL, Category.CHAR_LITERAL,
                Category.CHAR_LITERAL, Category.INVALID, Category.INVALID, Category.INVALID,
                Category.EOF
        };
        System.out.println("_____________");
        System.out.println(tokens.toString());
        assertEquals(expectedCategories.length, tokens.size());
        for (int i = 0; i < expectedCategories.length; i++) {
            assertEquals(expectedCategories[i], tokens.get(i).category,
                    "Token " + i + " mismatch in char literal test.");
        }

        // Optional: You could also check the .data fields for the valid ones.
        assertEquals("a", tokens.get(0).data);
        assertEquals("\\n", tokens.get(1).data);
        assertEquals("\\0", tokens.get(2).data);
        assertEquals("b", tokens.get(3).data);
    }

    @Test
    void testStringLiterals(@TempDir Path tempDir) throws IOException {
        // Various string literals, including escaped quotes and newlines
        String code = "\"hello\" \"\\n\" \"He said \\\"Hi\\\"\" \"\"";
        File sourceFile = tempDir.resolve("strings.c").toFile();
        try (FileWriter fw = new FileWriter(sourceFile)) {
            fw.write(code);
        }

        List<Token> tokens = tokenizeFile(sourceFile);

        // Expect: STRING_LITERAL for each, ignoring internal valid escapes
        // Then EOF
        Category[] expectedCategories = {
                Category.STRING_LITERAL,
                Category.STRING_LITERAL,
                Category.STRING_LITERAL,
                Category.STRING_LITERAL,
                Category.EOF
        };

        System.out.println("--------------");
        System.out.println(tokens.toString());
        assertEquals(expectedCategories.length, tokens.size());
        for (int i = 0; i < expectedCategories.length; i++) {
            assertEquals(expectedCategories[i], tokens.get(i).category,
                    "Token " + i + " mismatch in string literal test.");
        }

        // Optional checks on data
        assertEquals("hello", tokens.get(0).data);
        assertEquals("\\n", tokens.get(1).data);
        assertEquals("He said \\\"Hi\\\"", tokens.get(2).data);
        assertEquals("", tokens.get(3).data);
    }

    @Test
    void testComments(@TempDir Path tempDir) throws IOException {
        // Single-line and multi-line comments
        String code =
                "int x = 42; // this is a comment\n" +
                        "/* multi-line \n" +
                        "   comment */\n" +
                        "char c = 'a';";
        File sourceFile = tempDir.resolve("comments.c").toFile();
        try (FileWriter fw = new FileWriter(sourceFile)) {
            fw.write(code);
        }

        List<Token> tokens = tokenizeFile(sourceFile);

        // Comments should be ignored entirely.
        // Expect: int IDENTIFIER '=' INT_LITERAL ';' char IDENTIFIER '=' CHAR_LITERAL ';' EOF
        Category[] expectedCategories = {
                Category.INT,         // int
                Category.IDENTIFIER,  // x
                Category.ASSIGN,      // =
                Category.INT_LITERAL, // 42
                Category.SC,          // ;
                Category.CHAR,        // char
                Category.IDENTIFIER,  // c
                Category.ASSIGN,      // =
                Category.CHAR_LITERAL,// 'a'
                Category.SC,          // ;
                Category.EOF
        };

        assertEquals(expectedCategories.length, tokens.size(),
                "Mismatch in number of tokens after ignoring comments.");

        for (int i = 0; i < expectedCategories.length; i++) {
            assertEquals(expectedCategories[i], tokens.get(i).category,
                    "Token " + i + " mismatch in comment test.");
        }
    }

    @Test
    void testInvalidTokens(@TempDir Path tempDir) throws IOException {
        // Non-ASCII or unrecognized characters
        String code = "é @";
        File sourceFile = tempDir.resolve("invalid.c").toFile();
        try (FileWriter fw = new FileWriter(sourceFile)) {
            fw.write(code);
        }

        List<Token> tokens = tokenizeFile(sourceFile);

        // The tokenizer's "error" method is called if it sees an unrecognized character.
        // Each invalid token typically results in an INVALID token, then continues scanning.
        // We'll see how many INVALID tokens we get. We have 3 problematic characters: é, @, 𝐱(a bold x, not standard ASCII).
        // We expect them each to yield an INVALID, if they are recognized individually.
        // Then EOF
        Category[] expectedCategories = {
                Category.INVALID,
                Category.INVALID,
                Category.EOF
        };

        System.out.println("--------------");
        System.out.println(tokens.toString());
        assertEquals(expectedCategories.length, tokens.size(),
                "Mismatch in number of tokens for invalid tokens test.");
        for (int i = 0; i < expectedCategories.length; i++) {
            assertEquals(expectedCategories[i], tokens.get(i).category,
                    "Token " + i + " mismatch in invalid token test.");
        }
    }

    @Test
    void testPositions(@TempDir Path tempDir) throws IOException {
        // Quick check that line/column numbers are assigned
        // We'll just see if a line break changes the next token's line number
        String code = "int x\n  = 42;";
        File sourceFile = tempDir.resolve("posTest.c").toFile();
        try (FileWriter fw = new FileWriter(sourceFile)) {
            fw.write(code);
        }

        List<Token> tokens = tokenizeFile(sourceFile);
        // int -> line 1, col? (depends on your Scanner, typically line 1 col 1)
        // x   -> line 1, col? or line 1 col 5 depending on whitespace
        // =   -> line 2, col? ...
        // 42  -> line 2, col?
        // ;   -> line 2, col?
        // EOF -> line 2 or line 3, depending on implementation

        // We won't test exact columns here, just that line changes
        assertEquals(Category.INT, tokens.get(0).category);
        assertEquals(1, tokens.get(0).position.getLine());

        assertEquals(Category.IDENTIFIER, tokens.get(1).category);
        // same line or next line, depending on whitespace, but typically line=1
        // If you do want to check columns, you can do:
        // assertEquals(5, tokens.get(1).position.getColumn());

        assertEquals(Category.ASSIGN, tokens.get(2).category);
        // Should be line=2

        // etc...
        // (Adapt checks to your scanning rules.)

        // The main point is to show you can check line/col if you want more coverage:
        assertTrue(tokens.get(2).position.getLine() >= 2,
                "Expected '=' to be on line >= 2 due to newline.");
    }

    @Test
    void testRandomInvalidCharacters(@TempDir Path tempDir) throws IOException {
        // Another scenario: some bizarre characters that we expect to be invalid.
        String code = "√∞ xyz@foo ??";
        File sourceFile = tempDir.resolve("invalidCharsTest.c").toFile();
        try (FileWriter fw = new FileWriter(sourceFile)) {
            fw.write(code);
        }

        List<Token> tokens = tokenizeFile(sourceFile);

        // Depending on how your scanner works, you might get multiple INVALID tokens
        // or a single combined INVALID. We'll assume each unrecognized chunk yields a single INVALID.
        // For example: "√∞" => INVALID, "xyz" => IDENTIFIER, "@" => INVALID, "foo" => IDENTIFIER, "??" => INVALID, then EOF
        //
        // Let's just check that we get at least one INVALID for the weird parts:
        long invalidCount = tokens.stream()
                .filter(t -> t.category == Category.INVALID)
                .count();

        assertTrue(invalidCount >= 3,
                "Expected at least 3 INVALID tokens from the code '√∞ xyz@foo ??'. " +
                        "But got: " + tokens);
    }
    @Test
    void testUnclosedStringLiteral(@TempDir Path tempDir) throws IOException {
        String code = "\"Hello World";
        File sourceFile = tempDir.resolve("unclosedString.c").toFile();
        try (FileWriter fw = new FileWriter(sourceFile)) {
            fw.write(code);
        }

        List<Token> tokens = tokenizeFile(sourceFile);

        // Depending on your lexer design, you might expect a single INVALID or partial string literal token.
        // For example:
        // - tokens[0] = INVALID   (with some data = "\"Hello World")
        // - tokens[1] = EOF

        System.out.println("--------------");
        System.out.println(tokens.toString());
        assertEquals(Category.INVALID, tokens.get(0).category);
        assertEquals(Category.EOF, tokens.get(1).category);
        assertEquals(2, tokens.size());
    }

    @Test
    void testUnterminatedBlockComment(@TempDir Path tempDir) throws IOException {
        String code = "int x; /* comment never ends";
        File sourceFile = tempDir.resolve("unterminatedComment.c").toFile();
        try (FileWriter fw = new FileWriter(sourceFile)) {
            fw.write(code);
        }

        List<Token> tokens = tokenizeFile(sourceFile);

        // Depending on your lexer's handling, you might get:
        // int -> Category.INT
        // x   -> Category.IDENTIFIER
        // ;   -> Category.SC
        // Then an INVALID token for the unterminated comment or perhaps you reach EOF with an error message.
        // For example:
        // tokens[0] = INT, tokens[1] = IDENTIFIER, tokens[2] = SC, tokens[3] = INVALID, tokens[4] = EOF

        assertEquals(Category.INT, tokens.get(0).category);
        assertEquals(Category.IDENTIFIER, tokens.get(1).category);
        assertEquals(Category.SC, tokens.get(2).category);
        assertEquals(Category.INVALID, tokens.get(3).category);
        assertEquals(Category.EOF, tokens.get(4).category);
        assertEquals(5, tokens.size());
    }

    @Test
    void testVeryLargeIntegerLiteral(@TempDir Path tempDir) throws IOException {
        // Something bigger than 32-bit integer range
        String code = "9999999999999999";
        File sourceFile = tempDir.resolve("bigInt.c").toFile();
        try (FileWriter fw = new FileWriter(sourceFile)) {
            fw.write(code);
        }

        List<Token> tokens = tokenizeFile(sourceFile);

        // If your spec says all digit sequences are INT_LITERAL (and you handle overflow later),
        // then you'd expect one INT_LITERAL + EOF.
        // Otherwise, you might produce INVALID if it’s out of range.

        assertEquals(Category.INT_LITERAL, tokens.get(0).category);
        assertEquals("9999999999999999", tokens.get(0).data);
        assertEquals(Category.EOF, tokens.get(1).category);
        assertEquals(2, tokens.size());
    }

    @Test
    void testMultipleAdjacentInvalidCharacters(@TempDir Path tempDir) throws IOException {
        // The characters '¥' and '₹' and '±' might be out of range for ASCII-based tokens.
        String code = "¥₹± validIdentifier";
        File sourceFile = tempDir.resolve("adjInvalid.c").toFile();
        try (FileWriter fw = new FileWriter(sourceFile)) {
            fw.write(code);
        }

        List<Token> tokens = tokenizeFile(sourceFile);

        // Depending on implementation:
        // - Possibly one INVALID token for each symbol: INVALID, INVALID, INVALID, IDENTIFIER, EOF
        // or you group them: INVALID (for '¥₹±'), IDENTIFIER, EOF

        // We just expect there's at least one INVALID followed by a valid IDENTIFIER.
        int invalidCount = (int) tokens.stream()
                .filter(t -> t.category == Category.INVALID)
                .count();
        assertTrue(invalidCount >= 1);
        assertEquals(Category.IDENTIFIER, tokens.get(invalidCount).category);
        assertEquals(Category.EOF, tokens.get(invalidCount + 1).category);
    }

    @Test
    void testCombinedSnippet(@TempDir Path tempDir) throws IOException {
        String code =
                "#include <stdio.h>\n"
                        + "int main() {\n"
                        + "    // single-line comment\n"
                        + "    /* multi-line\n"
                        + "       comment */\n"
                        + "    char *str = \"Hello \\\"World\\\"\";\n"
                        + "    int x = 0xFF;\n"
                        + "    if (x == 255) {\n"
                        + "        return 0;\n"
                        + "    } else {\n"
                        + "        return -1;\n"
                        + "    }\n"
                        + "}\n";

        File sourceFile = tempDir.resolve("combinedSnippet.c").toFile();
        try (FileWriter fw = new FileWriter(sourceFile)) {
            fw.write(code);
        }

        List<Token> tokens = tokenizeFile(sourceFile);

        // Then you can systematically verify all tokens.
        // Example checks:
        assertEquals(Category.INCLUDE, tokens.get(0).category); // #include
        assertEquals("<stdio.h>",     tokens.get(1).data);      // Possibly how you handle #include <...>
        // ...
        // Eventually you'll see INT, IDENTIFIER (main), LPAR, RPAR, LBRA, ...
        // ...
        // Make sure comments are skipped entirely.
        // ...
        // And so on, up to EOF.

        // Instead of matching each token 1:1 (which can be quite long),
        // you might just check partial sequences or spot-check certain tricky parts.
        // e.g. verify that "0xFF" is recognized as an INT_LITERAL with "0xFF",
        // that the string literal is recognized, etc.
    }
}