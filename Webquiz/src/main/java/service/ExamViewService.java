package service;

import model.Exam;
import model.Question;

import java.util.List;

public interface ExamViewService {
    public List<Exam> examList(int sjId);
    public Exam getExamId(int id);
    public List<Question> loadExamQuestion(int idExam);
    public void addHistoryExam(int examId, int userId, int point);
    public void updateAccumulatePoint(int userId);
}
