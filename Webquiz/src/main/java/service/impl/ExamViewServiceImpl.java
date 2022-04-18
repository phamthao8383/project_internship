package service.impl;

import model.Exam;
import model.Question;
import repository.ExamViewRepository;
import service.ExamViewService;

import java.util.List;

public class ExamViewServiceImpl implements ExamViewService {
    ExamViewRepository examRepository = new ExamViewRepository();
    @Override
    public List<Exam> examList(int sjId) {
        return examRepository.examList(sjId);
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
    public void addHistoryExam(int examId, int userId, int point) {
        examRepository.addHistoryExam(examId,userId,point);
    }

    @Override
    public void updateAccumulatePoint(int userId) {
        examRepository.updateAccumulatePoint(userId);
    }
}
