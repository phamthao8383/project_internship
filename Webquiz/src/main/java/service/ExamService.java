package service;

import model.Exam;

import java.util.List;

public interface ExamService {
    void insertExam(Exam exam);

    Exam selectExam(int exam_id);

    List<Exam> selectAllExam();

    boolean deleteExam(int exam_id);

    boolean updateExam(Exam exam);

    List<Exam> findAllByName(String name);

    int getTotalExam();

    List<Exam> paginateExam(int indexPage);
}

