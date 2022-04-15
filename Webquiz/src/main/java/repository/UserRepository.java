package repository;

import model.Exam;
import model.ExamHistory;
import model.Subject;
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

    public List<ExamHistory> getListExamHistory(int id) {
        List<ExamHistory> examHistoryList = new ArrayList<>();
        ExamHistory examHistory = new ExamHistory();
        try {
            String myQuery = "SELECT * \n" +
                    "FROM quiz_web.assignment \n" +
                    "inner join `user` on `user`.user_id  = assignment.user_id\n" +
                    "inner join exam on exam.exam_id = assignment.exam_id\n" +
                    "inner join `subject` on subject.subject_id = exam.subject_id\n" +
                    "where  assignment.user_id = ?";
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                examHistory = new ExamHistory(rs.getInt("exam_id"),
                                                rs.getInt("user_id"),
                                                new Exam(rs.getInt("exam_id"),
                                                        new Subject(rs.getInt("subject_id")
                                                                ,rs.getString("subject_name"))
                                                        ,rs.getString("allowed_time")
                                                        ,rs.getString("exam_name")),
                                                rs.getTime("starting_time"),
                                                rs.getTime("completion_time"),
                                                rs.getDouble("point"));
                examHistoryList.add(examHistory);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return examHistoryList;
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

    public User getUserAccount(String accountName) {
        User user = new User();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement("SELECT * FROM `user` WHERE username = ?");
            preparedStatement.setString(1, accountName);
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
            String queryInsert = "insert into `user` (name, email, phone, address, image, username) value(?,?,?,?,?,?)";
            PreparedStatement preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement(queryInsert);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getPhone());
            preparedStatement.setString(4,user.getAddress());
            preparedStatement.setString(5,user.getImage());
            preparedStatement.setString(6,user.getAccount());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUserId(User user) {
        try {
            String queryUpdate ="UPDATE `user` SET `name` = ? , email = ?  , phone = ? , address = ? WHERE user_id = ?" ;
            PreparedStatement preparedStatement = this.baseRepository
                    .getConnection().prepareStatement(queryUpdate);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getPhone());
            preparedStatement.setString(4,user.getAddress());
            preparedStatement.setInt(5,user.getUserId());
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
