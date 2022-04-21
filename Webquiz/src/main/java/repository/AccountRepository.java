package repository;

import model.Account;
import model.User;
import util.PasswordEncryption;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountRepository {

    private BaseRepository baseRepository = new BaseRepository();
    private PasswordEncryption passwordEncryption = new PasswordEncryption();


    public Account CheckLogIn(String userAccount, String password) {
        Account account = new Account();
        try {
            password = passwordEncryption.encrypt(password);
            String myQuery = "SELECT `account`.username, password, role_id  FROM `account` inner join user_role on `account`.username = user_role.username where `account`.username = ? and password = ?";
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setString(1, userAccount);
            preparedStatement.setString(2, password);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                account = new Account(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }
    public Account CheckAccount(String username) {
        Account account = new Account();
        try {
            String myQuery = "SELECT username FROM `account` where username = ?";
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                account = new Account(rs.getString(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

    public void AddAccount(Account account) {
        try {
            String myQuery = "insert into `account` value (?,?)";
            String queryRole = "insert into user_role value (?, 2)" ;
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setString(1, account.getUsername() );
            preparedStatement.setString(2, account.getPassword() );
            preparedStatement.executeUpdate();
            PreparedStatement preparedStatementRole = this.baseRepository.getConnection().prepareStatement(queryRole);
            preparedStatementRole.setString(1, account.getUsername() );
            preparedStatementRole.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editPassword(String ac, String ps) {
        try {
            String myQuery = "update account set password = ? where username = ?";
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setString(1, ps);
            preparedStatement.setString(2, ac);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
