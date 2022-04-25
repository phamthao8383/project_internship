package model;

public class Exam {
    int examId;
    Subject subject;
    String allowedTime;
    String examName;

    public Exam(int examId, Subject subject, String allowedTime, String examName) {
        this.examId = examId;
        this.subject = subject;
        this.allowedTime = allowedTime;
        this.examName = examName;
    }

    public Exam(int examId) {
        this.examId = examId;
    }

    public Exam() {
    }

    public Exam(Subject subject, String allowedTime, String examName) {
        this.subject = subject;
        this.allowedTime = allowedTime;
        this.examName = examName;
    }

    @Override
    public String toString() {
        return "Exam{" +
                "examId=" + examId +
                ", subject=" + subject +
                ", allowedTime='" + allowedTime + '\'' +
                ", examName='" + examName + '\'' +
                '}';
    }

    public int getExamId() {
        return examId;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public String getAllowedTime() {
        return allowedTime;
    }

    public void setAllowedTime(String allowedTime) {
        this.allowedTime = allowedTime;
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }
}
