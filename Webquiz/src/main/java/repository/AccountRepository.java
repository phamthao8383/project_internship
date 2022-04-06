package repository;

import model.Account;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountRepository {

    private BaseRepository baseRepository = new BaseRepository();


    public boolean CheckLogIn(String userAccount, String password) {
        boolean isValid = false;
        try {
            String myQuery = "SELECT * FROM quiz_web.account where username = ? and password = ?";
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setString(1, userAccount);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()) {
                isValid = true;
            }
            else  {
                isValid = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isValid;
    }
}
