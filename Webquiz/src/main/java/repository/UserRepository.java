package repository;

import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository {
    private BaseRepository baseRepository = new BaseRepository();

    public List<User> getUserList() {
        List<User> users = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement("SELECT * FROM quiz_web.user");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                users.add(new User(rs.getInt("user_id"),
                                    rs.getString("name"),
                                    rs.getString("email"),
                                    rs.getString("phone"),
                                    rs.getString("address"),
                                    rs.getString("image"),
                                    rs.getString("username")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

   /* public List<Customer> getCustomerListPage(int pageIndex, int pageSize) {
        List<Customer> customerList = new ArrayList<>();
        try {
            String queryListPage = "with x as(SELECT *, row_number() over (order by ma_khach_hang asc) as r  from khach_hang )\n" +
                    "select  * from x where  r between  ((? * ? ) - ? + 1) and ? * ?";
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(queryListPage);
            preparedStatement.setInt(1, pageIndex);
            preparedStatement.setInt(2 ,pageSize);
            preparedStatement.setInt(3, pageSize);
            preparedStatement.setInt(4, pageIndex);
            preparedStatement.setInt(5, pageSize);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                customerList.add(new Customer(  rs.getInt(1),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(6),
                        rs.getString(5),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(2),
                        rs.getString(9)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }*/

    public Integer getIdMax() {
        int id = 0;
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement("SELECT Max(user_id) FROM quiz_web.user ");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    public User getUserId(int id) {
        User user = new User();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement("SELECT * FROM `user` WHERE user_id = ?");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                user = (new User(rs.getInt("user_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("image"),
                        rs.getString("username")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public void addUserList(User user) {
        try {
            String queryInsert = "insert into `user` value(?,?,?,?,?,?,?)";
            PreparedStatement preparedStatement = this.baseRepository
                    .getConnection()
                    .prepareStatement(queryInsert);
            preparedStatement.setInt(1,user.getUserId());
            preparedStatement.setString(2,user.getName());
            preparedStatement.setString(3,user.getEmail());
            preparedStatement.setString(4,user.getPhone());
            preparedStatement.setString(5,user.getAddress());
            preparedStatement.setString(6,user.getImage());
            preparedStatement.setString(7,user.getAccount());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUserId(User user) {
        try {
            String queryUpdate ="UPDATE `user` SET `name` = ? , email = ?  , phone = ? , address = ? , image = ? , username = ? WHERE user_id = ?" ;
            PreparedStatement preparedStatement = this.baseRepository
                    .getConnection().prepareStatement(queryUpdate);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getPhone());
            preparedStatement.setString(4,user.getAddress());
            preparedStatement.setString(5,user.getImage());
            preparedStatement.setString(6,user.getAccount());
            preparedStatement.setInt(7,user.getUserId());
            int row = preparedStatement.executeUpdate();
            if(row > 0) {
                System.out.println("Update thành công!!");
            } else {
                System.out.println("Lỗi ở updateUser ");
            }

        } catch (SQLException e) {
            System.out.println("lỗi rồi. không update được");
            e.printStackTrace();

        }
    }

    public void deleteUser (int id) {
        try {
            PreparedStatement preparedStatement = this.baseRepository
                    .getConnection().prepareStatement("Delete FROM `user` where user_id = ? ");
            preparedStatement.setInt(1, id);
            int row = preparedStatement.executeUpdate();
            System.out.println(row);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //    phân trang
    /*public int count() {
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement("SELECT count(*) FROM khach_hang");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }*/

    public static void main(String[] args) {
        List<User> d = new UserRepository().getUserList();
        for (User u: d
             ) {
            System.out.println(u);

        }

    }
}
