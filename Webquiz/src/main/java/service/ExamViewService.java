package service;

import model.Exam;
import model.ExamQuestion;
import model.Question;

import java.util.List;

public interface ExamViewService {
    public List<ExamQuestion> examList(int sjId);
    public List<ExamQuestion> examListTop5();
    public List<ExamQuestion> examListSearch(String str);
    public ExamQuestion getExamQuestionId(int id);
    public Exam getExamId(int id);
    public List<Question> loadExamQuestion(int idExam);
    public void addHistoryExam(int examId, int userId, int point, String timeStart , String timeEnd);
    public void updateAccumulatePoint(int userId);
}
