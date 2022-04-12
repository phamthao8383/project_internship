package service.impl;

import model.Question;
import repository.QuestionRepository;
import service.QuestionService;

import java.util.List;

public class QuestionServiceImpl implements QuestionService {
    QuestionRepository questionRepository=new QuestionRepository();
    @Override
    public void insertQuestion(Question question) {
        questionRepository.insertQuestion(question);
    }

    @Override
    public Question selectQuestion(int question_id) {
        return questionRepository.selectByIdQuestion(question_id);
    }

    @Override
    public List<Question> selectAllQuestion() {
        return questionRepository.selectAllQuestion();
    }

    @Override
    public boolean deleteQuestion(int question_id) {
        return questionRepository.deleteQuestion(question_id);
    }

    @Override
    public boolean updateQuestion(Question question) {
        return questionRepository.updateQuestion(question);
    }

    @Override
    public List<Question> findAllByName(String name) {
        return null;
    }
}
