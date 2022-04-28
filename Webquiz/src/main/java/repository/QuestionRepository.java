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
    private static final String DELETE_QUESTION_SQL = "delete from question where `question_id` = ?;";
    private static final String SELECT_QUESTION_BY_ID = "select * from question join `subject` on question.subject_id=`subject`.subject_id where question_id =?;";
    private static final String SELECT_ALL_QUESTION = "select * from question join `subject` on question.subject_id=`subject`.subject_id;";
    private static final String PAGINATE_QUESTION = "select * from question join `subject` on question.subject_id=`subject`.subject_id limit ?,?;";
    private static final String INSERT_QUESTION = "INSERT INTO question" + " (question_id,`description`,answer1,answer2,answer3,answer4,correct_answer,subject_id) VALUES" + "(?,?,?,?,?,?,?,?);";
    private static final String INSERT_QUESTION_FILE = "INSERT INTO question" + " (`description`,answer1,answer2,answer3,answer4,correct_answer,subject_id) VALUES" + "(?,?,?,?,?,?,?);";

    private static final String UPDATE_QUESTION = "update question set `description` = ?,answer1 = ?,answer2 = ?,answer3 = ?,answer4 = ?,correct_answer = ?,subject_id= ? where question_id = ?";
    private static final String SEARCH_QUESTION = "select * from question join `subject` on question.subject_id=`subject`.subject_id where `description` like ?;";
    private static final String TOTAL_QUESTION = "select count(*) from question;";

    public List<Question> selectAllQuestion() {
        List<Question> questions = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(SELECT_ALL_QUESTION);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int question_id = rs.getInt("question_id");
                String description = rs.getString("description");
                String answer1 = rs.getString("answer1");
                String answer2 = rs.getString("answer2");
                String answer3 = rs.getString("answer3");
                String answer4 = rs.getString("answer4");
                String correct_answer = rs.getString("correct_answer");
                int subject_id = rs.getInt("subject_id");
                String subject_name = rs.getString("subject_name");
                questions.add(new Question(question_id, description, answer1, answer2, answer3, answer4, correct_answer, new Subject(subject_id, subject_name)));
            }
            rs.close();
            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questions;
    }

    public void insertQuestion(Question question) {
        try {
            Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_QUESTION);
            preparedStatement.setInt(1, question.getQuestion_id());
            preparedStatement.setString(2, question.getDescription());
            preparedStatement.setString(3, question.getAnswer1());
            preparedStatement.setString(4, question.getAnswer2());
            preparedStatement.setString(5, question.getAnswer3());
            preparedStatement.setString(6, question.getAnswer4());
            preparedStatement.setString(7, question.getCorrect_answer());
            preparedStatement.setInt(8, question.getSubject().getSubject_id());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void insertQuestionFile(Question question) {
        try {
            Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_QUESTION_FILE);
            preparedStatement.setString(1, question.getDescription());
            preparedStatement.setString(2, question.getAnswer1());
            preparedStatement.setString(3, question.getAnswer2());
            preparedStatement.setString(4, question.getAnswer3());
            preparedStatement.setString(5, question.getAnswer4());
            preparedStatement.setString(6, question.getCorrect_answer());
            preparedStatement.setInt(7, question.getSubject().getSubject_id());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public boolean updateQuestion(Question question) {
        boolean rowUpdated = false;
        try {
            Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_QUESTION);
            preparedStatement.setString(1, question.getDescription());
            preparedStatement.setString(2, question.getAnswer1());
            preparedStatement.setString(3, question.getAnswer2());
            preparedStatement.setString(4, question.getAnswer3());
            preparedStatement.setString(5, question.getAnswer4());
            preparedStatement.setString(6, question.getCorrect_answer());
            preparedStatement.setInt(7, question.getSubject().getSubject_id());
            preparedStatement.setInt(8, question.getQuestion_id());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    public Question selectByIdQuestion(int question_id) {
        Question question = null;
        try {
            Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_QUESTION_BY_ID);
            preparedStatement.setInt(1, question_id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String description = rs.getString("description");
                String answer1 = rs.getString("answer1");
                String answer2 = rs.getString("answer2");
                String answer3 = rs.getString("answer3");
                String answer4 = rs.getString("answer4");
                String correct_answer = rs.getString("correct_answer");
                int subject_id = rs.getInt("subject_id");
                String subject_name = rs.getString("subject_name");
                question = new Question(question_id, description, answer1, answer2, answer3, answer4, correct_answer, new Subject(subject_id, subject_name));
            }
//            rs.close();
//            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return question;
    }

    public boolean deleteQuestion(int question_id) {
        boolean rowDeleted = false;
        try {
            Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_QUESTION_SQL);
//            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(DELETE_QUESTION_SQL);
            preparedStatement.setInt(1, question_id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    public List<Question> findAllByDescription(String description) {
        List<Question> questionList = new ArrayList<>();
        try {
            Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_QUESTION);
            String description1 = "%" + description + "%";
            preparedStatement.setString(1, description1);
            ResultSet rs = preparedStatement.executeQuery();
            Question question;
            while (rs.next()) {
                question = new Question();
                question.setQuestion_id(rs.getInt("question_id"));
                question.setDescription(rs.getString("description"));
                question.setAnswer1(rs.getString("answer1"));
                question.setAnswer2(rs.getString("answer2"));
                question.setAnswer3(rs.getString("answer3"));
                question.setAnswer4(rs.getString("answer4"));
                question.setCorrect_answer(rs.getString("correct_answer"));
                int subject_id = rs.getInt("subject_id");
                String subject_name = rs.getString("subject_name");
                question.setSubject(new Subject(subject_id, subject_name));
                questionList.add(question);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questionList;
    }

    public int getTotalQuestion(){
        Connection connection = this.baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(TOTAL_QUESTION);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Question> paginateQuestion(int indexPage) {
        List<Question> questions = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(PAGINATE_QUESTION);
            int entryDisplay = BaseRepository.entryDisplay;
            preparedStatement.setInt(1, (indexPage-1)* entryDisplay);    // Vị trí của index query bắt đầu từ (index trang - 1) * số mục hiển thị cho mỗi trang
            preparedStatement.setInt(2, entryDisplay);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int question_id = rs.getInt("question_id");
                String description = rs.getString("description");
                String answer1 = rs.getString("answer1");
                String answer2 = rs.getString("answer2");
                String answer3 = rs.getString("answer3");
                String answer4 = rs.getString("answer4");
                String correct_answer = rs.getString("correct_answer");
                int subject_id = rs.getInt("subject_id");
                String subject_name = rs.getString("subject_name");
                questions.add(new Question(question_id, description, answer1, answer2, answer3, answer4, correct_answer, new Subject(subject_id, subject_name)));
            }
            rs.close();
            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questions;
    }
}
