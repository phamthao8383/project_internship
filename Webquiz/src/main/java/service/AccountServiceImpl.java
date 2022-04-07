package service;

import model.Account;
import repository.AccountRepository;

public class AccountServiceImpl implements AccountService {
    AccountRepository accountRepository = new AccountRepository();
    @Override
    public Account CheckLogIn(String userAccount, String password) {
        return accountRepository.CheckLogIn(userAccount, password);
    }
}
