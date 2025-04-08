package sem;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

public class Scope {
	private Scope outer;
	private Map<String, Symbol> symbolTable = new HashMap<>();


	public Map<String, Symbol> getSymbolTable() {
		return Collections.unmodifiableMap(symbolTable);
	}
	public Scope(Scope outer) {
		this.outer = outer; 
	}

	public Scope() { this(null); }
	
	public Symbol lookup(String name) {
		Symbol cur = lookupCurrent(name);
		if (cur != null)
			return cur;
		return (outer != null) ? outer.lookup(name) : null;
	}

	public Symbol lookupCurrent(String name) {
		return symbolTable.getOrDefault(name, null);
	}
	
	public void put(Symbol sym) {
		symbolTable.put(sym.name, sym);
	}

	public Scope getOuter() {
		return outer;
	}

	public void setOuter(Scope outer) {
		this.outer = outer;
	}
}
