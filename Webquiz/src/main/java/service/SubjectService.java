package service;

import model.Subject;

import java.util.List;

public interface SubjectService {
    List<Subject> selectAllSubject();
    Subject selectByIdSubject(int subject_id);
}
