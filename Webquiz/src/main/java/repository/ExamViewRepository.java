package repository;

import model.*;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class ExamViewRepository {
    private BaseRepository baseRepository = new BaseRepository();


    public List<ExamQuestion> examList(int sjId) {
        List<ExamQuestion> listExam = new ArrayList<>();
        ExamQuestion exam = new ExamQuestion();
        try {
            String myQuery = "SELECT *  FROM `exam` join `subject` on `exam`.subject_id = `subject`.subject_id  where `subject`.subject_id = ?";

            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setInt(1,sjId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {

                String queryTotal = "select count(exam.exam_id) as total from `exam` join exam_question on exam.exam_id = exam_question.exam_id where exam.exam_id = ?";

                PreparedStatement preparedStatementTotal = this.baseRepository.getConnection().prepareStatement(queryTotal);
                preparedStatementTotal.setInt(1,rs.getInt("exam_id"));
                ResultSet rsTotal = preparedStatementTotal.executeQuery();
                while (rsTotal.next()) {
                    exam = new ExamQuestion (new Exam( rs.getInt("exam_id")
                            ,new Subject(rs.getInt("subject_id"),rs.getString("subject_name"))
                            ,rs.getString("allowed_time")
                            ,rs.getString("exam_name")), rsTotal.getInt("total"));
                    listExam.add(exam);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listExam;
    }

    public ExamQuestion getExamQuestionId(int id) {

        ExamQuestion examQusetion = new ExamQuestion();
        int total = 0;
        try {
            String myQuery = "SELECT *  FROM `exam` join `subject` on `exam`.subject_id = `subject`.subject_id  where exam_id = ?";
            String queryTotal = "select count(exam.exam_id) as total from `exam` join exam_question on exam.exam_id = exam_question.exam_id where exam.exam_id = ?";
            PreparedStatement preparedStatementTotal = this.baseRepository.getConnection().prepareStatement(queryTotal);
            preparedStatementTotal.setInt(1,id);
            ResultSet rsTotal = preparedStatementTotal.executeQuery();
            while (rsTotal.next()) {
                total =  rsTotal.getInt("total");
            }

            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                examQusetion = new ExamQuestion (new Exam( rs.getInt("exam_id")
                        ,new Subject(rs.getInt("subject_id"),rs.getString("subject_name"))
                        ,rs.getString("allowed_time")
                        ,rs.getString("exam_name")), total);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return examQusetion;
    }


    public Exam getExamId(int id) {

        Exam exam = new Exam();
        try {
            String myQuery = "SELECT *  FROM `exam` join `subject` on `exam`.subject_id = `subject`.subject_id  where exam_id = ?";
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                exam = new Exam( rs.getInt("exam_id")
                        ,new Subject(rs.getInt("subject_id"),rs.getString("subject_name"))
                        ,rs.getString("allowed_time")
                        ,rs.getString("exam_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exam;
    }



    public List<Question> loadExamQuestion(int idExam) {
        List<Question> listQuestions = new ArrayList<>();
        Question question = new Question();
        try {
            String myQuery = "SELECT * FROM exam_question\n" +
                                "inner join exam on exam_question.exam_id = exam.exam_id\n" +
                                "inner join question on exam_question.question_id = question.question_id\n" +
                                "where exam.exam_id = ?";
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setInt(1,idExam);
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


    public void addHistoryExam(int examId, int userId, int point) {
        try {
            String myQuery = "insert into `assignment` (user_id , exam_id , point, starting_time,completion_time ) value (?,?,?,?,?)";
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, examId);
            preparedStatement.setDouble(3, point);
            preparedStatement.setString(4, "2022-02-02 12:00:00");
            preparedStatement.setString(5, "2022-02-02 13:00:00");
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateAccumulatePoint(int userId) {
        String querySumPoint = "select sum(point) as sum_point from assignment where user_id = ?";
        String myQuery = "update accumulated_point set accumulated_point = ? where user_id = ? ";
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(querySumPoint);
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();
            double pointAcc = 0;
            while (rs.next()) {
                pointAcc = rs.getDouble("sum_point");
            }

            PreparedStatement preparedStatement1 = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement1.setDouble(1, pointAcc );
            preparedStatement1.setInt(2, userId );
            preparedStatement1.executeUpdate();



        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
