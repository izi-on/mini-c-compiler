package sem;

import ast.*;
import sem.error.DoubleDeclErr;
import sem.error.SymbolMismatchErr;
import sem.error.TypeMismatchErr;
import sem.error.UnexpectedTypeErr;

import java.util.*;
import java.util.concurrent.atomic.AtomicReference;

public class TypeAnalyzer extends BaseSemanticAnalyzer {

	private Type getCurrentFunctionType() {
		Symbol s = scope.lookup(CurrentFunctionTypeSymbol.prefix());
		if (s == null) {
			error("No current function type found in scope (are we in a function?)");
			return BaseType.UNKNOWN;
		}
		return ((TypeSymbol) s).type;

	}
	private void checkValidLValue(Expr expr) {
		if (expr instanceof ArrayAccessExpr)
			checkValidLValue(((ArrayAccessExpr) expr).array);
		else if (expr instanceof FieldAccessExpr)
			checkValidLValue(((FieldAccessExpr) expr).struct);
		else if (expr instanceof ValueAtExpr)
			checkValidLValue(((ValueAtExpr) expr).expr);
		else if (expr instanceof VarExpr)
			return;
		else
			error("Invalid lvalue");
	}
	private void withNewScope(List<VarDecl> params, Runnable r, CurrentFunctionTypeSymbol funcType) {
		scope = new Scope(scope);
		for (VarDecl var : params) {
			scope.put(new TypeSymbol(var.name, var.type));
		}
		scope.put(funcType);
		r.run();
		scope = scope.getOuter();
	}

	// have a separate get method for structs because they have their own namespace for lookups and other identifiers should not intersect with them
	public StructTypeSymbol getStruct(String structName) {
		Symbol s = scope.lookup(StructTypeSymbol.prefix() + structName);
		return (StructTypeSymbol) s;
	}

	private void setStruct(StructTypeSymbol struct) {
		scope.put(struct);
	}

	// Helper: checks that the looked-up symbol is a type symbol.
	private boolean isValidTypeSymbol(Symbol s) {
		if (s == null)
			error(new SymbolMismatchErr(new TypeSymbol("unknown", BaseType.UNKNOWN), new NullSymbol()));
		else if (!(s instanceof TypeSymbol))
			error(new SymbolMismatchErr(new TypeSymbol("unknown", BaseType.UNKNOWN), s));
		return s instanceof TypeSymbol;
	}
	private boolean isValidTypeSymbol(Symbol s, String name) {
		if (s == null)
			error(new SymbolMismatchErr(new TypeSymbol("unknown", BaseType.UNKNOWN), new NullSymbol(name)));
		else if (!(s instanceof TypeSymbol))
			error(new SymbolMismatchErr(new TypeSymbol("unknown", BaseType.UNKNOWN), s));
		return s instanceof TypeSymbol;
	}

	/*
	 * Helper function to check if a struct type is recursively defined in a struct field.
	 */
	private boolean checkForRecursiveStructPointer(Type curType, String structName) {
		if (curType instanceof PointerType) { // if pointerized, ok
			return false;
		} else if (curType instanceof ArrayType) {
			return checkForRecursiveStructPointer(((ArrayType) curType).arrayedType, structName);
		} else if (curType instanceof StructType) {
			return ((StructType) curType).typeName.equals(structName);
		} else {
			return false;
		}
	}

