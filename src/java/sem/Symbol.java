package sem;

public abstract class Symbol {
	public String name;
	

	public Symbol() {} // for error reporting purposes
	public Symbol(String name) {
		this.name = name;
	}
}
