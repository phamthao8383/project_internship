package util;

import java.nio.charset.StandardCharsets;

public class HandleString {
    public HandleString() {
    }

    public String handleFont(String str){
        byte[] bytes = str.getBytes(StandardCharsets.ISO_8859_1);
        str = new String(bytes, StandardCharsets.UTF_8);
        return str.trim();
    }

    public String handleName(String str){
        str = str.trim().toLowerCase();
        char[] chars = str.toCharArray();
        chars[0] = Character.toUpperCase(chars[0]);
        int n = chars.length;
        for(int i = 1; i < chars.length; i++){
            if(chars[i] == ' ' && chars[i+1] == ' ') {
                for(int j = i; j < chars.length-1; j++) {
                    chars[j] = chars[j+1];
                }
                i--;
                n--;
            }
            else if(chars[i-1] == ' ' && chars[i] != ' ')
                chars[i] = Character.toUpperCase(chars[i]);
        }
        char newChars[] = new char[n];
        for(int i = 0; i < n; i++)
            newChars[i] = chars[i];
        str = String.valueOf(newChars);
        return str;
    }
}
