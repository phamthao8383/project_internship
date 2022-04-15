package util;

import org.apache.commons.codec.digest.DigestUtils;

public class PasswordEncryption {
    public String encrypt(String str){
        String md5Hex = DigestUtils.md5Hex(str).toUpperCase();
        return md5Hex;
    }
}
