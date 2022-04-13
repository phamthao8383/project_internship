package service;

import model.Question;
import model.Subject;

import java.util.List;

public interface SubjectService {
    List<Subject> selectAllSubject();

    Subject selectByIdSubject(int subject_id);

    void insertSubject(Subject subject);

    boolean deleteSubject(int subject_id);

    boolean updateSubject(Subject subject);
}
