package lexer;

import util.Position;

import javax.swing.text.StyleConstants;
import java.util.*;

/**
 * @author cdubach
 */
public class Token {

    /**
     * SpecialCharWithoutSingleQuote = One of the following 30 characters:
     * ` ~ @ ! $ # ^ * % & ( ) [ ] { } < > + = _ - | / ; : , . ? "
     */
    public static final Set<Character> SPECIAL_CHAR_WITHOUT_SINGLE_QUOTE;

    /**
     * SpecialCharWithoutDoubleQuote = One of the following 30 characters:
     * ` ~ @ ! $ # ^ * % & ( ) [ ] { } < > + = _ - | / ; : , . ? '
     */
    public static final Set<Character> SPECIAL_CHAR_WITHOUT_DOUBLE_QUOTE;

    /**
     * EscapedChar = '\a' | '\b' | '\n' | '\r' | '\t' | '\\' | '\'' | '\"' | '\0'
     *
     * In Java, not all of these have native \-escape sequences (e.g. \a).
     * We include them by ASCII code:
     *  \a (bell)              -> (char) 7
     *  \b (backspace)         -> (char) 8
     *  \t (tab)               -> (char) 9   (or '\t')
     *  \n (newline)           -> (char) 10  (or '\n')
     *  \r (carriage return)   -> (char) 13  (or '\r')
     *  \0 (null)              -> (char) 0
     *  \' (single quote)      -> (char) 39  (or '\'')
     *  \" (double quote)      -> (char) 34  (or '\"')
     *  \\ (backslash)         -> (char) 92  (or '\\')
     */
    public static final Set<Character> ESCAPABLE_CHARS;

    static {
        // Create a base set of all special characters
        Set<Character> allSpecial = new HashSet<>();
        Collections.addAll(allSpecial,
                '`', '~', '@', '!', '$', '#', '^', '*', '%', '&', '(', ')',
                '[', ']', '{', '}', '<', '>', '+', '=', '_', '-', '|', '/',
                ';', ':', ',', '.', '?', '\'', '\"'
        );

        // Derive SPECIAL_CHAR_WITHOUT_SINGLE_QUOTE by copying and removing single quote
        Set<Character> withoutSingleQuote = new HashSet<>(allSpecial);
        withoutSingleQuote.remove('\'');  // Remove single quote
        SPECIAL_CHAR_WITHOUT_SINGLE_QUOTE = Collections.unmodifiableSet(withoutSingleQuote);

        // Derive SPECIAL_CHAR_WITHOUT_DOUBLE_QUOTE by copying and removing double quote
        Set<Character> withoutDoubleQuote = new HashSet<>(allSpecial);
        withoutDoubleQuote.remove('\"');  // Remove double quote
        SPECIAL_CHAR_WITHOUT_DOUBLE_QUOTE = Collections.unmodifiableSet(withoutDoubleQuote);

        // ---------- ESCAPED_CHARS ----------
        Set<Character> escapable = new HashSet<>();
        Collections.addAll(escapable,
                'a', 'b', 't', 'n', 'r', '0', '\'', '\"', '\\'
        );
        ESCAPABLE_CHARS = Collections.unmodifiableSet(escapable);
    }
    public enum Category {

        // ' is used to enclose the input that needs to be recognized

        // LowerCaseAlpha = 'a'|...|'z'
        // UpperCaseAlpha = 'A'|...|'Z'
        // Digit          = '0' | '1' | ... | '9'
        IDENTIFIER, // (LowerCaseAlpha | UpperCaseAlpha | '_') (Digit | LowerCaseAlpha | UpperCaseAlpha | '_')*

        ASSIGN, // '='

        // delimiters
        LBRA,  // '{' // left brace
        RBRA,  // '}' // right brace
        LPAR,  // '(' // left parenthesis
        RPAR,  // ')' // right parenthesis
        LSBR,  // '[' // left square brace
        RSBR,  // ']' // left square brace
        SC,    // ';' // semicolon
        COMMA, // ','

        // types
        INT,  // 'int'
        VOID, // 'void'
        CHAR, // 'char'

        // keywords
        IF,     // 'if'
        ELSE,   // 'else'
        WHILE,  // 'while'
        RETURN, // 'return'
        STRUCT, // 'struct'
        SIZEOF, // 'sizeof'
        CONTINUE, // 'continue'
        BREAK, // 'break'
        NEW, // 'new'
        CLASS, // 'class'
        EXTENDS,

        // include
        INCLUDE, // '#include'

