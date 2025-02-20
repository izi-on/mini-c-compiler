package parser;

import ast.*;
import lexer.Token;
import lexer.Token.Category;
import lexer.Tokeniser;
import util.CompilerPass;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

/**
 * A recursive‐descent parser for mini‐C using the following unambiguous grammar:
 *
 * <pre>
 * program    ::= (include)* (structdecl | vardecl_funcdef_or_funcdecl)* EOF
 *
 * include    ::= "#include" STRING_LITERAL
 *
 * structdecl ::= structtype "{" (vardecl)+ "}" ";"
 * vardecl    ::= type IDENT ("[" INT_LITERAL "]")* ";"
 *
 * vardecl_funcdef_or_funcdecl ::= type IDENT (is_vardecl | is_fundef_or_fundecl)
 * is_vardecl    ::= ("[" INT_LITERAL "]")* ";"
 * is_fundef_or_fundecl ::= "(" params ")" (block | ";")
 *
 * structtype ::= "struct" IDENT
 *
 * params     ::= [ type IDENT ("[" INT_LITERAL "]")* ("," type IDENT ("[" INT_LITERAL "]")* )* ]
 *
 * stmt ::= ifStmnt | nonIfStmnt
 * nonIfStmt    ::= block
 *              | "while" "(" exp ")" stmt
 *              | "return" [exp] ";"
 *              | exp ";"
 *              | "continue" ";"
 *              | "break" ";"
 * ifStmnt      ::= "if" "(" exp ")" withOrWithoutElse
 * withOrWithoutElse ::= stmt | withElse "else" stmt
 * withElse   ::= if "(" exp ")" withElse "else" withElse | nonIfStmt
 *
 * block      ::= "{" (vardecl)* (stmt)* "}"
 *
 * exp ::= exp1 "=" (exp | exp1)
 * exp1 ::= exp2 ("||" exp2)*
 * exp2 ::= exp3 ("&&" exp3)*
 * exp3 ::= exp4 (("==" | "!=") exp4)*
 * exp4 ::= exp5 ((">" | "<" | ">=" | "<=") exp5)*
 * exp5 ::= exp6 (("+" | "-") exp6)*
 * exp6 ::= exp7 (("*" | "/" | "%") exp7)*
 * exp7 ::= ("&" | "*" | typecast | "-" | "+") (exp7 | exp8)
 * exp8 ::= ( IDENT ( funccall_params | matrix_brqt | struct_field_access | epsilon ) )
 *        | ( exp9 (matrix_brqt | struct_field_access)* )
 * exp9 ::= "(" exp ")" | INT_LITERAL | CHAR_LITERAL | STRING_LITERAL | sizeof
 *
 * sizeof       ::= "sizeof" "(" type ")"
 * typecast     ::= "(" type ")" exp
 * type       ::= ("int" | "char" | "void" | structtype) ("*")*
 *
 * funccall_params ::= "(" [ exp ("," exp)* ] ")"
 * matrix_brqt ::= "[" exp "]"
 * struct_field_access ::= "." IDENT
 * </pre>
 *
 * The AST node classes are assumed to be defined in the ast package.
 */
public class Parser extends CompilerPass {

    private Token token;
    private final Queue<Token> buffer = new LinkedList<>();
    private final Tokeniser tokeniser;
    private Token lastErrorToken;

    public Parser(Tokeniser tokeniser) {
        this.tokeniser = tokeniser;
    }

    public Program parse() {
        nextToken();
        Program prog = parseProgram();
        return prog;
    }

    // --- Utility routines ---
    private Token lookAhead(int i) {
        while (buffer.size() < i) {
            buffer.add(tokeniser.nextToken());
        }
        int cnt = 1;
        for (Token t : buffer) {
            if (cnt == i) return t;
            cnt++;
        }
        assert false;
        return tokeniser.nextToken();
    }

    private void nextToken() {
        if (!buffer.isEmpty())
            token = buffer.remove();
        else
            token = tokeniser.nextToken();
    }

