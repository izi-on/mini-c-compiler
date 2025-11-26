# Compiler for an Object-Oriented C-like Language (Mini-C++)

This repository contains the source code for a compiler, written primarily in Java, designed to translate a C-like language extended with object-oriented features into MIPS assembly code.

## Usage

```bash
java -jar MiniCCompiler.jar [-colour] <path-to-source-file>
```

### Options
*   `-colour`: Use graph coloring for register allocation (default is naive register allocation). This can significantly speed up execution time, but OOP features may not be fully supported and the compilation may fail.

## Example Mini-C++ Program

```c
#include "minic-stdlib.h"

void main() {
  int n;
  int first;
  int second;
  int next;
  int c;
  char t;

  // read n from the standard input
  n = read_i();
  
  first = 0;
  second = 1;
    
  print_s((char*)"First ");
  print_i(n);
  print_s((char*)" terms of Fibonacci series are : ");
 
  c = 0;
  while (c < n) {
    if ( c <= 1 )
      next = c;
    else
      {
	next = first + second;
	first = second;
	second = next;
      }
    print_i(next);
    print_s((char*)" ");
    c = c+1;
  }
}
```

More examples can be found under `test/` and `src/test/gen/`

## Syntax Grammar
This is the syntax grammar for Mini-C++:

```
# #  comment
# () grouping
# [] optional
# *  zero or more
# +  one or more
# |  alternative

program    ::= (include)* (classdecl | structdecl | vardecl | fundecl | fundef)* EOF

include    ::= "#include" STRING_LITERAL

structdecl ::= structtype "{" (vardecl)+ "}" ";"    # structure declaration

vardecl    ::= type IDENT ("[" INT_LITERAL "]")* ";" # variable declaration, (e.g. int a;), or multi-dimensional array declaration, (e.g. int a[2][5];)

fundef    ::= type IDENT "(" params ")" block       # function definition

fundecl   ::= type IDENT "(" params ")" ";"         # function declaration

classdecl  ::= classtype ["extends" IDENT] "{" (vardecl)* (fundef)* "}"

type       ::= ("int" | "char" | "void" | structtype | classtype) ("*")* 

structtype ::= "struct" IDENT

classtype  ::= "class" IDENT

params     ::= [ type IDENT ("[" INT_LITERAL "]")* ("," type IDENT ("[" INT_LITERAL "]")*)* ]

stmt       ::= block
             | "while" "(" exp ")" stmt              # while loop
             | "if" "(" exp ")" stmt ["else" stmt]   # if then else
             | "return" [exp] ";"                    # return
             | exp ";"                               # expression statement, e.g. a function call
             | "continue" ";"                        # continue
             | "break" ";"                           # break

block      ::= "{" (vardecl)* (stmt)* "}"

exp        ::= "(" exp ")"
             | exp "=" exp                           # assignment
             | (IDENT | INT_LITERAL)
             | ("-" | "+") exp
             | CHAR_LITERAL
             | STRING_LITERAL
             | exp (">" | "<" | ">=" | "<=" | "!=" | "==" | "+" | "-" | "/" | "*" | "%" | "||" | "&&") exp  # binary operators
             | arrayaccess | fieldaccess | valueat | addressof | funcall | sizeof | typecast
             | instanceFuncall | newInstance

newInstance     ::= "new" classtype"()"
instanceFuncall ::= exp "." funcall

funcall      ::= IDENT "(" [ exp ("," exp)* ] ")" # function call
arrayaccess  ::= exp "[" exp "]"                  # array access
fieldaccess  ::= exp "." IDENT                    # class instance or structure field member access
valueat      ::= "*" exp                          # Value at operator (pointer indirection)
addressof    ::= "&" exp                          # Address-of operator
sizeof       ::= "sizeof" "(" type ")"            # size of type
typecast     ::= "(" type ")" exp                 # type casting
```

## Project Structure Overview

The compiler follows a standard pipeline architecture:

1.  **Lexical Analysis (`src/java/lexer/`)**:
    *   Responsible for breaking down the source code into a stream of tokens.
    *   Key components: `Scanner.java` (reads input), `Tokeniser.java` (generates tokens), `Token.java` (defines token types), `TrieNode.java` (likely for efficient keyword/operator lookup).

2.  **Syntax Analysis (`src/java/parser/`)**:
    *   `Parser.java`: Parses the token stream according to the language grammar, typically using recursive descent.
    *   Constructs an Abstract Syntax Tree (AST).

3.  **Abstract Syntax Tree (`src/java/ast/`)**:
    *   Defines the structure of the program internally using nodes like `Program`, `FunDef`, `VarDecl`, `ClassDecl`, `Stmt`, `Expr`, `Type`, etc.
    *   Supports C features (Structs, Pointers, Arrays) and Object-Oriented features (Classes, Inheritance (`extends`), `new`, Instance Method Calls).

4.  **Semantic Analysis (`src/java/sem/`)**:
    *   Performs checks for semantic correctness beyond syntax.
    *   `NameAnalyzer.java`: Handles scope management, resolves identifier usage to declarations, and detects naming conflicts (shadowing, double declarations).
    *   `TypeAnalyzer.java`: Performs type checking on expressions and statements, ensuring type compatibility and inferring types for AST nodes.
    *   `SemanticAnalyzer.java`: Orchestrates the semantic analysis passes.
    *   `Scope.java`, `Symbol.java` (and subclasses like `VariableSymbol`, `FunctionSymbol`, `StructSymbol`, `ClassSymbol`): Implement the symbol table and scope hierarchy.
    *   `AllowedStmntAnalyzer.java`: Checks for correct usage of `break` and `continue`.
    *   Error handling classes are located in `sem/error/`.

5.  **Code Generation (`src/java/gen/`)**:
    *   Translates the validated AST into MIPS assembly code (`gen/asm/`).
    *   Classes like `ProgramCodeGen`, `FunCodeGen`, `ClassCodeGen`, `StmtCodeGen`, `ExprValCodeGen`, `ExprAddrCodeGen` handle different AST node types.
    *   Manages memory layout for stack frames (`gen/util/mem/`), structs, and objects (`ClassObjectLayoutGetter`).
    *   Implements code for built-in functions (`gen/util/builtin/`).
    *   Handles object-oriented features like virtual tables (`ClassVirtualTableGetter`) and implicit `this` parameters (`ImplicitThisParam`, `MarkFunctionsAsMethodCalls`).

6.  **Register Allocation (`src/java/regalloc/`)**:
    *   Assigns physical MIPS registers to the virtual registers used during code generation.
    *   Provides at least two strategies:
        *   `NaiveRegAlloc.java`: A simple approach, likely spilling most virtual registers to the stack.
        *   `GraphColouringRegAlloc.java`: A more sophisticated approach involving control flow graphs, liveness analysis, interference graphs, and graph coloring with spilling.

## Building and Running

* Compile the source files: `javac -d bin src/java/**/*.java`
* Create the jar file: `jar cvfm MiniCCompiler.jar src/java/MANIFEST.MF -C bin .`
* Run your compiler: `java -jar MiniCCompiler.jar <path-to-program>`

## Credits

This project was written as part of a McGill course taught by Prof. Christophe Dubach, focusing on compiler construction and design. The project was written and developed entirely by myself and is not based on any external sources or repositories other than the ones taught in the class.
---
