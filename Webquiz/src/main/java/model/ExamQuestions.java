package model;

public class ExamQuestions {
    private Exam exam;
    private Question question;

    public ExamQuestions(Exam exam, Question question) {
        this.exam = exam;
        this.question = question;
    }

    public ExamQuestions(int exam_id, int question_id) {
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }
}
