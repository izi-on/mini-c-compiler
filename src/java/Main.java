import ast.Program;
import gen.CodeGenerator;
import gen.asm.AssemblyPass;
import lexer.Scanner;
import lexer.Tokeniser;
import parser.Parser;
import regalloc.GraphColouringRegAlloc;
import regalloc.NaiveRegAlloc;
import sem.SemanticAnalyzer;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

/**
 * Main entry point for compiling a Mini-C file to MIPS Assembly.
 * Usage: java MiniCCompiler [-colour] <input_minic_file.c>
 * Defaults to Naive register allocation unless -colour flag is specified.
 */
public class Main {

    // --- Exit Codes ---
    private static final int SUCCESS = 0;
    private static final int UNKNOWN_EXCEPTION = 1;
    private static final int FILE_NOT_FOUND = 2;
    private static final int IO_EXCEPTION = 3;
    private static final int INVALID_ARGS = 4;
    private static final int LEXER_FAIL = 250;
    private static final int PARSER_FAIL = 245;
    private static final int SEM_FAIL = 240;

    /**
     * Prints usage instructions to standard error.
     */
    private static void usage() {
        System.err.println("Usage: java MiniCCompiler [-colour] <input_minic_file.c>");
        System.err.println("  -colour : Use Graph Colouring register allocation (optional).");
        System.err.println("  <input_minic_file.c> : Path to the Mini-C source file.");
        System.err.println("\nOutput assembly file will be named based on the input file (e.g., input.c -> input.asm).");
    }

    /**
     * Derives the output assembly filename from the input source filename.
     * Replaces the last extension (e.g., .c) with .asm.
     * If no extension exists, appends .asm.
     *
     * @param inputPath The path to the input file.
     * @return The derived output file path.
     */
    private static String getOutputFilename(String inputPath) {
        int lastDot = inputPath.lastIndexOf('.');
        int lastSeparator = Math.max(inputPath.lastIndexOf('/'), inputPath.lastIndexOf('\\'));

        if (lastDot > lastSeparator) {
            // Found an extension after the last path separator
            return inputPath.substring(0, lastDot) + ".asm";
        } else {
            // No extension found or dot is part of the path
            return inputPath + ".asm";
        }
    }

    public static void main(String[] args) {
        boolean useGraphColouring = false;
        String inputFilePath = null;

        // --- Argument Parsing ---
        if (args.length == 1) {
            inputFilePath = args[0];
        } else if (args.length == 2 && args[0].equals("-colour")) {
            useGraphColouring = true;
            inputFilePath = args[1];
        } else {
            usage();
            System.exit(INVALID_ARGS);
        }

        File inputFile = new File(inputFilePath);
        File outputFile = new File(getOutputFilename(inputFilePath));

        System.out.println("Input file: " + inputFile.getAbsolutePath());
        System.out.println("Output file: " + outputFile.getAbsolutePath());
        System.out.println("Register Allocator: " + (useGraphColouring ? "Graph Colouring" : "Naive"));

        try {
            // --- Compilation Pipeline ---

            // 1. Lexing
            System.out.println("Starting Lexical Analysis...");
            Scanner scanner = new Scanner(inputFile);
            Tokeniser tokeniser = new Tokeniser(scanner);

            // 2. Parsing
            System.out.println("Starting Parsing...");
            Parser parser = new Parser(tokeniser);
            Program programAst = parser.parse();

            // Check for lexer/parser errors
            if (tokeniser.hasErrors()) {
                System.err.println("\nLexing failed with " + tokeniser.getNumErrors() + " errors.");
                System.exit(LEXER_FAIL);
            }
            if (parser.hasErrors()) {
                System.err.println("\nParsing failed with " + parser.getNumErrors() + " errors.");
                System.exit(PARSER_FAIL);
            }
            System.out.println("Lexing & Parsing: Success");

            // 3. Semantic Analysis
            System.out.println("Starting Semantic Analysis...");
            SemanticAnalyzer sem = new SemanticAnalyzer();
            sem.analyze(programAst);

            if (sem.hasErrors()) {
                System.err.println("\nSemantic analysis failed with " + sem.getNumErrors() + " errors.");
                System.exit(SEM_FAIL);
            }
            System.out.println("Semantic Analysis: Success");

            // 4. Code Generation & Register Allocation
            System.out.println("Starting Code Generation...");
            AssemblyPass regAlloc = useGraphColouring ?
                    GraphColouringRegAlloc.INSTANCE :
                    NaiveRegAlloc.INSTANCE;

            CodeGenerator codegen = new CodeGenerator(regAlloc);
            codegen.emitProgram(programAst, outputFile);

            System.out.println("\nCompilation successful!");
            System.out.println("MIPS Assembly written to: " + outputFile.getAbsolutePath());
            System.exit(SUCCESS);

        } catch (FileNotFoundException e) {
            System.err.println("\nError: Input file not found: " + inputFile.getAbsolutePath());
            System.exit(FILE_NOT_FOUND);
        } catch (IOException e) { // Catch potential IO errors during code generation output
            System.err.println("\nError: An I/O exception occurred: " + e.getMessage());
            e.printStackTrace(System.err);
            System.exit(IO_EXCEPTION);
        } catch (Exception e) { // Catch unexpected runtime errors
            System.err.println("\nAn unexpected error occurred during compilation:");
            e.printStackTrace(System.err);
            // Consider logging the full stack trace to a file if needed for debugging
            System.exit(UNKNOWN_EXCEPTION);
        }
    }
}