package lexer;

import util.CompilerPass;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.function.Predicate;

/**
 * Tokeniser class that processes character streams from a Scanner
 * and produces tokens.
 */
public class Tokeniser extends CompilerPass {

    private final Scanner scanner;

    public Tokeniser(Scanner scanner) {
        this.scanner = scanner;
    }

    private void error(char c, int line, int col) {
        String msg = "Lexing error: unrecognised character (" + c + ") at " + line + ":" + col;
        System.out.println(msg);
        incError();
    }

    /**
     * Check whether the raw string inside single quotes can form a valid
     * character literal (including escapes like '\n', '\t', etc.).
     * Returns the valid unescaped character if valid, or null otherwise.
     */
    private String validateCharLiteralContent(String raw) {
        if (raw.isEmpty()) {
            return null;
        }
        // If it's an escaped character
        if (raw.charAt(0) == '\\') {
            // Must have length 2, e.g. "\n", "\t", etc.
            if (raw.length() == 2 && Token.ESCAPABLE_CHARS.contains(raw.charAt(1))) {
                // return only the second character as the literal
                return raw;
            }
            return null;
        }

        // If it's a single normal character
        if (raw.length() == 1) {
            return raw;
        }

        // Otherwise invalid
        return null;
    }

    /**
     * Reads characters from the scanner until the matching closing character
     * is found, handling escaped characters (e.g. '\"', '\\').
     * If the matching character is not found, throws an Exception.
     *
     * @param c the delimiting character to look for (e.g. '\'' or '\"')
     * @return the raw string found between the matching delimiters (without the delimiters).
     * @throws Exception if the matching character is not found before EOF.
     */
    private String getAllBetween(Character c, Predicate<Character> isAllowed) throws Exception {
        StringBuilder content = new StringBuilder();
        boolean escaped = false;
        boolean found = false;
        while (scanner.hasNext()) {
            char next = scanner.next();
            if (escaped) {
                escaped = false;
                content.append(next);
                continue;
            }
            if (next == c) {
                // We found the closing delimiter
                found = true;
                break;
            }
            if (next == '\\') {
                escaped = true;
            } else {
                escaped = false;
            }
            content.append(next);
        }
        if (!found) {
            throw new Exception("Matching character not found");
        }
        escaped = false;
        for (char next : content.toString().toCharArray()) {
            if (escaped) {
                if (!Token.ESCAPABLE_CHARS.contains(next))
                    throw new Exception("Not a valid escape character");
                // The previous character was '\', so this char should be taken literally
                escaped = false;
            } else if (next == '\\') {
                // Found an escape, so ignore next character's special meaning
                escaped = true;
            }  else if (!(Character.isLetter(next) || Character.isDigit(next) || Character.isWhitespace(next) || isAllowed.test(next))) {
                throw new Exception("Invalid character: invalid token");
            }
        }
        return content.toString();
    }

    /**
     * Parses a character literal. Expects that the initial single quote (')
     * has already been consumed.
     */
    private Token parseCharLiteral(int startLine, int startCol) {
        String content;
        try {
            // Reads everything until we find a matching single quote
            content = getAllBetween('\'', (c) -> Token.SPECIAL_CHAR_WITHOUT_SINGLE_QUOTE.contains(c));
        } catch (Exception e) {
            // If we cannot find the closing quote, it's an error
            error('\'', startLine, startCol);
            return new Token(Token.Category.INVALID, startLine, startCol);
        }

        // Validate whether it forms a valid char literal
        String validated = validateCharLiteralContent(content);
        if (validated == null) {
            error('\'', startLine, startCol);
            return new Token(Token.Category.INVALID, startLine, startCol);
        }

        // If valid, return CHAR_LITERAL token with the unescaped content
        return new Token(Token.Category.CHAR_LITERAL, validated, startLine, startCol);
    }

    /**
     * Parses a string literal. Expects that the initial double quote (")
     * has already been consumed.
     */
    private Token parseStringLiteral(int startLine, int startCol) {
        String content;
        try {
            // Reads everything until we find a matching double quote
            content = getAllBetween('\"', (c) -> Token.SPECIAL_CHAR_WITHOUT_DOUBLE_QUOTE.contains(c));
        } catch (Exception e) {
            // If we cannot find the closing quote, it's an error
            error('\"', startLine, startCol);
            return new Token(Token.Category.INVALID, startLine, startCol);
        }

        // You may optionally process unescaping here, if you want
        // to interpret things like \" as a literal quote, etc.
        //
        // For example, a simple unescape could be done using
        // a separate method that replaces escape sequences with
        // their actual characters. Or you can just keep the raw form.

        return new Token(Token.Category.STRING_LITERAL, content, startLine, startCol);
    }

