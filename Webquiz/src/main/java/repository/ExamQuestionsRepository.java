package repository;

import model.ExamQuestion;
import model.Question;
import model.Subject;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ExamQuestionsRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ALL_EXAM_QUESTION = "Select * from exam_question join exam on exam.exam_id = exam_question.exam_id join question on exam_question.question_id = question.question_id where exam.exam_id = ?";

    public List<Question> selectAllExamQuestion(int exam_id) {
        List<Question> listQuestions = new ArrayList<>();
        Question question = new Question();
        try {
            String myQuery = "SELECT * FROM exam_question\n" +
                    "inner join exam on exam_question.exam_id = exam.exam_id\n" +
                    "inner join question on exam_question.question_id = question.question_id\n" +
                    "where exam.exam_id = ?";
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setInt(1,exam_id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                question = new Question(rs.getInt("question_id"),
                        rs.getString("description"),
                        rs.getString("answer1"),
                        rs.getString("answer2"),
                        rs.getString("answer3"),
                        rs.getString("answer4"),
                        rs.getString("correct_answer"),
                        new Subject(rs.getInt("subject_id")));
                listQuestions.add(question);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listQuestions;
    }


    public List<Question> selectAllQuestionSj(int id_sj , int exam_id) {
        List<Question> listQuestions = new ArrayList<>();
        Question question = new Question();
        try {
            String myQuery = "select * from question where subject_id = ? and question.question_id not in (select question_id from exam_question where exam_id = ? )";
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setInt(1,id_sj);
            preparedStatement.setInt(2,exam_id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                question = new Question(rs.getInt("question_id"),
                        rs.getString("description"),
                        rs.getString("answer1"),
                        rs.getString("answer2"),
                        rs.getString("answer3"),
                        rs.getString("answer4"),
                        rs.getString("correct_answer"),
                        new Subject(rs.getInt("subject_id")));
                listQuestions.add(question);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listQuestions;
    }

    public void addQuestionExam (int exam_id, int question_id) {
            String myQuery = "insert into exam_question (exam_id, question_id) value (?,?)";
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
             preparedStatement.setInt(1,exam_id);
            preparedStatement.setInt(2,question_id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void DeleteQuestionExam (int exam_id, int question_id) {
        String myQuery = "DELETE FROM exam_question WHERE   exam_id = ? and  question_id = ?";
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setInt(1,exam_id);
            preparedStatement.setInt(2,question_id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getTotalExamQuestion(int exam_id){
        String sql = "SELECT count(*) FROM exam_question\n" +
                "inner join exam on exam_question.exam_id = exam.exam_id\n" +
                "inner join question on exam_question.question_id = question.question_id\n" +
                "where exam.exam_id = ?";
        Connection connection = this.baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, exam_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    public List<Question> paginateExamQuestion(int exam_id, int indexPage){
        List<Question> listQuestions = new ArrayList<>();
        Question question = new Question();
        try {
            int entryDisplay = BaseRepository.entryDisplay;
            String myQuery = "SELECT * FROM exam_question\n" +
                    "inner join exam on exam_question.exam_id = exam.exam_id\n" +
                    "inner join question on exam_question.question_id = question.question_id\n" +
                    "where exam.exam_id = ? limit ?,?;";
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setInt(1,exam_id);
            preparedStatement.setInt(2, (indexPage-1)*entryDisplay);
            preparedStatement.setInt(3, entryDisplay);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                question = new Question(rs.getInt("question_id"),
                        rs.getString("description"),
                        rs.getString("answer1"),
                        rs.getString("answer2"),
                        rs.getString("answer3"),
                        rs.getString("answer4"),
                        rs.getString("correct_answer"),
                        new Subject(rs.getInt("subject_id")));
                listQuestions.add(question);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listQuestions;
    }

}
