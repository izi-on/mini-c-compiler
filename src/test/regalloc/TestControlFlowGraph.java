package regalloc;

import ast.Program;
import gen.CodeGenerator;
import gen.ProgramCodeGen;
import gen.asm.AssemblyProgram;
import lexer.Scanner;
import lexer.Tokeniser;
import parser.Parser;
import regalloc.control_flow.ControlFlowNode;
import regalloc.control_flow.ControlFlowNodePrinter;
import sem.SemanticAnalyzer;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

public class TestControlFlowGraph {

    private void runCode(String code) throws IOException {
        Path tempFile = Files.createTempFile("temp", ".tmp");
        Files.write(tempFile, code.getBytes(StandardCharsets.UTF_8));
        try {
            // Step 1: Parsing
            Scanner scanner = new Scanner(tempFile.toFile());
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

//            // optional: print with ASTPrinter
//            ASTPrinter printer = new ASTPrinter(new PrintWriter(System.out));
//            printer.visit(prog);

            // Step 3: Code Generation
            // Here we use our default register allocator, NaiveRegAlloc.
            AssemblyProgram asmProgWithVirtualRegs = new AssemblyProgram();
            ProgramCodeGen progGen = new ProgramCodeGen(asmProgWithVirtualRegs);
            progGen.generate(prog);
            ControlFlowNode node = GraphColouringRegAlloc.buildControlFlowGraph(asmProgWithVirtualRegs.textSections.get(asmProgWithVirtualRegs.textSections.size() -1));
            new ControlFlowNodePrinter().visit(node);
        } catch (FileNotFoundException e) {
            System.err.println("Source file not found: " + tempFile.toFile().getAbsolutePath());
            throw e;
        } catch (IOException e) {
            System.err.println("Error reading file: " + tempFile.toFile().getAbsolutePath());
            throw e;
        }
    }

    public static void main(String[] args) throws IOException {
        TestControlFlowGraph test = new TestControlFlowGraph();
        test.runCode("int main() { return 0; }");
    }
}
