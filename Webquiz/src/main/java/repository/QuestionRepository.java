package repository;

import model.Question;
import model.Subject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_QUESTION_BY_ID = "select * from subject where subject_id =?";
    private static final String SELECT_ALL_QUESTION = "select * from question join `subject` on question.subject_id=`subject`.subject_id;";
    private static final String INSERT_QUESTION="INSERT INTO question" + " (question_id,`description`,answer1,answer2,answer3,answer4,correct_answer,subject_id) VALUES"+ "(?,?,?,?,?,?,?,?);";
    public List<Question> selectAllQuestion() {
        List<Question> questions = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(SELECT_ALL_QUESTION);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int question_id = rs.getInt("question_id");
                String description = rs.getString("description");
                String answer1 =rs.getString("answer1");
                String answer2 =rs.getString("answer2");
                String answer3 =rs.getString("answer3");
                String answer4 =rs.getString("answer4");
                String correct_answer=rs.getString("correct_answer");
                int subject_id=rs.getInt("subject_id");
                String subject_name=rs.getString("subject_name");
                questions.add(new Question(question_id,description,answer1,answer2,answer3,answer4,correct_answer,new Subject(subject_id,subject_name)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questions;
    }
    public void insertQuestion(Question question){
        try ( Connection connection= baseRepository.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_QUESTION)){
            preparedStatement.setInt(1, question.getQuestion_id());
            preparedStatement.setString(2,question.getDescription());
            preparedStatement.setString(3,question.getAnswer1());
            preparedStatement.setString(4,question.getAnswer2());
            preparedStatement.setString(5,question.getAnswer3());
            preparedStatement.setString(6,question.getAnswer4());
            preparedStatement.setString(7,question.getCorrect_answer());
            preparedStatement.setInt(8,question.getSubject().getSubject_id());
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
