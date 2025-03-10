package sem;

import util.CompilerPass;

public class SemanticAnalyzer extends CompilerPass {
	
	public void analyze(ast.Program prog) {

		NameAnalyzer na = new NameAnalyzer();
		NameAnalyzer.addDummyFuncs(prog);
		na.visit(prog);
		this.numErrors += na.getNumErrors();

		TypeAnalyzer tc = new TypeAnalyzer();
		tc.visit(prog);
		this.numErrors += tc.getNumErrors();

		StructDeclLinker stdeclLinker = new StructDeclLinker(tc);
		stdeclLinker.visit(prog);
		this.numErrors += tc.getNumErrors();

		AllowedStmntAnalyzer asa = new AllowedStmntAnalyzer();
		asa.visit(prog);
		this.numErrors += asa.getNumErrors();
	}
}
