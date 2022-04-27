package model;

public class Question {
    private int question_id;
    private String description;
    private String answer1;
    private String answer2;
    private String answer3;
    private String answer4;
    private String correct_answer;
    private Subject subject;

    public Question(String description) {
    }

    public Question(String description, String answer1, String answer2, String answer3, String answer4, String correct_answer) {
        this.description = description;
        this.answer1 = answer1;
        this.answer2 = answer2;
        this.answer3 = answer3;
        this.answer4 = answer4;
        this.correct_answer = correct_answer;
    }

    @Override
    public String toString() {
        return "Question{" +
                "question_id=" + question_id +
                ", description='" + description + '\'' +
                ", answer1='" + answer1 + '\'' +
                ", answer2='" + answer2 + '\'' +
                ", answer3='" + answer3 + '\'' +
                ", answer4='" + answer4 + '\'' +
                ", correct_answer='" + correct_answer + '\'' +
                ", subject=" + subject +
                '}';
    }

    public Question(int question_id, String description, String answer1, String answer2, String answer3, String answer4, String correct_answer, Subject subject) {
        this.question_id = question_id;
        this.description = description;
        this.answer1 = answer1;
        this.answer2 = answer2;
        this.answer3 = answer3;
        this.answer4 = answer4;
        this.correct_answer = correct_answer;
        this.subject = subject;
    }

    public Question() {
    }

    public Question(String description, String answer1, String answer2, String answer3, String answer4, String correct_answer, Subject subject) {
        this.description = description;
        this.answer1 = answer1;
        this.answer2 = answer2;
        this.answer3 = answer3;
        this.answer4 = answer4;
        this.correct_answer = correct_answer;
        this.subject = subject;
    }
    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAnswer1() {
        return answer1;
    }

    public void setAnswer1(String answer1) {
        this.answer1 = answer1;
    }

    public String getAnswer2() {
        return answer2;
    }

    public void setAnswer2(String answer2) {
        this.answer2 = answer2;
    }

    public String getAnswer3() {
        return answer3;
    }

    public void setAnswer3(String answer3) {
        this.answer3 = answer3;
    }

    public String getAnswer4() {
        return answer4;
    }

    public void setAnswer4(String answer4) {
        this.answer4 = answer4;
    }

    public String getCorrect_answer() {
        return correct_answer;
    }

    public void setCorrect_answer(String correct_answer) {
        this.correct_answer = correct_answer;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public void setSubject(int intValue) {
    }
}
