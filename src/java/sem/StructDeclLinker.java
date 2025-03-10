package sem;

import ast.ASTNode;
import ast.StructType;
import ast.Type;

public class StructDeclLinker extends BaseSemanticAnalyzer {

    TypeAnalyzer ta;
    public StructDeclLinker(TypeAnalyzer ta) {
        this.ta = ta;
    }

    public void visit(ASTNode node) {
        switch (node) {
            case StructType st -> {
                StructTypeSymbol s = ta.getStruct(st.typeName);
                if (s == null) {
                    error("No struct declaration found for st: " + st.typeName);
                    return;
                }
                st.structTypeDecl = s.stdcl;
            }
           default -> {node.children().forEach(this::visit);}
        }
    }
}