    private Token expect(Category... expected) {
        for (Category e : expected) {
            if (token.category == e) {
                Token ret = token;
                nextToken();
                return ret;
            }
        }
        error(expected);
        return token;
    }

    private boolean accept(Category... expected) {
        for (Category e : expected) {
            if (token.category == e)
                return true;
        }
        return false;
    }

    private void error(Category... expected) {
        if (lastErrorToken == token) return; // avoid duplicate error messages
        StringBuilder sb = new StringBuilder();
        String sep = "";
        for (Category e : expected) {
            sb.append(sep).append(e);
            sep = "|";
        }
        System.out.println("Parsing error: expected (" + sb + ") found (" + token + ") at " + token.position);
        incError();
        lastErrorToken = token;
    }

    // --- Grammar productions ---

    // program ::= (include)* (structdecl | vardecl_funcdef_or_funcdecl)* EOF
    private Program parseProgram() {
        List<Decl> decls = new ArrayList<>();
        while (accept(Category.INCLUDE)) {
            parseInclude();
        }
        while (accept(Category.STRUCT, Category.INT, Category.CHAR, Category.VOID)) {
            // A struct declaration is recognized by: 'struct' IDENTIFIER '{'
            if (token.category == Category.STRUCT &&
                    lookAhead(1).category == Category.IDENTIFIER &&
                    lookAhead(2).category == Category.LBRA) {
                decls.add(parseStructDecl());
            } else {
                decls.add(parseDecl());
            }
        }
        expect(Category.EOF);
        return new Program(decls);
    }

    // include ::= "#include" STRING_LITERAL
    private void parseInclude() {
        expect(Category.INCLUDE);
        expect(Category.STRING_LITERAL);
    }

    // structdecl ::= structtype "{" (vardecl)+ "}" ";"
    private Decl parseStructDecl() {
        // structtype ::= "struct" IDENT
        expect(Category.STRUCT);
        String structName = expect(Category.IDENTIFIER).data;
        StructType structType = new StructType(structName);
        expect(Category.LBRA);
        List<VarDecl> fields = new ArrayList<>();
        // At least one vardecl is required
        do {
            // Use the regular vardecl production: type IDENT ("[" INT_LITERAL "]")* ";"
            Type fieldType = parseType();
            String fieldId = expect(Category.IDENTIFIER).data;
            VarDecl field = parseVarDecl(fieldType, fieldId);
            fields.add(field);
        } while (accept(Category.INT, Category.CHAR, Category.VOID, Category.STRUCT));
        expect(Category.RBRA);
        expect(Category.SC);
        return new StructTypeDecl(structName, fields);
    }

    // vardecl ::= type IDENT [declArrayDims] ";"
    // declArrayDims ::= ("[" INT_LITERAL "]" declArrayDims ) | epsilon
    private VarDecl parseVarDecl(Type type, String id) {

        type = declArrayDims(type);
        expect(Category.SC);
        return new VarDecl(type, id);
    }
    private Type declArrayDims(Type type) {
        if (accept(Category.LSBR)) {
            nextToken();
            int size = 0;
            try {
                size = Integer.parseInt(expect(Category.INT_LITERAL).data);
            } catch (NumberFormatException e) {
                error(Category.INT_LITERAL);
            }
            expect(Category.RSBR);
            type = new ArrayType(declArrayDims(type), size); // matrix type decl is from right to left
        }
        return type;
    }

    // vardecl_funcdef_or_funcdecl ::= type IDENT ( is_vardecl | is_fundef_or_fundecl )
    private Decl parseDecl() {
        Type type = parseType();
        String id = expect(Category.IDENTIFIER).data;
        if (accept(Category.LPAR)) {
            // is_fundef_or_fundecl
            return parseFunDeclOrFunDef(type, id);
        } else {
            // is_vardecl
            return parseVarDecl(type, id);
        }
    }

