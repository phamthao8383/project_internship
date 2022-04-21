package service.impl;

import model.Account;
import repository.AccountRepository;
import service.AccountService;

import java.util.List;

public class AccountServiceImpl implements AccountService {
    AccountRepository accountRepository = new AccountRepository();
    @Override
    public Account CheckLogIn(String userAccount, String password) {
        return accountRepository.CheckLogIn(userAccount, password);
    }

    @Override
    public Account CheckAccount(String username) {
        return accountRepository.CheckAccount(username);
    }

    @Override
    public void AddAccount(Account account) {
        accountRepository.AddAccount(account);
    }

    @Override
    public void editPassword(String ac, String ps) {
        accountRepository.editPassword(ac,ps);
    }
}
