package parser;


import lexer.Scanner;
import lexer.Token;
import lexer.Token.Category;
import lexer.Tokeniser;
import util.CompilerPass;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.LinkedList;
import java.util.Queue;


/**
 * @author cdubach
 */
public class Parser  extends CompilerPass {

    private Token token;

    private final Queue<Token> buffer = new LinkedList<>();

    private final Tokeniser tokeniser;



    public Parser(Tokeniser tokeniser) {
        this.tokeniser = tokeniser;
    }

    public void parse() {
        // get the first token
        nextToken();
        parseProgram();
    }



    //private int error = 0;
    private Token lastErrorToken;

    private void error(Category... expected) {

        if (lastErrorToken == token) {
            // skip this error, same token causing trouble
            return;
        }

        StringBuilder sb = new StringBuilder();
        String sep = "";
        for (Category e : expected) {
            sb.append(sep);
            sb.append(e);
            sep = "|";
        }
        String msg = "Parsing error: expected ("+sb+") found ("+token+") at "+token.position;
        System.out.println(msg);

        incError();
        lastErrorToken = token;
    }

    /*
     * Look ahead the i^th element from the stream of token.
     * i should be >= 1
     */
    private Token lookAhead(int i) {
        // ensures the buffer has the element we want to look ahead
        while (buffer.size() < i)
            buffer.add(tokeniser.nextToken());

        int cnt=1;
        for (Token t : buffer) {
            if (cnt == i)
                return t;
            cnt++;
        }

        assert false; // should never reach this
        return tokeniser.nextToken();
    }


    /*
     * Consumes the next token from the tokeniser or the buffer if not empty.
     */
    private void nextToken() {
        if (!buffer.isEmpty())
            token = buffer.remove();
        else
            token = tokeniser.nextToken();
    }

    /*
     * If the current token is equals to the expected one, then skip it, otherwise report an error.
     */
    private Token expect(Category... expected) {
        for (Category e : expected) {
            if (e == token.category) {
                Token ret = token;
                nextToken();
                return ret;
            }
        }
        error(expected);
        return token;
    }

    /*
    * Returns true if the current token is equals to any of the expected ones.
    */
    private boolean accept(Category... expected) {
        for (Category e : expected) {
            if (e == token.category)
                return true;
        }
        return false;
    }
    /**
     * program ::= (include)* (structdecl | vardec_funcdec_or_funcdef)* EOF
     */
    private void parseProgram() {
        parseIncludes();

        // (structdecl | vardec_funcdec_or_funcdef)*
        while (accept(Category.STRUCT, Category.INT, Category.CHAR, Category.VOID)) {
            if (token.category == Category.STRUCT
                    && lookAhead(1).category == Category.IDENTIFIER
                    && lookAhead(2).category == Category.LBRA) {
                // structdecl
                parseStructDecl();
            } else {
                // vardec_funcdec_or_funcdef
                parseType();               // type
                expect(Category.IDENTIFIER); // the variable/function name

                // If next token is '(', it's a function decl or def
                if (accept(Category.LPAR)) {
                    parseFuncDefOrDecl();  // "(" params ")" (block | ";")
                } else {
                    parseVarDecl();        // matrix_brackets ";"
                }
            }
        }

        expect(Category.EOF);
    }

    /**
     * include ::= "#include" STRING_LITERAL
     */
    private void parseIncludes() {
        // Just skip them recursively
        while (accept(Category.INCLUDE)) {
            nextToken(); // consume '#include'
            expect(Category.STRING_LITERAL);
        }
    }

    // ------------------------------------------------------------------------
    // STRUCT DECLARATIONS
    // ------------------------------------------------------------------------

    /**
     * structdecl ::= structtype "{" (vardecl)+ "}" ";"
     * structtype ::= "struct" IDENT
     */
    private void parseStructDecl() {
        // Already verified in parseProgram that next token is 'struct'
        expect(Category.STRUCT);
        expect(Category.IDENTIFIER);
        expect(Category.LBRA);

        // (vardecl)+  --> at least one
        // But each field in struct: "type IDENT matrix_brackets ';'"
        // So we parse repeated sequences of (type IDENT varDecl) until we see '}'
        do {
            if (accept(Category.RBRA)) break;  // stop if "}"
            parseType();
            expect(Category.IDENTIFIER);
            parseVarDecl(); // matrix brackets + ';'
        } while (!accept(Category.RBRA, Category.EOF));

        expect(Category.RBRA);
        expect(Category.SC);
    }

    // ------------------------------------------------------------------------
    // TYPE & DECLARATIONS
    // ------------------------------------------------------------------------

