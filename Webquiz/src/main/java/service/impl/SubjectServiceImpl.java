package service.impl;

import model.Subject;
import repository.SubjectRepository;
import service.SubjectService;

import java.util.List;

public class SubjectServiceImpl implements SubjectService {
    SubjectRepository subjectRepository=new SubjectRepository();
    @Override
    public List<Subject> selectAllSubject() {
        return subjectRepository.selectAllSubject();
    }
    @Override
    public Subject selectByIdSubject(int subject_id) {
        return subjectRepository.selectByIdSubject(subject_id);
    }

    @Override
    public void insertSubject(Subject subject) {
        subjectRepository.insertSubject(subject);
    }

    @Override
    public boolean deleteSubject(int subject_id) {
        return subjectRepository.deleteSubject(subject_id);
    }

    @Override
    public boolean updateSubject(Subject subject) {
        return subjectRepository.updateSubject(subject);
    }
}
