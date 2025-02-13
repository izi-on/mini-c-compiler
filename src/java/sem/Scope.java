package sem;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

public class Scope {
	private Scope outer;
	private Map<String, Symbol> symbolTable = new HashMap<>();

	private Map<String, String> metadata = new HashMap<>(); // useful for knowing the return type of the current function scope

	public Map<String, Symbol> getSymbolTable() {
		return Collections.unmodifiableMap(symbolTable);
	}
	public void setMetadata(Map<String, String> metadata) {
		this.metadata = metadata;
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

	public Optional<String> lookupMetadata(String name) {
		String res = metadata.getOrDefault(name, null);
		if (res != null)
			return Optional.of(res);
		return (outer != null) ? outer.lookupMetadata(name) : Optional.empty();
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
}