    /**
     * type ::= ("int" | "char" | "void" | structtype) ("*")*
     */
    private void parseType() {
        // base type
        if (accept(Category.INT, Category.CHAR, Category.VOID)) {
            nextToken();
        } else if (accept(Category.STRUCT)) {
            nextToken(); // 'struct'
            expect(Category.IDENTIFIER);
        } else {
            error(Category.INT, Category.CHAR, Category.VOID, Category.STRUCT);
            // Attempt to recover:
            nextToken();
        }
        // parse zero or more '*' pointers
        while (accept(Category.ASTERISK)) {
            nextToken();
        }
    }

    /**
     * matrix_brackets ::= ("[" INT_LITERAL "]")*
     */
    private void parseMatrixSqrBrckts() {
        while (accept(Category.LSBR)) {
            nextToken();
            expect(Category.INT_LITERAL);
            expect(Category.RSBR);
        }
    }

    /**
     * vardecl ::= matrix_brackets ";"
     * i.e., we assume 'type' and 'IDENTIFIER' are already consumed.
     */
    private void parseVarDecl() {
        parseMatrixSqrBrckts();
        expect(Category.SC);
    }

    // ------------------------------------------------------------------------
    // FUNCTION DECLARATION OR DEFINITION
    // ------------------------------------------------------------------------

    /**
     * func_def_or_decl ::= "(" params ")" (block | ";")
     */
    private void parseFuncDefOrDecl() {
        expect(Category.LPAR);
        parseParams();
        expect(Category.RPAR);
        // If we see ';' => function declaration, else we parse a block => definition
        if (accept(Category.SC)) {
            // function declaration
            nextToken();
        } else if (accept(Category.LBRA)) {
            // function definition
            parseBlock();
        } else {
            error(Category.SC, Category.LBRA);
        }
    }

    /**
     * params ::= [ type IDENT matrix_brackets ("," type IDENT matrix_brackets)* ]
     */
    private void parseParams() {
        // Possibly empty parameter list
        if (!accept(Category.INT, Category.CHAR, Category.VOID, Category.STRUCT)) {
            return; // empty
        }
        // parse first param
        parseType();
        expect(Category.IDENTIFIER);
        parseMatrixSqrBrckts();
        // parse additional params ("," type IDENT matrix_brackets)*
        while (accept(Category.COMMA)) {
            nextToken(); // consume ','
            parseType();
            expect(Category.IDENTIFIER);
            parseMatrixSqrBrckts();
        }
    }

    // ------------------------------------------------------------------------
    // BLOCKS & STATEMENTS
    // ------------------------------------------------------------------------

    /**
     * block ::= "{" (type IDENT vardecl)* (stmt)* "}"
     */
    private void parseBlock() {
        expect(Category.LBRA);

        // zero or more local var declarations: (type IDENT varDecl)*
        while (accept(Category.INT, Category.CHAR, Category.VOID, Category.STRUCT)) {
            // Look ahead to see if next is IDENT => yes => must be varDecl
            parseType();
            expect(Category.IDENTIFIER);
            parseVarDecl();
        }

        // then zero or more statements
        while (!accept(Category.RBRA, Category.EOF)) {
            parseStmt();
        }

        expect(Category.RBRA);
    }

    /**
     * stmt ::=
     *    block
     *  | "while" "(" exp ")" stmt
     *  | "if" "(" exp ")" stmt ["else" stmt]
     *  | "return" [exp] ";"
     *  | exp ";"
     *  | "continue" ";"
     *  | "break" ";"
     */
    private void parseStmt() {
        if (accept(Category.LBRA)) {
            // block
            parseBlock();

        } else if (accept(Category.WHILE)) {
            nextToken(); // consume 'while'
            expect(Category.LPAR);
            parseExp();
            expect(Category.RPAR);
            parseStmt();

        } else if (accept(Category.IF)) {
            nextToken(); // 'if'
            expect(Category.LPAR);
            parseExp();
            expect(Category.RPAR);
            parseStmt();
            if (accept(Category.ELSE)) {
                nextToken();
                parseStmt();
            }

        } else if (accept(Category.RETURN)) {
            nextToken(); // 'return'
            if (!accept(Category.SC)) {
                parseExp();
            }
            expect(Category.SC);

        } else if (accept(Category.CONTINUE)) {
            nextToken();
            expect(Category.SC);

        } else if (accept(Category.BREAK)) {
            nextToken();
            expect(Category.SC);

        } else {
            // expression statement
            parseExp();
            expect(Category.SC);
        }
    }

    // ------------------------------------------------------------------------
    // EXPRESSIONS
    // ------------------------------------------------------------------------
    //
    // According to the left-parseable grammar:
    //
    // exp ::= "(" ( exp ")" | type ")" exp ) exp'
    //       | INT_LITERAL exp'
    //       | func_call_or_var exp'
    //       | ("-" | "+") exp exp'
    //       | CHAR_LITERAL exp'
    //       | STRING_LITERAL exp'
    //       | valueat exp'
    //       | addressof exp'
    //       | sizeof exp'
    //
    // exp' ::= "=" exp exp'
    //        | "[" exp "]" exp'
    //        | "." IDENT exp'
    //        | (">" | "<" | ">=" | "<=" | "!=" | "==" | "+" | "-" | "/" | "*" | "%" | "||" | "&&") exp exp'
    //        | ε
    //
    // func_call_or_var ::= IDENT ["(" [ exp ("," exp)* ] ")"]
    // valueat          ::= "*" exp
    // addressof        ::= "&" exp
    // sizeof           ::= "sizeof" "(" type ")"
    //

