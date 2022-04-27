package service.impl;

import model.Question;
import repository.QuestionRepository;
import service.QuestionService;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

public class QuestionServiceImpl implements QuestionService {
    QuestionRepository questionRepository=new QuestionRepository();
    @Override
    public void insertQuestion(Question question) {
        questionRepository.insertQuestion(question);
    }

    @Override
    public void insertQuestionFile(Question question) {
        questionRepository.insertQuestionFile(question);
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
    public List<Question> findAllByDescription(String description) {
        return questionRepository.findAllByDescription(description);
    }


    @Override
    public void exportCSV(List<Question> questions) throws IOException {

    }

    @Override
    public int getTotalQuestion() {
        return questionRepository.getTotalQuestion();
    }

    @Override
    public List<Question> paginateQuestion(int indexPage) {
        return questionRepository.paginateQuestion(indexPage);
    }
}
