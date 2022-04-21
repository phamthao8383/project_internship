package model;

public class ExamQuestion {
    private Exam exam;
    private int total;
    private int timesExam;


    public ExamQuestion() {
    }

    public ExamQuestion(Exam exam, int total, int timesExam) {
        this.exam = exam;
        this.total = total;
        this.timesExam = timesExam;
    }

    public int getTimesExam() {
        return timesExam;
    }

    public void setTimesExam(int timesExam) {
        this.timesExam = timesExam;
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
                ", timesExam=" + timesExam +
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
