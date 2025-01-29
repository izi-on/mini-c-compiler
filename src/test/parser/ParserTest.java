package parser;

import org.junit.Test;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.io.*;

import lexer.Scanner;
import lexer.Tokeniser;
import parser.Parser;

public class ParserTest {

    private Parser createParserFromString(String input) throws IOException {
        File tempFile = File.createTempFile("parser_input", ".txt");

        tempFile.deleteOnExit();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))) {
            writer.write(input);
        }

        Scanner scanner = new Scanner(tempFile);
        Tokeniser tokeniser = new Tokeniser(scanner);
        return new Parser(tokeniser);
    }

    @Test
    public void testIncludeWithSpaces() throws IOException {
        String code =
                "   #include   \"myHeader.h\"    \n" +
                        "   int main() { return 0; }     \n";

        Parser parser = createParserFromString(code);
        parser.parse();

        assertEquals(
                "Parser should successfully parse #include with extra spaces.",
                0,
                parser.getNumErrors()  // or whichever method you use to track errors
        );
    }

    @Test
    public void testIncludeAngleBracketsShouldFail() throws IOException {
        String input =
                "#include <stdio.h>\n" +
                        "int main() {\n" +
                        "    return 0;\n" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();

        // We expect at least 1 error because the grammar doesn't allow <...>
        assertTrue("Expected parse errors for #include <stdio.h>.",
                parser.getNumErrors() > 0);
    }

    @Test
    public void testIncludeStringLiteralShouldPass() throws IOException {
        String input =
                "#include \"stdio.h\"\n" +
                        "int main() {\n" +
                        "    return 0;\n" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();

        assertEquals("Expected no parse errors for #include \"stdio.h\".",
                0, parser.getNumErrors());
    }

    @Test
    public void testAllSyntaxCategoriesWithSpaces() throws IOException {
        String input =
                "  \n" +
                        "#include   \"myheader.h\"  \n" +
                        "    \n" +
                        "  struct   Foo  {\n" +
                        "    int   x   ;\n" +
                        "    char  y  ;\n" +
                        "  }   ;   \n" +
                        "\n" +
                        "   int   main   (   )  \n" +
                        "   {\n" +
                        "       int    a   ;\n" +
                        "       a  =   3  ;\n" +
                        "       while   (   a   <   10   )  \n" +
                        "       {\n" +
                        "          a  =  a  +  1  ;\n" +
                        "       }\n" +
                        "       return   a  ;\n" +
                        "   }\n";
        Parser parser = createParserFromString(input);
        parser.parse();

        assertEquals("Expected no parse errors with extra whitespace everywhere.",
                0, parser.getNumErrors());
    }

    @Test
    public void testVoidMainVoidSignature() throws IOException {
        String input =
                "int main(void) {\n" +
                        "    return 0;\n" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();

        // If your grammar doesn't allow 'void' in the params in place of type+IDENT,
        // you might expect an error.
        // For demonstration, let's check if it fails:
        assertTrue("Expected parse error if grammar does not allow (void).",
                parser.getNumErrors() > 0);
    }

    @Test
    public void testComments() throws IOException {
        // This sample includes both a block comment and a line comment:
        String input =
                "#include \"stdio.h\"  /* block comment */\n" +
                        "// line comment here\n" +
                        "int main() {\n" +
                        "    /* another comment */\n" +
                        "    // one more\n" +
                        "    return 0;\n" +
                        "}\n";
        Parser parser = createParserFromString(input);
        parser.parse();

        // If your lexer properly discards comments, there should be no errors:
        assertEquals("Expected no parse errors if comments are properly handled.",
                0, parser.getNumErrors());
    }

    @Test
    public void testMegaAllSyntaxFeatures() throws IOException {
        String input =
                "   #include  \"example.h\"   \n" +               // 1) include with extra spaces
                        "   struct   MyStruct   {\n" +                   // 2) struct definition
                        "       int   x  ;  \n" +
                        "       char  y  ;  \n" +
                        "   }   ;   \n" +
                        "\n" +
                        "   int  globalVar   ;   \n" +                   // 3) global variable
                        "   char*   pGlobal  ;   \n" +                   //    pointer type
                        "   int  globalArray  [  5  ] ; \n" +            //    single-dimensional array
                        "   \n" +
                        "   int  foo  (  int  a,   int  b  )  ;   \n" +   // 4) function *declaration*
                        "\n" +
                        "   int  foo ( int a,  int b )   \n" +            // 5) function *definition*
                        "   {\n" +
                        "       int  i ;\n" +
                        "       struct MyStruct  ms  ;\n" +
                        "       i = a + b ;\n" +
                        "       while ( i < 10 ) {\n" +
                        "           i = i + 1 ;\n" +
                        "           if ( i == 5 )  break   ;\n" +
                        "           else  continue ;\n" +
                        "       }\n" +
                        "       ms.x = i ;\n" +
                        "       ms.y = 'z'  ;\n" +
                        "       return   ms.x ;\n" +
                        "   }\n" +
                        "\n" +
                        "   int  main()    \n" +
                        "   {\n" +
                        "       int a  [ 2 ]  ;\n" +                      // 6) local multi-dimensional arrays
                        "       a [ 0 ] =  1  ;\n" +
                        "       a [ 1 ] =  2  ;\n" +
                        "       foo ( a [ 0 ] , a [ 1 ] )  ;\n" +         // 7) function call with array indexing
                        "       return 0;\n" +
                        "   }\n";

        Parser parser = createParserFromString(input);
        parser.parse();

        // If your grammar matches all these constructs, we expect 0 errors:
        assertEquals("Expected full parse success for mega C code sample.",
                0, parser.getNumErrors());
    }

    @Test
    public void testMissingSemicolonShouldFail() throws IOException {
        String input =
                "int main() {\n" +
                        "    int x\n" +   // MISSING semicolon
                        "    x = 5;\n" +
                        "    return x;\n" +
                        "}\n";

        Parser parser = createParserFromString(input);
        parser.parse();

        // We expect at least 1 error for the missing semicolon after 'int x'
        assertTrue("Expected parse error for missing semicolon.",
                parser.getNumErrors() > 0);
    }
}