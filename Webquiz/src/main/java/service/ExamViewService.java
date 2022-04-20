package service;

import model.Exam;
import model.ExamQuestion;
import model.Question;

import java.util.List;

public interface ExamViewService {
    public List<ExamQuestion> examList(int sjId);
    public ExamQuestion getExamQuestionId(int id);
    public Exam getExamId(int id);
    public List<Question> loadExamQuestion(int idExam);
    public void addHistoryExam(int examId, int userId, int point);
    public void updateAccumulatePoint(int userId);
}
