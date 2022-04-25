package service.impl;

import model.Question;
import repository.ExamQuestionsRepository;
import service.ExamQuestionsService;

import java.util.List;


public class ExamQuestionsServiceImpl implements ExamQuestionsService {
    ExamQuestionsRepository examQuestionsRepository = new ExamQuestionsRepository();
    @Override
    public List<Question> selectAllExamQuestion(int exam_id) {
        return examQuestionsRepository.selectAllExamQuestion(exam_id);
    }

    @Override
    public List<Question> selectAllQuestionSj(int id_sj, int exam_id) {
        return examQuestionsRepository.selectAllQuestionSj(id_sj,exam_id);
    }

    @Override
    public void addQuestionExam(int exam_id, int question_id) {
        examQuestionsRepository.addQuestionExam(exam_id,question_id);
    }
}
