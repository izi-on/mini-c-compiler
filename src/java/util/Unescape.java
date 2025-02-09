package util;

import java.io.IOException;
import java.io.StringReader;
import java.util.Properties;

public class Unescape {
    public static void main(String[] args) {
        // Test string containing all of the escape sequences.
        // Note: In a Java source file, you must double-up the backslashes.
        String raw = "\\a\\b\\n\\r\\t\\\\\\'\\\"\\0";

        String unescaped = unescape(raw);

        System.out.println("Original: " + raw);
        System.out.println("Unescaped:");
        // For demonstration, print each character's code along with the unescaped string.
        for (char c : unescaped.toCharArray()) {
            System.out.printf("'%s' (code %d)%n", c, (int)c);
        }
    }

    public static String unescape(String s) {
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);

            // Look for a backslash that starts an escape sequence.
            if (c == '\\' && i + 1 < s.length()) {
                char next = s.charAt(i + 1);
                switch (next) {
                    case 'a':
                        // Alert (bell). In ASCII, bell is 7.
                        sb.append('\007');
                        i++; // Skip next character as it's part of the escape.
                        break;
                    case 'b':
                        sb.append('\b');
                        i++;
                        break;
                    case 'n':
                        sb.append('\n');
                        i++;
                        break;
                    case 'r':
                        sb.append('\r');
                        i++;
                        break;
                    case 't':
                        sb.append('\t');
                        i++;
                        break;
                    case '\\':
                        sb.append('\\');
                        i++;
                        break;
                    case '\'':
                        sb.append('\'');
                        i++;
                        break;
                    case '\"':
                        sb.append('\"');
                        i++;
                        break;
                    case '0':
                        sb.append('\0');
                        i++;
                        break;
                    default:
                        // If it's not one of the escape sequences, just append the backslash.
                        sb.append(c);
                        break;
                }
            } else {
                sb.append(c);
            }
        }

        return sb.toString();
    }
}