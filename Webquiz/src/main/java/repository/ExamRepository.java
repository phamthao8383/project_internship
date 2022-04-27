package repository;

import model.Account;
import model.Exam;
import model.Subject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ExamRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private static final String DELETE_EXAM_SQL = "delete from exam where `exam_id` = ?;";
    private static final String SELECT_EXAM_BY_ID = "select * from exam join `subject` on exam.subject_id=`subject`.subject_id where exam_id =?;";
    private static final String SELECT_ALL_EXAM = "select * from exam join `subject` on exam.subject_id=`subject`.subject_id;";
    private static final String INSERT_EXAM = "INSERT INTO exam (subject_id, allowed_time, exam_name) VALUE (?,?,?)";
    private static final String UPDATE_EXAM = "update exam set subject_id = ?,allowed_time = ?,exam_name = ? where exam_id = ?";
    private static final String PAGINATE_EXAM = "select * from exam join `subject` on exam.subject_id=`subject`.subject_id limit ?,?;";
    private static final String TOTAL_EXAM = "select count(*) from exam;";

    public List<Exam> selectAllExam() {
        List<Exam> exams = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(SELECT_ALL_EXAM);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int exam_id = rs.getInt("exam_id");
                int subject_id = rs.getInt("subject_id");
                String subject_name = rs.getString("subject_name");
                String allowed_time = rs.getString("allowed_time");
                String exam_name = rs.getString("exam_name");
                exams.add(new Exam(exam_id, new Subject(subject_id, subject_name), allowed_time, exam_name));
            }
            rs.close();
            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exams;
    }

    public void insertExam(Exam exam) {
        try {
            Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EXAM);
            System.out.println(exam);
            preparedStatement.setInt(1, exam.getSubject().getSubject_id());
            preparedStatement.setString(2, exam.getAllowedTime());
            preparedStatement.setString(3, exam.getExamName());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public boolean updateExam(Exam exam) {
        boolean rowUpdated = false;
        try {
            Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EXAM);
            preparedStatement.setInt(1, exam.getSubject().getSubject_id());
            preparedStatement.setString(2, exam.getAllowedTime());
            preparedStatement.setString(3, exam.getExamName());
            preparedStatement.setInt(4, exam.getExamId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    public Exam selectByIdExam(int exam_id) {
        Exam exam = null;
        try {
            Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EXAM_BY_ID);
            preparedStatement.setInt(1, exam_id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int subject_id = rs.getInt("subject_id");
                String subject_name = rs.getString("subject_name");
                String allowed_time = rs.getString("allowed_time");
                String exam_name = rs.getString("exam_name");
                exam = new Exam(exam_id, new Subject(subject_id, subject_name), allowed_time, exam_name);
            }
//            rs.close();
//            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exam;
    }


    public boolean deleteExam(int exam_id) {
        boolean rowDeleted = false;
        try {
            Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EXAM_SQL);
//            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(DELETE_QUESTION_SQL);
            preparedStatement.setInt(1, exam_id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    public int getTotalExam(){
        Connection connection = this.baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(TOTAL_EXAM);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Exam> paginateExam(int indexPage){
        List<Exam> exams = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(PAGINATE_EXAM);
            int entryDisplay = BaseRepository.entryDisplay;
            preparedStatement.setInt(1,(indexPage-1)*entryDisplay);
            preparedStatement.setInt(2, entryDisplay);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int exam_id = rs.getInt("exam_id");
                int subject_id = rs.getInt("subject_id");
                String subject_name = rs.getString("subject_name");
                String allowed_time = rs.getString("allowed_time");
                String exam_name = rs.getString("exam_name");
                exams.add(new Exam(exam_id, new Subject(subject_id, subject_name), allowed_time, exam_name));
            }
            rs.close();
            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exams;
    }
}


//    public List<Exam> examList(int sjId) {
//        List<Exam> listExam = new ArrayList<>();
//        Exam exam = new Exam();
//        try {
//            String myQuery = "SELECT *  FROM `exam` join `subject` on `exam`.subject_id = `subject`.subject_id  where `subject`.subject_id = ?";
//
//            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
//            preparedStatement.setInt(1,sjId);
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()) {
//                exam = new Exam (rs.getInt("exam_id")
//                                ,new Subject(rs.getInt("subject_id"),rs.getString("subject_name"))
//                                ,rs.getString("allowed_time")
//                                ,rs.getString("exam_name"));
//                listExam.add(exam);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return listExam;
//    }
//
//    public List<Question> loadExamQuestion(int idExam) {
//        List<Question> listQuestions = new ArrayList<>();
//        Question question = new Question();
//        try {
//            String myQuery = "SELECT * FROM exam_question\n" +
//                                "inner join exam on exam_question.exam_id = exam.exam_id\n" +
//                                "inner join question on exam_question.question_id = question.question_id\n" +
//                                "where exam.exam_id = ?";
//            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
//            preparedStatement.setInt(1,idExam);
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()) {
//                question = new Question(rs.getInt("question_id"),
//                                        rs.getString("description"),
//                                        rs.getString("answer1"),
//                        rs.getString("answer2"),
//                        rs.getString("answer3"),
//                        rs.getString("answer4"),
//                        rs.getString("correct_answer"),
//                        new Subject(rs.getInt("subject_id")));
//                listQuestions.add(question);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return listQuestions;
//    }
//
//}
