package service;

import model.Account;

public interface AccountService {
    public Account CheckLogIn(String userAccount, String password);
}