    private void parseExp() {
        if (accept(Category.LPAR)) {
            // Could be parenthesized exp => ( exp ) exp'
            // or a cast => ( type ) exp exp'
            nextToken(); // consume '('
            // Heuristic: if next token is a type (int/char/void/struct) => parse cast
            if (accept(Category.INT, Category.CHAR, Category.VOID, Category.STRUCT)) {
                // cast: "(" type ")" exp
                parseType();
                expect(Category.RPAR);
                parseExp();
                parseExpPrime();
            } else {
                // parenthesized expression: "(" exp ")"
                parseExp();
                expect(Category.RPAR);
                parseExpPrime();
            }
        }
        else if (accept(Category.INT_LITERAL)) {
            nextToken();
            parseExpPrime();
        }
        else if (accept(Category.IDENTIFIER)) {
            parseFuncCallOrVar();
            parseExpPrime();
        }
        else if (accept(Category.MINUS, Category.PLUS)) {
            // unary +/- then an expression
            nextToken();
            parseExp();
            parseExpPrime();
        }
        else if (accept(Category.CHAR_LITERAL)) {
            nextToken();
            parseExpPrime();
        }
        else if (accept(Category.STRING_LITERAL)) {
            nextToken();
            parseExpPrime();
        }
        else if (accept(Category.ASTERISK)) { // valueAt
            nextToken();
            parseExp();
            parseExpPrime();
        }
        else if (accept(Category.AND)) { // addressOf
            nextToken();
            parseExp();
            parseExpPrime();
        }
        else if (accept(Category.SIZEOF)) {
            nextToken(); // 'sizeof'
            expect(Category.LPAR);
            parseType();
            expect(Category.RPAR);
            parseExpPrime();
        }
        else {
            // error or epsilon not allowed at top-level exp
            error(Category.LPAR, Category.INT_LITERAL, Category.IDENTIFIER,
                    Category.MINUS, Category.PLUS, Category.CHAR_LITERAL,
                    Category.STRING_LITERAL, Category.ASTERISK, Category.AND,
                    Category.SIZEOF);
            // Attempt naive recovery
            nextToken();
        }
    }

    private void parseExpPrime() {
        // exp' suffix expansions
        // = "=" exp exp'
        // = "[" exp "]" exp'
        // = "." IDENT exp'
        // = binop => parseExp() parseExpPrime()
        // or epsilon
        if (accept(Category.ASSIGN)) {  // '='
            nextToken();
            parseExp();
            parseExpPrime();
        }
        else if (accept(Category.LSBR)) { // '['
            nextToken();
            parseExp();
            expect(Category.RSBR);
            parseExpPrime();
        }
        else if (accept(Category.DOT)) {  // '.'
            nextToken();
            expect(Category.IDENTIFIER);
            parseExpPrime();
        }
        else if (accept(Category.GT, Category.LT, Category.GE, Category.LE,
                Category.NE, Category.EQ,
                Category.PLUS, Category.MINUS, Category.DIV, Category.ASTERISK, Category.REM,
                Category.LOGAND, Category.LOGOR)) {
            // binary operator
            nextToken();
            parseExp();
            parseExpPrime();
        }
        else {
            // ε (do nothing)
        }
    }

    /**
     * func_call_or_var ::= IDENT [ "(" [ exp ("," exp)* ] ")" ]
     * We assume current token is IDENT already.
     */
    private void parseFuncCallOrVar() {
        expect(Category.IDENTIFIER);  // Already matched but to consume it
        if (accept(Category.LPAR)) {
            // function call
            nextToken(); // consume '('
            if (!accept(Category.RPAR)) {
                // parse first expr
                parseExp();
                // parse subsequent exprs if comma appears
                while (accept(Category.COMMA)) {
                    nextToken();
                    parseExp();
                }
            }
            expect(Category.RPAR);
        }
        // else it's just a variable usage; no further tokens
    }

    public static void main(String[] args) {
        System.out.println(System.getProperty("user.dir"));
        String filename = "src/java/test/fibonacci.c";
        try {
            File file = new File(filename);
            Scanner scanner = new Scanner(file);
            Tokeniser tokeniser = new Tokeniser(scanner);
            Parser p = new Parser(tokeniser);
            p.parse();

        } catch (IOException e) {
            System.err.println("Error reading file: " + filename);
            e.printStackTrace();
        }
    }

}
