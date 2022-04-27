package service.impl;

import model.Exam;
import model.ExamQuestion;
import model.Question;
import repository.ExamViewRepository;
import service.ExamViewService;

import java.util.List;

public class ExamViewServiceImpl implements ExamViewService {
    ExamViewRepository examRepository = new ExamViewRepository();
    @Override
    public List<ExamQuestion> examList(int sjId) {
        return examRepository.examList(sjId);
    }

    @Override
    public List<ExamQuestion> examListTop5() {
        return examRepository.examListTop5();
    }

    @Override
    public List<ExamQuestion> examListSearch(String str) {
        return examRepository.examListSearch(str);
    }

    @Override
    public ExamQuestion getExamQuestionId(int id) {
        return examRepository.getExamQuestionId(id);
    }

    @Override
    public Exam getExamId(int id) {
        return examRepository.getExamId(id);
    }

    @Override
    public List<Question> loadExamQuestion(int idExam) {
        return examRepository.loadExamQuestion(idExam);
    }

    @Override
    public void addHistoryExam(int examId, int userId, int point, String timeStart , String timeEnd) {
        examRepository.addHistoryExam(examId,userId,point, timeStart, timeEnd);
    }

    @Override
    public void updateAccumulatePoint(int userId) {
        examRepository.updateAccumulatePoint(userId);
    }
}
