package model;

public class ExamQuestion {
    private Exam exam;
    private int total;


    public ExamQuestion() {
    }

    public ExamQuestion(Exam exam, int total) {
        this.exam = exam;
        this.total = total;
    }

    @Override
    public String toString() {
        return "ExamQuestion{" +
                "exam=" + exam +
                ", total=" + total +
                '}';
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
