package gen;

import ast.ASTNode;
import ast.ClassDecl;
import ast.ClassType;
import gen.asm.AssemblyProgram;
import gen.asm.Directive;
import gen.asm.Label;
import gen.util.mem.context.MemContext;

import java.util.List;
import java.util.Map;

public class ClassCodeGen extends CodeGen {
   public ClassCodeGen(AssemblyProgram asmProg) {
      this.asmProg = asmProg;
   }

   public void visit(ASTNode n) {
      switch (n) {
          case ClassDecl cd -> {
              AssemblyProgram.DataSection ds = asmProg.dataSection;

              // for each method, create the function
              Map<String, List<Label>> virtualMap = MemContext.getVirtualMaps().get(cd.curClassType);
              cd.funDefs.forEach(funDef -> {
                    List<Label> labels = virtualMap.get(funDef.name);
                    Label label = labels.get(labels.size() - 1); // get the last label

                    System.out.println("Emitting " + label);

                    // create the function
                    new FunCodeGen(asmProg, label.name).visit(funDef);
                });

              // create the vtable
              Label vtableLabel = Label.create(cd.curClassType.name + "_vtable");
              MemContext.mapToVTable(cd.curClassType, vtableLabel);
              List<String> methods = MemContext.getVirtualMapMethodOrder(cd.curClassType);
              Map<String, List<Label>> virtualMapMetadata = MemContext.getVirtualMaps().get(cd.curClassType);

              ds.emit(vtableLabel); // emit the vtable label
              for (String method : methods) {
                  List<Label> labels = virtualMapMetadata.get(method);
                  Label label = labels.get(labels.size() - 1); // get the last label
                  ds.emit(new Directive("word " + label));
              }

          }

          default -> {
              n.children().forEach(this::visit);
          }
      }
  }
}

