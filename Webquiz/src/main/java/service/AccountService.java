package service;

import model.Account;

import java.util.List;

public interface AccountService {
    public Account CheckLogIn(String userAccount, String password);
//    public List<Account> CheckAccount(String username);
    public int CheckAccount2(String username);
    public void AddAccount(Account account);
    public void editPassword(String ac, String ps);
}
