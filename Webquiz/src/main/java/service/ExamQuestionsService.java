package service;

import model.Question;

import java.util.List;

public interface ExamQuestionsService {
    public List<Question> selectAllExamQuestion(int exam_id);
    public List<Question> selectAllQuestionSj(int id_sj , int exam_id);
    public void addQuestionExam (int exam_id, int question_id);
    public void DeleteQuestionExam (int exam_id, int question_id);

}
