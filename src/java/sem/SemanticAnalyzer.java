package sem;

import gen.ImplicitThisParam;
import util.CompilerPass;

public class SemanticAnalyzer extends CompilerPass {
	
	public void analyze(ast.Program prog) {

		NameAnalyzer na = new NameAnalyzer();
		NameAnalyzer.addDummyFuncs(prog);
		na.visit(prog);
		this.numErrors += na.getNumErrors();
		if (this.numErrors > 0) return;

		TypeAnalyzer tc = new TypeAnalyzer();
		tc.visit(prog);
		this.numErrors += tc.getNumErrors();
		if (this.numErrors > 0) return;

		StructDeclLinker stdeclLinker = new StructDeclLinker(tc);
		stdeclLinker.visit(prog);
		this.numErrors += tc.getNumErrors();
		if (this.numErrors > 0) return;

		AllowedStmntAnalyzer asa = new AllowedStmntAnalyzer();
		asa.visit(prog);
		this.numErrors += asa.getNumErrors();
		if (this.numErrors > 0) return;
	}
}