        // SpecialCharWithoutSingleQuote = One of the following 30 characters: ` ~ @ ! $ # ^ * % & ( ) [ ] { } < > + = _ - | / ; : , . ? "
        // SpecialCharWithoutDoubleQuote = One of the following 30 characters: ` ~ @ ! $ # ^ * % & ( ) [ ] { } < > + = _ - | / ; : , . ? '
        // WhiteSpace                    = ' '
        // EscapedChar                   = '\a' | '\b' | '\n' | '\r' | '\t' | '\\' | '\'' | '\"' | '\0'
        // literals
        CHAR_LITERAL,   // ''' (LowerCaseAlpha | UpperCaseAlpha | Digit |  SpecialCharWithoutSingleQuote  | WhiteSpace | EscapedChar) '''  any character (except single quote) enclosed within  a pair of single quotes
        STRING_LITERAL, // '"' (LowerCaseAlpha | UpperCaseAlpha | Digit |  SpecialCharWithoutDoubleQuote  | WhiteSpace | EscapedChar)* '"'  any sequence of characters (except double quote) enclosed within two double quotes
        INT_LITERAL,    // Digit+

        // logical operators
        LOGAND, // '&&'
        LOGOR,  // '||'

        // comparisons
        EQ, // '=='
        NE, // '!='
        LT, // '<'
        GT, // '>'
        LE, // '<='
        GE, // '>='

        // operators
        PLUS,    // '+'
        MINUS,   // '-'
        ASTERISK, // '*'  // can be used for multiplication or pointers
        DIV,     // '/'
        REM,     // '%'
        AND,     // '&'

        // struct member access
        DOT, // '.'

        // special tokens
        EOF,    // signal end of file
        INVALID // in case we cannot recognise a character as part of a valid token
    }

    public static TrieNode createRootSymbols() {
        TrieNode root = new TrieNode();

        // Single-character operators/delimiters
        root.addPath("=", Token.Category.ASSIGN);
        root.addPath("{", Token.Category.LBRA);
        root.addPath("}", Token.Category.RBRA);
        root.addPath("(", Token.Category.LPAR);
        root.addPath(")", Token.Category.RPAR);
        root.addPath("[", Token.Category.LSBR);
        root.addPath("]", Token.Category.RSBR);
        root.addPath(";", Token.Category.SC);
        root.addPath(",", Token.Category.COMMA);
        root.addPath(".", Token.Category.DOT);
        root.addPath("+", Token.Category.PLUS);
        root.addPath("-", Token.Category.MINUS);
        root.addPath("*", Token.Category.ASTERISK);
        root.addPath("/", Token.Category.DIV);
        root.addPath("%", Token.Category.REM);
        root.addPath("&", Token.Category.AND);
        root.addPath("<", Token.Category.LT);
        root.addPath(">", Token.Category.GT);

        // Multi-character operators
        root.addPath("==", Token.Category.EQ);
        root.addPath("!=", Token.Category.NE);
        root.addPath("<=", Token.Category.LE);
        root.addPath(">=", Token.Category.GE);
        root.addPath("&&", Token.Category.LOGAND);
        root.addPath("||", Token.Category.LOGOR);

        // Keywords
        root.addPath("if", Token.Category.IF);
        root.addPath("else", Token.Category.ELSE);
        root.addPath("while", Token.Category.WHILE);
        root.addPath("return", Token.Category.RETURN);
        root.addPath("struct", Token.Category.STRUCT);
        root.addPath("sizeof", Token.Category.SIZEOF);
        root.addPath("continue", Token.Category.CONTINUE);
        root.addPath("break", Token.Category.BREAK);
        root.addPath("#include", Token.Category.INCLUDE);
        root.addPath("int", Token.Category.INT);
        root.addPath("void", Token.Category.VOID);
        root.addPath("char", Token.Category.CHAR);
        root.addPath("new", Token.Category.NEW);
        root.addPath("class", Token.Category.CLASS);
        root.addPath("extends", Token.Category.EXTENDS); // Added for class extension

        return root;
    }

    public final Category category;
    public final String data;
    public final Position position;

    public Token(Category category, int lineNum, int colNum) {
        this(category, "", lineNum, colNum);
    }


    // Custom function to check if a character is a digit ('0' to '9')
    private static boolean isDigit(char ch) {
        return ch >= '0' && ch <= '9';
    }
    public static boolean isStandardAlphanumeric(char ch) {
        return isDigit(ch) || (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z');
    }

    // ONLY for a single char, beginning or not doesn't matter for this func
    public static boolean isValidVariableNameChar(char c) {
        if (Token.isStandardAlphanumeric(c) || c == '_') {
            return true;
        }
        return false;
    }

    public static boolean isValidVariableName(String name) {
        if (isDigit(name.charAt(0))) return false;
        for (int i = 0; i < name.length(); i++) {
            if (!isValidVariableNameChar(name.charAt(i))) return false;
        }
        return true;
    }

    public static boolean isValidInt(String number) {
        for (int i = 0; i < number.length(); i++) {
            if (!isDigit(number.charAt(i))) return false;
        }
        return true;
    }

    public Token (Category category, String data, int lineNum, int colNum) {
        assert (category != null);
        this.category = category;
        this.data = data;
        this.position = new Position(lineNum, colNum);
    }



    @Override
    public String toString() {
        if (data.equals(""))
            return category.toString();
        else
            return category.toString()+"("+data+")";
    }

}


