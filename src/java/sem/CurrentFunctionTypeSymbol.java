package sem;

import ast.Type;

public class CurrentFunctionTypeSymbol extends TypeSymbol {
    public CurrentFunctionTypeSymbol(Type type) {
        super(CurrentFunctionTypeSymbol.prefix(), type);
    }
    public static String prefix() {return "currentFunctionType%";}
}
