package service;

import model.Question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface QuestionService {
    void insertQuestion(Question question);

    Question selectQuestion(int question_id);

    List<Question> selectAllQuestion();
    boolean deleteQuestion(int question_id);

    boolean updateQuestion(Question question);

    List<Question> findAllByName(String name);

}
