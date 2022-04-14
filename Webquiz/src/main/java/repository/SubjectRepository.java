package repository;

import model.Question;
import model.Subject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SubjectRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private static final String DELETE_SUBJECT_SQL = "delete from `subject` where `subject_id` = ?;";
    private static final String SELECT_SUBJECT_BY_ID = "select * from subject where subject_id =?";
    private static final String SELECT_ALL_SUBJECT = "select * from subject";
    private static final String INSERT_SUBJECT = "INSERT INTO subject" + " (subject_id,subject_name) VALUES" + "(?,?);";
    private static final String UPDATE_SUBJECT = "update `subject` set subject_name = ? where subject_id = ?;";


    public List<Subject> selectAllSubject() {
        List<Subject> subjects = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(SELECT_ALL_SUBJECT);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int subject_id = rs.getInt("subject_id");
                String subject_name = rs.getString("subject_name");
                subjects.add(new Subject(subject_id,subject_name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return subjects;
    }
    public Subject selectByIdSubject(int subject_id) {
        Subject subject = null;
        // Step 1: Establishing a Connection
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(SELECT_SUBJECT_BY_ID);
            preparedStatement.setInt(1, subject_id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String subject_name = rs.getString("subject_name");
                subject=new Subject(subject_id,subject_name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return subject;

    }
    public void insertSubject(Subject subject) {
        try {
            Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SUBJECT);
            preparedStatement.setInt(1, subject.getSubject_id());
            preparedStatement.setString(2, subject.getSubject_name());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public boolean updateSubject(Subject subject) {
        boolean rowUpdated = false;
        try {
            Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SUBJECT);
            preparedStatement.setString(1, subject.getSubject_name());
            preparedStatement.setInt(2, subject.getSubject_id());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }
    public boolean deleteSubject(int subject_id) {
        boolean rowDeleted = false;
        try {
            Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SUBJECT_SQL);
//            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(DELETE_QUESTION_SQL);
            preparedStatement.setInt(1, subject_id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }
}

