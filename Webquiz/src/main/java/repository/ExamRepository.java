package repository;

import model.Account;
import model.Exam;
import model.Question;
import model.Subject;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ExamRepository {
    private BaseRepository baseRepository = new BaseRepository();


    public List<Exam> examList(int sjId) {
        List<Exam> listExam = new ArrayList<>();
        Exam exam = new Exam();
        try {
            String myQuery = "SELECT *  FROM `exam` join `subject` on `exam`.subject_id = `subject`.subject_id  where `subject`.subject_id = ?";

            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
            preparedStatement.setInt(1,sjId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                exam = new Exam (rs.getInt("exam_id")
                                ,new Subject(rs.getInt("subject_id"),rs.getString("subject_name"))
                                ,rs.getString("allowed_time")
                                ,rs.getString("exam_name"));
                listExam.add(exam);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listExam;
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
}