    // is_fundef_or_fundecl ::= "(" params ")" ( block | ";" )
    private Decl parseFunDeclOrFunDef(Type type, String id) {
        expect(Category.LPAR);
        List<VarDecl> params = parseParams();
        expect(Category.RPAR);
        if (accept(Category.LBRA)) {
            Block block = parseBlock();
            return new FunDef(type, id, params, block);
        } else if (accept(Category.SC)) {
            nextToken(); // consume ";"
            return new FunDecl(type, id, params); // function prototype (block is null)
        } else {
            error(Category.LBRA, Category.SC);
            nextToken();
            return new FunDecl(type, id, params);
        }
    }

    // params ::= [ type IDENT ("[" INT_LITERAL "]")* ("," type IDENT ("[" INT_LITERAL "]")* )* ]
    private List<VarDecl> parseParams() {
        List<VarDecl> params = new ArrayList<>();
        if (accept(Category.RPAR))
            return params;
        do {
            Type t = parseType();
            String paramId = expect(Category.IDENTIFIER).data;
            while (accept(Category.LSBR)) {
                nextToken();
                int size = Integer.parseInt(expect(Category.INT_LITERAL).data);
                expect(Category.RSBR);
                t = new ArrayType(t, size);
            }
            params.add(new VarDecl(t, paramId));
            if (accept(Category.COMMA))
                nextToken();
            else
                break;
        } while (!accept(Category.RPAR));
        return params;
    }

    // block ::= "{" (vardecl)* (stmt)* "}"
    private Block parseBlock() {
        expect(Category.LBRA);
        List<VarDecl> vardecls = new ArrayList<>();
        while (accept(Category.INT, Category.CHAR, Category.VOID, Category.STRUCT)) {
            Type t = parseType();
            String id = expect(Category.IDENTIFIER).data;
            VarDecl vd = parseVarDecl(t, id);
            vardecls.add(vd);
        }
        List<Stmt> stmts = new ArrayList<>();
        while (!accept(Category.RBRA) && !accept(Category.EOF)) {
            stmts.add(parseStmt());
        }
        expect(Category.RBRA);
        return new Block(vardecls, stmts);
    }

    // stmt ::= ifStmnt | nonIfStmnt
    // (For simplicity, we implement a standard if–else without the extra unambiguous distinctions.)
    private Stmt parseStmt() {
        if (accept(Category.IF))
            return parseIfStmt();
        else if (accept(Category.WHILE))
            return parseWhileStmt();
        else if (accept(Category.RETURN))
            return parseReturnStmt();
        else if (accept(Category.CONTINUE)) {
            nextToken();
            expect(Category.SC);
            return new Continue();
        } else if (accept(Category.BREAK)) {
            nextToken();
            expect(Category.SC);
            return new Break();
        } else if (accept(Category.LBRA))
            return parseBlock();
        else {
            // nonIfStmt ::= exp ";"  (i.e. an expression statement)
            Expr e = parseExp();
            expect(Category.SC);
            return new ExprStmt(e);
        }
    }

    // ifStmnt ::= "if" "(" exp ")" withOrWithoutElse
    // withOrWithoutElse ::= stmt | withElse "else" stmt
    private Stmt parseIfStmt() {
        expect(Category.IF);
        expect(Category.LPAR);
        Expr condition = parseExp();
        expect(Category.RPAR);
        Stmt thenStmt = parseStmt();
        Stmt elseStmt = null;
        if (accept(Category.ELSE)) {
            nextToken();
            elseStmt = parseStmt();
        }
        return new If(condition, thenStmt, elseStmt);
    }

    // whileStmt ::= "while" "(" exp ")" stmt
    private Stmt parseWhileStmt() {
        expect(Category.WHILE);
        expect(Category.LPAR);
        Expr cond = parseExp();
        expect(Category.RPAR);
        Stmt body = parseStmt();
        return new While(cond, body);
    }

    // returnStmt ::= "return" [exp] ";"
    private Stmt parseReturnStmt() {
        expect(Category.RETURN);
        Expr e = null;
        if (!accept(Category.SC))
            e = parseExp();
        expect(Category.SC);
        return new Return(e);
    }

    // --- Expression productions ---
    // exp ::= exp1 "=" (exp | exp1)
    // (assignment is right-associative)
    private Expr parseExp() {
        Expr left = parseExp1();
        if (accept(Category.ASSIGN)) {
            nextToken();
            Expr right = parseExp();
            return new Assign(left, right);
        }
        return left;
    }

