package service.impl;

import model.Exam;
import model.Question;
import repository.ExamRepository;
import service.ExamService;

import java.util.List;

public class ExamServiceImpl implements ExamService {
    ExamRepository examRepository = new ExamRepository();
    @Override
    public List<Exam> examList(int sjId) {
        return examRepository.examList(sjId);
    }

    @Override
    public List<Question> loadExamQuestion(int idExam) {
        return examRepository.loadExamQuestion(idExam);
    }
}
