package sem;

import ast.*;
import sem.error.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class NameAnalyzer extends BaseSemanticAnalyzer {

	public static void addDummyFuncs(Program prog) {
		// Create an empty block (with no declarations and no statements)
		Block emptyBlock = new Block(new ArrayList<>(), new ArrayList<>());

		// Built-in: void print_s(char* s);
		prog.decls.add(0, new FunDef(
				BaseType.VOID,
				"print_s",
				List.of(new VarDecl(new PointerType(BaseType.CHAR), "s")),
				emptyBlock,
				true
		));

		// Built-in: void print_i(int i);
		prog.decls.add(0, new FunDef(
				BaseType.VOID,
				"print_i",
				List.of(new VarDecl(BaseType.INT, "i")),
				emptyBlock, true
		));

		// Built-in: void print_c(char c);
		prog.decls.add(0, new FunDef(
				BaseType.VOID,
				"print_c",
				List.of(new VarDecl(BaseType.CHAR, "c")),
				emptyBlock, true
		));

		// Built-in: char read_c();
		prog.decls.add(0, new FunDef(
				BaseType.CHAR,
				"read_c",
				List.of(),
				emptyBlock, true
		));

		// Built-in: int read_i();
		prog.decls.add(0, new FunDef(
				BaseType.INT,
				"read_i",
				List.of(),
				emptyBlock, true
		));

		// Built-in: void* mcmalloc(int size);
		prog.decls.add(0, new FunDef(
				new PointerType(BaseType.VOID),
				"mcmalloc",
				List.of(new VarDecl(BaseType.INT, "size")),
				emptyBlock, true
		));
	}

	private boolean checkNotReDecl(Decl decl) {
		if (scope.lookupCurrent(decl.name) != null) {
			error(new DoubleDeclErr(decl));
			return false;
		}
		return true;
	}

	private void checkIfFuncDeclHasDef() {
		for (Symbol s : scope.getSymbolTable().values()) {
			if (s instanceof FunctionSymbol) {
				FunctionSymbol fs = (FunctionSymbol) s;
				if (fs.funDecl != null && fs.funDef == null) {
					error(new DoubleDeclErr(fs.funDecl));
				}
			}
		}
	}

	public void withNewScope(Runnable r) {
		super.withNewScope(() -> {
			r.run();
			checkIfFuncDeclHasDef();
		});
	}

	public void withNewScope(List<VarDecl> params, Runnable r) {
		super.withNewScope(() -> {
			for (VarDecl vd : params) {
				scope.put(new VariableSymbol(vd.name, vd));
			}
			r.run();
			checkIfFuncDeclHasDef();
		});
	}

	private void handleBlockVisit(Block b) {
		Stream.concat(b.vds.stream(), b.stmts.stream()).forEach(this::visit);
	}

	public void visit(ASTNode node) {
		switch(node) {
			case null -> {
				throw new IllegalStateException("Unexpected null value");
			}

			case Block b -> {
				// create a scope for the block
				withNewScope(() -> {
					handleBlockVisit(b);
				});
			}

			case FunDecl fd -> {
				Symbol symb = scope.lookupCurrent(fd.name);

				// if new, put in symbol table
				if (symb == null) {
					scope.put(new FunctionSymbol(fd.name, fd));
				} else if (!(symb instanceof FunctionSymbol)) { // check if the symbol is a function symbol
					error(new DoubleDeclErr(fd));
					return;
				} else {
					FunctionSymbol fs = (FunctionSymbol) symb;
					if (fs.funDecl != null) { // fundecl already exists
						error(new DoubleDeclErr(fd));
						return;
					}
					fs.funDecl = fd;

					// if the function symbol has a definition, ensure that the definition and declaration match
					if (fs.funDef != null && !fs.funDef.equals(fs.funDecl)) {
						error(new TypeMismatchErr(fs.funDef, fs.funDecl));
						return;
					}
				}
			}

			case FunDef fd -> {
				Symbol symb = scope.lookupCurrent(fd.name);

				// if new, put in symbol table
				if (symb == null) {
					scope.put(new FunctionSymbol(fd.name, fd));
				} else if (!(symb instanceof FunctionSymbol)) { // check if the symbol is a function symbol
					error(new DoubleDeclErr(fd));
					return;
				} else {
					FunctionSymbol fs = (FunctionSymbol) symb;
					if (fs.funDef != null) {
						error(new DoubleDeclErr(fd));
						return;
					}
					fs.funDef = fd;

					// if the function symbol has a declaration, ensure that the definition and declaration match
					if (fs.funDecl != null && !fs.funDef.equals(fs.funDecl)) {
						error(new TypeMismatchErr(fs.funDef, fs.funDecl));
						return;
					}
				}
				withNewScope(fd.params ,() -> {
					handleBlockVisit(fd.block); // if we visit the params are in a parent scope, we want same scope
				});
			}

			case Program p -> {
				withNewScope(() -> { // this force the fun decl and fun def check
					p.decls.forEach(this::visit);
				});
			}

			case VarDecl vd -> {
				if (checkNotReDecl(vd)) {
					scope.put(new VariableSymbol(vd.name, vd));
				}
			}

			case VarExpr v -> {
				Symbol sym = scope.lookup(v.name);
				if (sym == null) {
					error(new UndeclaredVarErr(v));
					return;
				}
				else if (!(sym instanceof VariableSymbol)) {
					error(new SymbolMismatchErr(new VariableSymbol(), sym));
					return;
				}
				VariableSymbol vSym = (VariableSymbol) sym;
				v.vd = vSym.node;
			}

			case FunCallExpr f -> {
				Symbol sym = scope.lookup(f.name);
				if (sym == null) {
					error(new UndeclaredFuncErr(new FunCallExpr(f.name, new ArrayList<>())));
					return;
				}
				else if (!(sym instanceof FunctionSymbol)) {
					error(new SymbolMismatchErr(new FunctionSymbol(), sym));
					return;
				}
				FunctionSymbol fSym = (FunctionSymbol) sym;
				f.fd = fSym.funDef;
			}

			case StructTypeDecl std -> {
				withNewScope(() -> {
					std.varDecls.forEach(this::visit);
				});
			}

			default -> {
				node.children().forEach(this::visit);
			}
        };
	}
}
