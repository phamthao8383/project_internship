package service.impl;

import model.Question;
import repository.QuestionRepository;
import service.QuestionService;

import java.util.List;

public class QuestionServiceImpl implements QuestionService {
    QuestionRepository questionRepository=new QuestionRepository();
    @Override
    public void insertQuestion(Question question) {

    }

    @Override
    public Question selectQuestion(int question_id) {
        return null;
    }

    @Override
    public List<Question> selectAllQuestion() {
        return questionRepository.selectAllQuestion();
    }

    @Override
    public boolean deleteQuestion(int question_id) {
        return false;
    }

    @Override
    public boolean updateQuestion(Question question) {
        return false;
    }

    @Override
    public List<Question> findAllByName(String name) {
        return null;
    }
}
