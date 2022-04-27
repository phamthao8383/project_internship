package service;

import model.Question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public interface QuestionService {
    void insertQuestion(Question question);
    public void insertQuestionFile(Question question);

    Question selectQuestion(int question_id);

    List<Question> selectAllQuestion();
    boolean deleteQuestion(int question_id);

    boolean updateQuestion(Question question);

    List<Question> findAllByDescription(String description);
    void exportCSV(List<Question> questions) throws IOException, IOException;

    int getTotalQuestion();
    List<Question> paginateQuestion(int indexPage);
}
