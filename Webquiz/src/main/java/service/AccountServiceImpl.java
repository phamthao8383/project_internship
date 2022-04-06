package service;

import repository.AccountRepository;

public class AccountServiceImpl implements AccountService {
    AccountRepository accountRepository = new AccountRepository();
    @Override
    public boolean CheckLogIn(String userAccount, String password) {
        return accountRepository.CheckLogIn(userAccount, password);
    }
}
