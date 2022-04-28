package service.impl;

import model.Exam;
import model.Question;
import repository.ExamRepository;
import service.ExamService;

import java.util.List;

public class ExamServiceImpl implements ExamService {
    ExamRepository examRepository = new ExamRepository();

    @Override
    public void insertExam(Exam exam) {
        examRepository.insertExam(exam);

    }

    @Override
    public Exam selectExam(int exam_id) {
        return examRepository.selectByIdExam(exam_id);
    }

    @Override
    public List<Exam> selectAllExam() {
        return examRepository.selectAllExam();
    }

    @Override
    public boolean deleteExam(int exam_id) {
        return examRepository.deleteExam(exam_id);
    }

    @Override
    public boolean updateExam(Exam exam) {
        return examRepository.updateExam(exam);
    }

    @Override
    public List<Exam> findAllByName(String name) {
        return null;
    }

    @Override
    public int getTotalExam() {
        return examRepository.getTotalExam();
    }

    @Override
    public List<Exam> paginateExam(int indexPage) {
        return examRepository.paginateExam(indexPage);
    }
}