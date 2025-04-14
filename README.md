# Compiler for an Object-Oriented C-like Language (Mini-C++)

This repository contains the source code for a compiler written in Java. It compiles a C-like language, extended with object-oriented features like classes and inheritance, down to MIPS assembly code.

## Compiler Stages & Features

The compiler implements the standard pipeline:

1.  **Lexical Analysis (`lexer/`)**:
    *   `Scanner`: Reads the input source file character by character.
    *   `Tokeniser`: Groups characters into tokens (keywords, identifiers, literals, operators).
    *   `TrieNode`: Used for efficient matching of fixed tokens (keywords, operators).

2.  **Syntax Analysis (`parser/`)**:
    *   `Parser`: Implements a recursive descent parser based on the language grammar.
    *   Builds an Abstract Syntax Tree (AST) representing the program structure.

3.  **Abstract Syntax Tree (`ast/`)**:
    *   Defines nodes for all language constructs (Expressions, Statements, Declarations, Types, etc.).
    *   Includes nodes for basic C features (structs, pointers, arrays) and OO features (classes, `new`, method calls).

4.  **Semantic Analysis (`sem/`)**:
    *   `NameAnalyzer`: Resolves identifier usage to their declarations, checks for double declarations, manages scopes.
    *   `TypeAnalyzer`: Performs type checking on expressions and statements, ensuring type compatibility. Handles type casting and inference for AST nodes.
    *   `Scope`/`Symbol`: Manages nested scopes and symbol table information.
    *   `AllowedStmntAnalyzer`: Checks for correct usage of `break`/`continue`.
    *   Error Handling (`sem/error/`): Defines specific semantic error types.

5.  **Code Generation (`gen/`)**:
    *   Translates the type-checked AST into MIPS assembly (`gen/asm/`).
    *   `ProgramCodeGen`, `FunCodeGen`, `StmtCodeGen`, `ExprValCodeGen`, `ExprAddrCodeGen`: Handle different parts of the AST.
    *   `MemAllocCodeGen`: Manages stack frame layout and global variable allocation.
    *   `ClassCodeGen`, `ClassObjectLayoutGetter`, `ClassVirtualTableGetter`: Specific handling for class features (V-Tables, object memory layout).
    *   `ImplicitThisParam`, `MarkFunctionsAsMethodCalls`: Pre-processing passes for OO features.
    *   Utilities (`gen/util/`): Emitters, memory context, built-in function implementations (print_i/c/s, read_i/c, mcmalloc).

6.  **Register Allocation (`regalloc/`)**:
    *   **Naive:** A simple baseline allocator that spills all virtual registers to the stack.
    *   **Graph Colouring:**
        *   Builds a Control Flow Graph (`regalloc/control_flow/`).
        *   Performs Liveness Analysis.
        *   Constructs an Interference Graph.
        *   Applies graph colouring algorithm with spilling logic.

## Target Architecture

*   MIPS Assembly

## Usage

The compiler can be invoked via the `Main*.java` classes, typically specifying a compiler stage (e.g., `-lexer`, `-parser`, `-sem`, `-gen [naive|colour]`, `-regalloc [naive|colour]`) and input/output files.

---
*The file list provided outlines the detailed structure of the compiler components.*
