package repository;

import com.sun.org.apache.xerces.internal.impl.XMLEntityManager;
import model.Exam;
import model.ExamHistory;
import model.Subject;
import model.User;

import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.swing.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private Connection connection = this.baseRepository.getConnection();

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
                                                rs.getString("starting_time"),
                                                rs.getString("completion_time"),
                                                rs.getInt("point"));
                examHistoryList.add(examHistory);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return examHistoryList;
    }



    public List<ExamHistory> getListExamHistoryPage(int id, int pageIndex, int pageSize) {
        List<ExamHistory> examHistoryList = new ArrayList<>();
        ExamHistory examHistory = new ExamHistory();
        try {
            String myQuery = " with x as(SELECT exam.exam_id,user.user_id,subject.subject_id,subject.subject_name, starting_time, completion_time, point, allowed_time, exam.exam_name, row_number() over (order by assignment_id asc) as r \n" +
                    "                    FROM quiz_web.assignment\n" +
                    "                    inner join `user` on `user`.user_id  = assignment.user_id\n" +
                    "                    inner join exam on exam.exam_id = assignment.exam_id\n" +
                    "                    inner join `subject` on subject.subject_id = exam.subject_id\n" +
                    "                    where  assignment.user_id = ?)\n" +
                    "                    select  * from x where  r between  ((? * ? ) - ? + 1) and ? * ?";
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setInt(1, id);
            preparedStatement.setInt(2, pageIndex);
            preparedStatement.setInt(3 ,pageSize);
            preparedStatement.setInt(4, pageSize);
            preparedStatement.setInt(5, pageIndex);
            preparedStatement.setInt(6, pageSize);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                examHistory = new ExamHistory(rs.getInt("exam_id"),
                        rs.getInt("user_id"),
                        new Exam(rs.getInt("exam_id"),
                                new Subject(rs.getInt("subject_id")
                                        ,rs.getString("subject_name"))
                                ,rs.getString("allowed_time")
                                ,rs.getString("exam_name")),
                        rs.getString("starting_time"),
                        rs.getString("completion_time"),
                        rs.getInt("point"));
                examHistoryList.add(examHistory);
            }
        } catch (SQLException e) {
            System.out.println("sai rồi");
            e.printStackTrace();
        }
        return examHistoryList;
    }

//    đếm số lịch sử thi
    public int countHistory(int id) {
        try {
            String myQuery = "with x as(SELECT assignment_id FROM quiz_web.assignment inner join `user` on `user`.user_id  = assignment.user_id \n" +
                    "                    inner join exam on exam.exam_id = assignment.exam_id\n" +
                    "                    inner join `subject` on subject.subject_id = exam.subject_id\n" +
                    "                    where  assignment.user_id = ?) select  count(*) from x";
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setInt(1, id);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
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
            String insertUser = "insert into `user` (name, email, phone, address, image, username) value(?,?,?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertUser);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getPhone());
            preparedStatement.setString(4,user.getAddress());
            preparedStatement.setString(5,"admin_profile.svg");
            preparedStatement.setString(6,user.getAccount());
            preparedStatement.executeUpdate();
            String insertAccumulated = "insert into accumulated_point (user_id, accumulated_point) values ((select user_id from `user` where username = ?), 0)";
            preparedStatement = connection.prepareStatement(insertAccumulated);
            preparedStatement.setString(1, user.getAccount());
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

    public void updateImageUserId(int id , String image) {
        try {
            String queryUpdate ="UPDATE `user` SET image = ?  WHERE user_id = ?" ;
            PreparedStatement preparedStatement = this.baseRepository
                    .getConnection().prepareStatement(queryUpdate);
            preparedStatement.setString(1,image);
            preparedStatement.setInt(2,id);
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

}
