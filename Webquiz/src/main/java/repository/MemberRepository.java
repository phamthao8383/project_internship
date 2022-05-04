package repository;

import model.Member;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MemberRepository {
    BaseRepository baseRepository = new BaseRepository();
    Connection connection = this.baseRepository.getConnection();
    private final int entryDisplay = BaseRepository.entryDisplay;

    public List<Member> getMemberList(int indexPage){
        List<Member> members = new ArrayList<>();
        String sql = "SELECT distinct u.user_id, u.username, `name`, email, address, phone, image, ap.accumulated_point, ur.role_id\n" +
                "from accumulated_point ap\n" +
                "right join `user` u on u.user_id = ap.user_id\n" +
                "inner join user_role ur on ur.username = u.username\n" +
                "order by u.user_id\n" +
                "limit ?, ?;";  // Phân trang bảng Thành viên, bắt đầu từ index (?) hiển thị (?) Thành viên.

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, (indexPage-1)* entryDisplay);
            preparedStatement.setInt(2, entryDisplay);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                members.add(new Member(resultSet.getInt("user_id"),
                        resultSet.getString("name"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"),
                        resultSet.getString("address"),
                        resultSet.getString("image"),
                        resultSet.getString("username"),
                        resultSet.getInt("accumulated_point"),
                        resultSet.getInt("role_id")));
            }
            resultSet.close();
            preparedStatement.close();
        } catch (Exception e){
            e.printStackTrace();
        }

        return members;
    }

    public List<Member> searchMemberList(int indexPage, String nameSearch){
        List<Member> members = new ArrayList<>();
        Member member;
        String sql = "SELECT distinct u.user_id, u.username, `name`, email, address, phone, image, ap.accumulated_point, ur.role_id\n" +
                "from accumulated_point ap\n" +
                "right join `user` u on u.user_id = ap.user_id\n" +
                "inner join user_role ur on ur.username = u.username\n" +
                "where u.`name` like ?" +
                "order by u.user_id\n" +
                "limit ?, ?;";  // Phân trang bảng Thành viên, bắt đầu từ index (?) hiển thị (?) Thành viên.
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%"+nameSearch+"%");
            preparedStatement.setInt(2, (indexPage-1)*entryDisplay);
            preparedStatement.setInt(3, entryDisplay);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                member = new Member(resultSet.getInt("user_id"),
                        resultSet.getString("name"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"),
                        resultSet.getString("address"),
                        resultSet.getString("image"),
                        resultSet.getString("username"),
                        resultSet.getInt("accumulated_point"),
                        resultSet.getInt("role_id"));
                members.add(member);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (Exception e){
            e.printStackTrace();
        }

        return members;
    }

    public int getTotalMember(){
        String sql = "Select count(*) from user;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void updateMember(Member memberSearch, Member memberUpdate){
        String sql = "CALL UpdateMember(?,?,?,?,?,?,?)";

        try {
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, memberSearch.getUserId());
            callableStatement.setString(2, memberUpdate.getName());
            callableStatement.setString(3, memberUpdate.getEmail());
            callableStatement.setString(4, memberUpdate.getPhone());
            callableStatement.setString(5, memberUpdate.getAddress());
            callableStatement.setString(6, memberSearch.getAccount());
            callableStatement.setInt(7, memberUpdate.getRole());
            callableStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

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
                int point = resultSet.getInt("accumulated_point");
                int userId = resultSet.getInt("user_id");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String image = "";
                int role = 0;
                String account = resultSet.getString("username");
                Member member = new Member(userId, name, email, phone, address, image, account, point, role);
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
                int point = resultSet.getInt("accumulated_point");
                int userId = resultSet.getInt("user_id");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String image = "";
                int role = 0;
                String account = resultSet.getString("username");
                Member member = new Member(userId, name, email, phone, address, image, account, point, role);
                memberList.add(member);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return memberList;
    }

    public boolean deleteMember(Member member){
        String sql = "call delete_user(?)";
        boolean checkDeleted = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, member.getUserId());
            checkDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return  checkDeleted;
    }
}
