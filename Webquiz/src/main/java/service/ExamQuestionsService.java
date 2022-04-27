package service;

import model.Question;

import java.util.List;

public interface ExamQuestionsService {
    List<Question> selectAllExamQuestion(int exam_id);
    List<Question> selectAllQuestionSj(int id_sj, int exam_id);
    void addQuestionExam(int exam_id, int question_id);
    void DeleteQuestionExam(int exam_id, int question_id);
    int getTotalExamQuestion(int exam_id);
    List<Question> paginateExamQuestion(int exam_id, int indexPage);
}
