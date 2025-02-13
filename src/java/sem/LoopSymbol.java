package sem;

import ast.While;

public class LoopSymbol extends Symbol {
    While loop;
    public LoopSymbol(While loop) {
        super(loopSymbolKey);
        this.loop = loop;
    }

    public static String loopSymbolKey = "loop";
}
