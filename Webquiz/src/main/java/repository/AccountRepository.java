package repository;

import model.Account;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class AccountRepository {

    private BaseRepository baseRepository = new BaseRepository();


    public Account CheckLogIn(String userAccount, String password) {
        Account account = new Account();
        try {
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
    public int CheckAccount(String userAccount) {
        int i = 0;
        try {
            String myQuery = "SELECT * FROM `account` where username = ? ";
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setString(1, userAccount);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                i=+1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
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
}
