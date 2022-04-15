package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {
    private String jdbcUrl = "jdbc:mysql://localhost:3306/quiz_web?autoReconnect=true&useSSL=false";
    private String username = "root";
    // Thêm mật khẩu root mysql vào dưới
    private String password = "12345";
    private Connection connection;

    public BaseRepository() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = DriverManager.getConnection(jdbcUrl, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    public Connection getConnection() {
        return connection;
    }

    public static void main(String[] args) {

    }
}
