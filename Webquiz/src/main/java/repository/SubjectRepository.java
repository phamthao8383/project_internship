package repository;

import model.Subject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SubjectRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_SUBJECT_BY_ID = "select * from subject where subject_id =?";
    private static final String SELECT_ALL_SUBJECT = "select * from subject";
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
}

