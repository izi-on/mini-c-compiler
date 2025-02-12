package sem;


import sem.error.AbstractError;
import util.CompilerPass;

/**
 * 
 * @author dhil
 * A base class providing basic error accumulation.
 */
public abstract class BaseSemanticAnalyzer extends CompilerPass {

	Scope scope = new Scope();
	public void withNewScope(Runnable r) {
		scope = new Scope(this.scope);
		r.run();
		this.scope = scope.getOuter();
	}

	protected void error(String message) {
		System.out.println("semantic error: " + message);
		incError();
	}
	protected void error(AbstractError error) {
		error(error.msg());
	}

}