    // exp1 ::= exp2 ("||" exp2)*
    private Expr parseExp1() {
        Expr left = parseExp2();
        while (accept(Category.LOGOR)) {
            Token opToken = token;
            nextToken();
            Expr right = parseExp2();
            left = new BinOp(left, Op.OR, right);
        }
        return left;
    }

    // exp2 ::= exp3 ("&&" exp3)*
    private Expr parseExp2() {
        Expr left = parseExp3();
        while (accept(Category.LOGAND)) {
            Token opToken = token;
            nextToken();
            Expr right = parseExp3();
            left = new BinOp(left, Op.AND, right);
        }
        return left;
    }

    // exp3 ::= exp4 (("==" | "!=") exp4)*
    private Expr parseExp3() {
        Expr left = parseExp4();
        while (accept(Category.EQ, Category.NE)) {
            Token opToken = token;
            Op op = (opToken.category == Category.EQ) ? Op.EQ : Op.NE;
            nextToken();
            Expr right = parseExp4();
            left = new BinOp(left, op, right);
        }
        return left;
    }

    // exp4 ::= exp5 ((">" | "<" | ">=" | "<=") exp5)*
    private Expr parseExp4() {
        Expr left = parseExp5();
        while (accept(Category.LT, Category.GT, Category.LE, Category.GE)) {
            Token opToken = token;
            Op op;
            if (opToken.category == Category.LT) op = Op.LT;
            else if (opToken.category == Category.GT) op = Op.GT;
            else if (opToken.category == Category.LE) op = Op.LE;
            else op = Op.GE;
            nextToken();
            Expr right = parseExp5();
            left = new BinOp(left, op, right);
        }
        return left;
    }

    // exp5 ::= exp6 (("+" | "-") exp6)*
    private Expr parseExp5() {
        Expr left = parseExp6();
        while (accept(Category.PLUS, Category.MINUS)) {
            Token opToken = token;
            Op op = (opToken.category == Category.PLUS) ? Op.ADD : Op.SUB;
            nextToken();
            Expr right = parseExp6();
            left = new BinOp(left, op, right);
        }
        return left;
    }

    // exp6 ::= exp7 (("*" | "/" | "%") exp7)*
    private Expr parseExp6() {
        Expr left = parseExp7();
        while (accept(Category.ASTERISK, Category.DIV, Category.REM)) {
            Token opToken = token;
            Op op;
            if (opToken.category == Category.ASTERISK) op = Op.MUL;
            else if (opToken.category == Category.DIV) op = Op.DIV;
            else op = Op.MOD;
            nextToken();
            Expr right = parseExp7();
            left = new BinOp(left, op, right);
        }
        return left;
    }

    // exp7 ::= ("&" | "*" | typecast | "-" | "+") (exp7 | exp8)
    private Expr parseExp7() {
        if (accept(Category.AND)) {
            nextToken();
            Expr operand = parseExp7();
            return new AddressOfExpr(operand);
        } else if (accept(Category.ASTERISK)) {
            nextToken();
            Expr operand = parseExp7();
            return new ValueAtExpr(operand);
        } else if (accept(Category.MINUS, Category.PLUS)) {
            Token opToken = token;
            nextToken();
            Expr operand = parseExp7();
            return new BinOp(new IntLiteral(0), (opToken.category == Category.MINUS) ? Op.SUB : Op.ADD, operand);
        } else if (accept(Category.LPAR) && lookAhead(1).category == Category.INT || lookAhead(1).category == Category.CHAR ||
                    lookAhead(1).category == Category.VOID || lookAhead(1).category == Category.STRUCT) {
            // typecast production: ( type ) exp7
            expect(Category.LPAR);
            Type t = parseType();
            expect(Category.RPAR);
            Expr operand = parseExp7();
            return new TypecastExpr(t, operand);
        } else {
            return parseExp8();
        }
    }

