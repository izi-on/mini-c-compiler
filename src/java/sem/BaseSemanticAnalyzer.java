package sem;


import ast.ASTNode;
import ast.Block;
import org.junit.platform.engine.TestDescriptor;
import sem.error.AbstractError;
import util.CompilerPass;

import java.util.stream.Stream;

/**
 * 
 * @author dhil
 * A base class providing basic error accumulation.
 */
public abstract class BaseSemanticAnalyzer extends CompilerPass {
	@FunctionalInterface
	interface Visitor {
		void visit(ASTNode node);
	}

	Scope scope = new Scope();
	public Scope getScope() {
		return scope;
	}
	public void withNewScope(Runnable r) {
		scope = new Scope(this.scope);
		r.run();
		this.scope = scope.getOuter();
	}

	void handleBlockVisit(Block b, Visitor visitor) {
		Stream.concat(b.vds.stream(), b.stmts.stream()).forEach(visitor::visit);
	}


	protected void error(String message) {
		System.out.println("semantic error: " + message);
		incError();
	}
	protected void error(AbstractError error) {
		error(error.msg());
//		throw new RuntimeException("stop");
	}

}
