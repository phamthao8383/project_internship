package repository;

import model.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberRepository {
    BaseRepository baseRepository = new BaseRepository();
    Connection connection = this.baseRepository.getConnection();

    public List<Member> getMaxPoint(){
        List<Member> memberList = new ArrayList<>();
        String sql = "Select distinct us.*, ap.accumulated_point from user us inner join " +
                "accumulated_point ap on us.user_id = ap.user_id\n" +
                "order by accumulated_point desc limit 5";
        try {
            int dem = 0;
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                double point = resultSet.getDouble("accumulated_point");
                int userId = resultSet.getInt("user_id");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String image = "";
                String account = resultSet.getString("username");
                Member member = new Member(userId, name, email, phone, address, image, account, point);
                memberList.add(member);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return memberList;
    }

    public List<Member> getMemberNumber(){
        List<Member> memberList = new ArrayList<>();
        String sql = "Select distinct us.*, ap.accumulated_point from user us left join " +
                "accumulated_point ap on us.user_id = ap.user_id";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                double point = resultSet.getDouble("accumulated_point");
                int userId = resultSet.getInt("user_id");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String image = "";
                String account = resultSet.getString("username");
                Member member = new Member(userId, name, email, phone, address, image, account, point);
                memberList.add(member);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return memberList;
    }
}
