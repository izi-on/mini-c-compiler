package sem;

import ast.*;

public class AllowedStmntAnalyzer extends BaseSemanticAnalyzer {
    private void checkIfInLoop() {
        if (scope.lookup(LoopSymbol.loopSymbolKey) == null) {
            error("continue statement not in loop");
        }
    }

   public void visit(ASTNode node) {
       switch (node) {

           case While w -> {
               withNewScope(() -> {
                    scope.put(new LoopSymbol(w));
                    visit(w.body);
               });
           }

           case Continue ctn -> {
               checkIfInLoop();
           }

           case Break brk -> {
               checkIfInLoop();
           }

           default -> {
               node.children().forEach(this::visit);
           }
       }
   }
}