    // exp8 ::= ( IDENT ( (funccall_params | epsilon) (matrix_brqt | struct_field_access)* ) )
    //        | ( exp9 ( matrix_brqt | struct_field_access )* )
    private Expr parseExp8() {
        Expr expr;
        if (accept(Category.IDENTIFIER)) {
            String id = expect(Category.IDENTIFIER).data;
            if (accept(Category.LPAR)) {
                expr = parseFuncCall(id);
            } else {
                expr = new VarExpr(id);
            }
            while (accept(Category.LSBR) || accept(Category.DOT)) {
                if (accept(Category.LSBR)) {
                    nextToken();
                    Expr index = parseExp();
                    expect(Category.RSBR);
                    expr = new ArrayAccessExpr(expr, index);
                } else {
                    nextToken();
                    String field = expect(Category.IDENTIFIER).data;
                    expr = new FieldAccessExpr(expr, field);
                }
            }
            return expr;
        } else {
            expr = parseExp9();
            while (accept(Category.LSBR) || accept(Category.DOT)) {
                if (accept(Category.LSBR)) {
                    nextToken();
                    Expr index = parseExp();
                    expect(Category.RSBR);
                    expr = new ArrayAccessExpr(expr, index);
                } else {
                    nextToken();
                    String field = expect(Category.IDENTIFIER).data;
                    expr = new FieldAccessExpr(expr, field);
                }
            }
            return expr;
        }
    }

    // exp9 ::= "(" exp ")" | INT_LITERAL | CHAR_LITERAL | STRING_LITERAL | sizeof
    private Expr parseExp9() {
        if (accept(Category.LPAR)) {
            nextToken();
            Expr e = parseExp();
            expect(Category.RPAR);
            return e;
        } else if (accept(Category.INT_LITERAL)) {
            String data = expect(Category.INT_LITERAL).data;
            return new IntLiteral(Integer.parseInt(data));
        } else if (accept(Category.CHAR_LITERAL)) {
            String data = expect(Category.CHAR_LITERAL).data;
            return new ChrLiteral(data);
        } else if (accept(Category.STRING_LITERAL)) {
            String data = expect(Category.STRING_LITERAL).data;
            return new StrLiteral(data);
        } else if (accept(Category.SIZEOF)) {
            return parseSizeof();
        } else {
            error(Category.LPAR, Category.INT_LITERAL, Category.CHAR_LITERAL, Category.STRING_LITERAL, Category.SIZEOF);
            nextToken();
            return new IntLiteral(0);
        }
    }

    // sizeof ::= "sizeof" "(" type ")"
    private Expr parseSizeof() {
        expect(Category.SIZEOF);
        expect(Category.LPAR);
        Type t = parseType();
        expect(Category.RPAR);
        return new SizeOfExpr(t);
    }

    // Helper: function call parameters: funccall_params ::= "(" [ exp ("," exp)* ] ")"
    private Expr parseFuncCall(String funcId) {
        expect(Category.LPAR);
        List<Expr> args = new ArrayList<>();
        if (!accept(Category.RPAR)) {
            do {
                args.add(parseExp());
                if (accept(Category.COMMA))
                    nextToken();
                else
                    break;
            } while (!accept(Category.RPAR));
        }
        expect(Category.RPAR);
        return new FunCallExpr(funcId, args);
    }

    // type ::= ("int" | "char" | "void" | structtype) ("*")*
    // structtype ::= "struct" IDENT
    private Type parseType() {
        Type base;
        if (accept(Category.INT)) {
            nextToken();
            base = BaseType.INT;
        } else if (accept(Category.CHAR)) {
            nextToken();
            base = BaseType.CHAR;
        } else if (accept(Category.VOID)) {
            nextToken();
            base = BaseType.VOID;
        } else if (accept(Category.STRUCT)) {
            nextToken();
            String structName = expect(Category.IDENTIFIER).data;
            base = new StructType(structName);
        } else {
            error(Category.INT, Category.CHAR, Category.VOID, Category.STRUCT);
            base = BaseType.UNKNOWN;
        }
        while (accept(Category.ASTERISK)) {
            nextToken();
            base = new PointerType(base);
        }
        return base;
    }
}