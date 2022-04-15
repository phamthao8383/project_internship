package service;

import model.Exam;
import model.Question;

import java.util.List;

public interface ExamService {
    public List<Exam> examList(int sjId);
    public List<Question> loadExamQuestion(int idExam);
}
