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
}