	/**
	 * Recursively visit an AST node and determine its type.
	 * For expressions the type is the type that will be used by later passes.
	 */
	public Type visit(ASTNode node) {
		return switch(node) {
			case null -> throw new IllegalStateException("Unexpected null value");

			// --- Statements ---
			case Block b -> {
				withNewScope(() -> {
					handleBlockVisit(b, this::visit);
				});
				yield BaseType.NONE;
			}

			// --- Function declarations and definitions ---
			case FunDecl fd -> {
				// Build an aggregate type: [return type, param type1, param type2, ...]
				List<Type> types = new ArrayList<>();
				types.add(visit(fd.type));
				for (VarDecl param : fd.params) {
					types.add(visit(param.type));
				}
				Type funcType = new AggregateType(types);
				scope.put(new TypeSymbol(fd.name, funcType));
				yield funcType;
			}
			case FunDef fd -> {
				List<Type> types = new ArrayList<>();
				types.add(visit(fd.type));
				for (VarDecl param : fd.params) {
					types.add(visit(param.type));
				}
				Type funcType = new AggregateType(types);
				scope.put(new TypeSymbol(fd.name, funcType));

				withNewScope(fd.params, () -> {
					handleBlockVisit(fd.block, this::visit);
				}, new CurrentFunctionTypeSymbol(funcType));
				yield funcType;
			}

			// --- Program ---
			case Program p -> {
				// Visit all declarations (which will, in turn, add the function, variable, and struct types to the symbol table)
				for (Decl d : p.decls) {
					visit(d);
				}
				yield BaseType.NONE;
			}

			// --- Variable declaration ---
			case VarDecl vd -> {
				if (vd.type.equals(BaseType.VOID))
					error(new UnexpectedTypeErr(vd.type));
				Type type = visit(vd.type);
				scope.put(new TypeSymbol(vd.name, type));
				yield type;
			}

			// --- Literals ---
			case IntLiteral i -> {i.type = BaseType.INT ;yield BaseType.INT;}
			case StrLiteral s -> {Type type = new ArrayType(BaseType.CHAR, s.value.length() + 1); s.type = type ; yield type;}
			case ChrLiteral c -> {c.type = BaseType.CHAR; yield BaseType.CHAR;}

			// --- Struct declaration ---
			case StructTypeDecl std -> {
				// check if not double decl for struct
				if (getStruct(std.name) != null) {
					error(new DoubleDeclErr(std));
					yield BaseType.UNKNOWN;
				}
				AtomicReference<Scope> structScope = new AtomicReference<>();
				withNewScope(() -> {
					// Type-check each field
					for (VarDecl field : std.varDecls) {
						Type fieldType = visit(field);
						if (fieldType.equals(BaseType.VOID)) {
							error(new UnexpectedTypeErr(fieldType));
						}
						if (checkForRecursiveStructPointer(fieldType, std.name))
							error("Recursive struct pointer detected for field: " + field.name + ", please use a pointer type instead.");
					}
					structScope.set(getScope()); // capture the scope for which the struct was declared.
				});
				StructType structType = new StructType(std.name);
				structType.structTypeDecl = std;
				std.type = structType;
				setStruct(new StructTypeSymbol(std, structType, structScope.get()));
				yield structType;
			}

			// --- Variable usage ---
			case VarExpr v -> {
				Symbol s = scope.lookup(v.name);
				if (!isValidTypeSymbol(s)) {
					yield BaseType.UNKNOWN;
				}
				v.type = ((TypeSymbol) s).type;
				yield v.type;
			}

			// --- Function call ---
			case FunCallExpr f -> {
				Symbol s = scope.lookup(f.name);
				if (!isValidTypeSymbol(s)) {
					f.type = BaseType.UNKNOWN;
					yield BaseType.UNKNOWN;
				}
				// Retrieve the function type (an AggregateType: [return type, param types...])
				Type funcType = ((TypeSymbol) s).type;
				if (!(funcType instanceof AggregateType)) {
					error(new UnexpectedTypeErr(funcType));
					f.type = BaseType.UNKNOWN;
					yield BaseType.UNKNOWN;
				}
				AggregateType agg = (AggregateType) funcType;

				Type returnType = agg.types.get(0);
				AggregateType paramTypesAgg = new AggregateType(agg.types.subList(1, agg.types.size()));
				AggregateType argsTypesAgg = new AggregateType(f.args.stream().map(this::visit).toList());

				// Check if the args match the param types
				if (!paramTypesAgg.equals(argsTypesAgg)) {
					error(new TypeMismatchErr(paramTypesAgg, argsTypesAgg));
				}
				f.type = returnType;
				yield returnType;
			}

			// --- Binary operators ---
			case BinOp binop -> {
				Type left = visit(binop.lhs);
				Type right = visit(binop.rhs);
				Type binOpType = switch (binop.op) {
					// For arithmetic and relational operators, both operands must be int.
					case ADD, SUB, MUL, DIV, MOD, LT, GT, LE, GE, OR, AND -> {
						if (!left.equals(BaseType.INT) || !right.equals(BaseType.INT)) {
							error(new UnexpectedTypeErr(left));
						}
						yield BaseType.INT;
					}
					// For equality operators, the operands must have the same type (and cannot be struct, array, or void)
					case EQ, NE -> {
						if (left instanceof StructType
								|| left instanceof ArrayType
								|| left.equals(BaseType.VOID)
								|| !left.equals(right)) {
							error(new UnexpectedTypeErr(left));
						}
						yield BaseType.INT;
					}
				};
				binop.type = binOpType;
				yield binOpType;
			}

			// --- Assignment ---
			case Assign a -> {
				Type lhsType = visit(a.lhs);
				if (lhsType.equals(BaseType.VOID) || lhsType instanceof ArrayType) {
					error(new UnexpectedTypeErr(lhsType));
				}
				checkValidLValue(a.lhs);
				Type rhsType = visit(a.rhs);
				if (!lhsType.equals(rhsType)) {
					error(new UnexpectedTypeErr(rhsType));
				}
				yield lhsType;
			}

			// --- Type cast ---
			case TypecastExpr tc -> {
				Type exprType = visit(tc.expr);
				Type castType = visit(tc.typeToCastTo);
				Type finalType = null;
				if (castType.equals(BaseType.INT) && exprType.equals(BaseType.CHAR)) { // cast from char to int
					finalType = BaseType.INT;
				} else if (castType instanceof PointerType && exprType instanceof ArrayType) {
					Type elemTypeInPtr = ((PointerType) castType).pointerizedType;
					Type elemTypeInArr = ((ArrayType) exprType).arrayedType;
					if (!elemTypeInPtr.equals(elemTypeInArr)) {
						error(new UnexpectedTypeErr(elemTypeInPtr));
					}
					finalType = castType;
				} else if (castType instanceof PointerType && exprType instanceof PointerType) {
					finalType = castType;
				} else if (finalType == null) {
					error(new UnexpectedTypeErr(castType));
					finalType = castType;
				}
				tc.type = finalType;
				yield finalType;
			}

			// --- sizeof expression ---
			case SizeOfExpr se -> {
				visit(se.sizeOfType);
				se.type = BaseType.INT;
				yield BaseType.INT;
			}

			// --- Pointer dereference ---
			case ValueAtExpr va -> {
				Type exprType = visit(va.expr);
				if (!(exprType instanceof PointerType)) {
					error(new UnexpectedTypeErr(exprType));
					yield BaseType.UNKNOWN;
				} else {
					Type res = ((PointerType) exprType).pointerizedType;
					va.type = res;
					yield res;
				}
			}

			// --- Address-of expression ---
			case AddressOfExpr aa -> {
				Type exprType = visit(aa.expr);
				checkValidLValue(aa.expr);
				Type res = new PointerType(exprType);
				aa.type = res;
				yield res;
			}

			case ArrayAccessExpr aa -> {
				Type arrayType = visit(aa.array);
				Type indexType = visit(aa.index);
				if (!indexType.equals(BaseType.INT))
					error(new UnexpectedTypeErr(indexType));
				Type accessType;
				if (arrayType instanceof ArrayType) {
					accessType = ((ArrayType) arrayType).arrayedType;
				} else if (arrayType instanceof PointerType) {
					accessType = ((PointerType) arrayType).pointerizedType;
				} else {
					error(new UnexpectedTypeErr(arrayType));
					accessType = BaseType.UNKNOWN;
				}
				aa.type = accessType;
				yield accessType;
			}

			// --- Field access (e.g. e.field) ---
			case FieldAccessExpr fa -> {
				Type exprType = visit(fa.struct);
				if (!(exprType instanceof StructType)) {
					error(new UnexpectedTypeErr(exprType));
					yield BaseType.UNKNOWN;
				}
				StructType structType = (StructType) exprType;
				StructTypeSymbol structSymbol = (StructTypeSymbol) getStruct(structType.typeName);
				if (structSymbol == null) {
					error(new SymbolMismatchErr(structSymbol, new NullSymbol()));
					yield BaseType.UNKNOWN;
				}

				// check if field is present in the struct scope and get its type
				Scope structScope = structSymbol.declScope;
				TypeSymbol fieldSymbol = (TypeSymbol) structScope.lookupCurrent(fa.field);
				if (fieldSymbol == null) {
					error(new SymbolMismatchErr(new TypeSymbol(fa.field, BaseType.UNKNOWN), new NullSymbol()));
					yield BaseType.UNKNOWN;
				}
				fa.type = fieldSymbol.type;
				yield fieldSymbol.type;
			}

			case While w -> {
				Type condType = visit(w.cond);
				if (!condType.equals(BaseType.INT)) {
					error(new UnexpectedTypeErr(condType));
				}
				withNewScope(() -> {
					visit(w.body);
				});
				yield BaseType.NONE;
			}

			case If i -> {
				Type condType = visit(i.condition);
				if (!condType.equals(BaseType.INT)) {
					error(new UnexpectedTypeErr(condType));
				}
				withNewScope(() -> {
					visit(i.thenStmt);
				});
				withNewScope(() -> {
					i.elseStmt.ifPresent(this::visit);
				});
				yield BaseType.NONE;
			}

			case Return r -> {
				Type typeOfSymbol = getCurrentFunctionType();
				if (!(typeOfSymbol instanceof AggregateType)) {
					error(new UnexpectedTypeErr(typeOfSymbol));
					yield BaseType.NONE;
				}
				AggregateType funcSymbType = (AggregateType) typeOfSymbol;
				Type returnType = funcSymbType.types.get(0);

				if (returnType.equals(BaseType.VOID) && r.expr.isPresent()) {
					error("returning a value from a void function");
					yield BaseType.NONE;
				} else if (!returnType.equals(BaseType.VOID) && r.expr.isEmpty()) {
					error("returning nothing from a non-void function");
					yield BaseType.NONE;
				}

				r.expr.ifPresent(e -> {
					Type exprType = visit(e);
					if (!returnType.equals(exprType)) {
						error("Expected return type " + returnType + " but got " + exprType);
					}
				});
				yield BaseType.NONE;
			}

			// for struct types, ensure that the struct is declared previously
			case StructType st -> {
				StructTypeSymbol s = getStruct(st.typeName);
				if (!isValidTypeSymbol(s, st.typeName)) {
					yield BaseType.UNKNOWN;
				}
				yield st;
			}

			case Type t -> {yield t;}

			default -> {
				node.children().forEach(this::visit);
				yield BaseType.NONE;
			}
		};
	}
}