    /**
     * Attempts to parse an integer literal if the first character is a digit;
     * otherwise, parse an identifier.
     * @param firstRead the already consumed character(s) that got us here.
     */
    private Token parseIdentifierOrInteger(String firstRead, int startLine, int startCol) {
        StringBuilder lexeme = new StringBuilder(firstRead);

        // Keep reading alphanumeric/underscore as part of the token
        while (scanner.hasNext()) {
            char peeked = scanner.peek();
            if (!Token.isValidVariableNameChar(peeked)) {
                break;
            }
            // consume it
            lexeme.append(scanner.next());
        }

        // Now decide if it's an integer or identifier
        // A naive check: if the very first character is digit => parse integer
        // (be aware of edge cases, e.g., "123abc" — do you want to treat that as error?)
        String result = lexeme.toString();
        if (Token.isValidVariableName(result)) {
            return new Token(Token.Category.IDENTIFIER, result, startLine, startCol);
        }
        else if (Token.isValidInt(result)) {
            return new Token(Token.Category.INT_LITERAL, result, startLine, startCol);
        }
        error(result.charAt(0), startLine, startCol);
        return new Token(Token.Category.INVALID, startLine, startCol);
    }
    /**
     * Retrieves the next token from the source.
     * <p>
     * The main dispatches:
     * 1) Single quote => parseCharLiteral
     * 2) Double quote => parseStringLiteral
     * 3) Symbols (via Trie)
     * 4) Identifiers or Integers
     */
    public Token nextToken() {

        // If no more characters are available, return EOF
        if (!scanner.hasNext()) {
            return new Token(Token.Category.EOF, scanner.getLine(), scanner.getColumn());
        }

        // Read the next character
        char c = scanner.next();

        // Skip any whitespace
        if (Character.isWhitespace(c)) {
            return nextToken();
        }

        // Remember where this token started (for error reporting)
        int startLine = scanner.getLine();
        int startCol = scanner.getColumn();

        // 0) Check comment
        if (c == '/') {
            if (!scanner.hasNext())
                return nextToken();
            char next = scanner.peek();
            if (next == '/') { // single line comment
                // consume the rest of the line
                while (scanner.hasNext()) {
                    char peeked = scanner.next();
                    if (peeked == '\n') {
                        break;
                    }
                }
                return nextToken();
            } else if (next == '*') {
                // consume the rest of the comment
                boolean ends = false;
                while (scanner.hasNext()) {
                    char peeked = scanner.next();
                    if (peeked == '*') {
                        if (scanner.hasNext()) {
                            char peeked2 = scanner.next();
                            if (peeked2 == '/') {
                                ends = true;
                                break;
                            }
                        }
                    }
                }
                if (!ends) {
                    System.out.println("Doesn't end");
                    return new Token(Token.Category.INVALID, startLine, startCol);
                }
                return nextToken();
            }
        }

        // 1) Check for character literal: starts with single quote (')
        if (c == '\'') {
            return parseCharLiteral(startLine, startCol);
        }

        // 2) Check for string literal: starts with double quote (")
        if (c == '\"') {
            return parseStringLiteral(startLine, startCol);
        }

        // 3) Attempt to match known symbols using a Trie
        TrieNode trieCursor = Token.createRootSymbols();

        // We'll store each character that continues the path in the trie
        StringBuilder symbolBuilder = new StringBuilder();
        symbolBuilder.append(c);

        TrieNode nextCursor = trieCursor.traverse(c);
        if (nextCursor == null) {
            // c alone doesn't match even the first step in the trie
            // => treat c as the beginning of an identifier/number
            return parseIdentifierOrInteger(String.valueOf(c), startLine, startCol);
        }

        trieCursor = nextCursor;

        // While there's a next char that continues in the trie, consume it
        while (scanner.hasNext()) {
            char peeked = scanner.peek(); // Look ahead without consuming
            // Stop if whitespace or something that can't continue the symbol
            if (!trieCursor.canContinue(peeked)) {
                break;
            }
            // Actually consume the peeked character
            scanner.next();
            symbolBuilder.append(peeked);
            trieCursor = trieCursor.traverse(peeked);
        }

        // After consuming as much as possible, check if we ended on a valid symbol
        // edge case: if a symbol is a prefix of an identifier
        char nextChar = scanner.hasNext() ? scanner.peek() : '\0';
        boolean isIdentifier = Token.isValidVariableName(symbolBuilder.toString() + nextChar);

        if (trieCursor != null && trieCursor.isEnd() && !isIdentifier) {
            // Return a token for the matched symbol
            return new Token(trieCursor.getTokenCategory(), startLine, startCol);
        } else {
            // We have partially matched something but it didn't end at a valid node
            // The simplest approach is to treat the entire string as either:
            // - if it starts with a digit => parse integer
            // - else parse identifier
            // OR revert the last character(s). Here, we’ll do the simpler approach.

            return parseIdentifierOrInteger(symbolBuilder.toString(), startLine, startCol);
        }
    }

    public static void main(String[] args) {
        try {
            // 1) Create a temporary or local file in the current directory
            File tempSource = new File("TestSourceFile.txt");

            // 2) Write some test code into the file
            try (PrintWriter pw = new PrintWriter(new FileWriter(tempSource))) {
                pw.println("#include smthg");
                pw.println("#include smthg // ignore this");
                pw.println("#include smthg /* ignore");
                pw.println("*ignore/ this */");
                pw.println("char c = 'a';");
                pw.println("String s = \"Hello \\n World!\";");
                pw.println("int x = 123;");
                pw.println("char c = '\\n'");
                pw.println("é;"); // this is allowed?
//                pw.println("int y = 456abc;"); // This will likely cause an INVALID token
//                pw.println("'\\n'"); // Valid escaped char literal
//                pw.println("'\\x'");  // Invalid escaped char literal
            }

            // 3) Construct your Scanner with this newly created file
            Scanner scanner = new Scanner(tempSource);
            // 4) Create the Tokeniser with our Scanner
            Tokeniser tokeniser = new Tokeniser(scanner);

            // Continuously fetch tokens and print them until EOF
            while (true) {
                Token token = tokeniser.nextToken();

                if (token.category == Token.Category.EOF) {
                    break;
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}