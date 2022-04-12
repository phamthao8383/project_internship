package service.impl;

import model.Account;
import repository.AccountRepository;
import service.AccountService;

public class AccountServiceImpl implements AccountService {
    AccountRepository accountRepository = new AccountRepository();
    @Override
    public Account CheckLogIn(String userAccount, String password) {
        return accountRepository.CheckLogIn(userAccount, password);
    }

    @Override
    public int CheckAccount(String userAccount) {
        return accountRepository.CheckAccount(userAccount);
    }
}
