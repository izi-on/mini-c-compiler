package gen;

import ast.Program;
import lexer.Scanner;
import lexer.Tokeniser;
import parser.Parser;
import sem.SemanticAnalyzer;
import gen.CodeGenerator;
import regalloc.NaiveRegAlloc;

import java.io.*;

public class MiniCCodeGenDemo {
    public static void main(String[] args) {
        // Specify the input mini-C source file.
        File sourceFile = new File("main.c");
        try {
            // Step 1: Parsing
            Scanner scanner = new Scanner(sourceFile);
            Tokeniser tokeniser = new Tokeniser(scanner);
            Parser parser = new Parser(tokeniser);
            Program prog = parser.parse();
            if (tokeniser.hasErrors()) {
                System.out.println("Lexing failed with " + tokeniser.getNumErrors() + " errors.");
                System.exit(1);
            }
            if (parser.hasErrors()) {
                System.out.println("Parsing failed with " + parser.getNumErrors() + " errors.");
                System.exit(1);
            }
            System.out.println("Parsing: pass");

            // Step 2: Semantic Analysis
            SemanticAnalyzer sem = new SemanticAnalyzer();
            sem.analyze(prog);
            if (sem.hasErrors()) {
                System.out.println("Semantic analysis failed with " + sem.getNumErrors() + " errors.");
                System.exit(1);
            }
            System.out.println("Semantic analysis: pass");

            // Step 3: Code Generation
            // Here we use our default register allocator, NaiveRegAlloc.
            CodeGenerator codegen = new CodeGenerator(NaiveRegAlloc.INSTANCE);
            File asmFile = new File("output.asm");
            codegen.emitProgram(prog, asmFile);
            System.out.println("Code generated successfully in " + asmFile.getAbsolutePath());
        } catch (FileNotFoundException e) {
            System.err.println("Source file not found: " + sourceFile.getAbsolutePath());
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}