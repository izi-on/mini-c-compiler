package lexer;

import java.util.HashMap;

class TrieNode {


    // Optionally store the character for debugging or tracing; not strictly required
    private Character c = null;

    // The token category for this node (only set if this node isEnd = true)
    private Token.Category tokenCategory = null;

    // Children in the trie
    private HashMap<Character, TrieNode> children = new HashMap<>();

    // Constructors
    TrieNode() {}
    TrieNode(Character c) {
        this.c = c;
    }

    public boolean canContinue(Character c) {
        return this.children.containsKey(c);
    }

    public boolean isEnd() {
        return tokenCategory != null;
    }

    public TrieNode traverse(Character c) {
        return this.children.get(c);
    }

    /**
     * Adds a path in the trie for the given string s, marking the last node with
     * the given token category.
     *
     * @param s        the string path to add (e.g., "==", "if", etc.)
     * @param category the token category for this path
     * @return         the last TrieNode for that path
     */
    public TrieNode addPath(String s, Token.Category category) {
        TrieNode current = this;
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            current.children.putIfAbsent(ch, new TrieNode(ch));
            current = current.children.get(ch);
        }
        current.tokenCategory = category;
        return current;
    }

    /**
     * Creates and returns the root of a Trie that contains
     * all known fixed tokens (operators, delimiters, keywords)
     * from the Token.Category enum.
     */
    public static TrieNode createRoot() {
        TrieNode root = new TrieNode();

        // Single-character operators/delimiters
        root.addPath("=", Token.Category.ASSIGN);
        root.addPath("{", Token.Category.LBRA);
        root.addPath("}", Token.Category.RBRA);
        root.addPath("(", Token.Category.LPAR);
        root.addPath(")", Token.Category.RPAR);
        root.addPath("[", Token.Category.LSBR);
        root.addPath("]", Token.Category.RSBR);
        root.addPath(";", Token.Category.SC);
        root.addPath(",", Token.Category.COMMA);
        root.addPath(".", Token.Category.DOT);
        root.addPath("+", Token.Category.PLUS);
        root.addPath("-", Token.Category.MINUS);
        root.addPath("*", Token.Category.ASTERISK);
        root.addPath("/", Token.Category.DIV);
        root.addPath("%", Token.Category.REM);
        root.addPath("&", Token.Category.AND);
        root.addPath("<", Token.Category.LT);
        root.addPath(">", Token.Category.GT);

        // Multi-character operators
        root.addPath("==", Token.Category.EQ);
        root.addPath("!=", Token.Category.NE);
        root.addPath("<=", Token.Category.LE);
        root.addPath(">=", Token.Category.GE);
        root.addPath("&&", Token.Category.LOGAND);
        root.addPath("||", Token.Category.LOGOR);

        // Keywords
        root.addPath("if", Token.Category.IF);
        root.addPath("else", Token.Category.ELSE);
        root.addPath("while", Token.Category.WHILE);
        root.addPath("return", Token.Category.RETURN);
        root.addPath("struct", Token.Category.STRUCT);
        root.addPath("sizeof", Token.Category.SIZEOF);
        root.addPath("continue", Token.Category.CONTINUE);
        root.addPath("break", Token.Category.BREAK);
        root.addPath("#include", Token.Category.INCLUDE);
        root.addPath("int", Token.Category.INT);
        root.addPath("void", Token.Category.VOID);
        root.addPath("char", Token.Category.CHAR);

        return root;
    }

    // Accessors
    public TrieNode getChild(Character ch) {
        return children.get(ch);
    }

    public boolean hasChild(Character ch) {
        return children.containsKey(ch);
    }

    public Token.Category getTokenCategory() {
        return tokenCategory;
    }
}