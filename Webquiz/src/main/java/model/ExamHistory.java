package model;

import java.sql.Time;
import java.time.format.DateTimeFormatter;

public class ExamHistory {
    int examHistoryId;
    int userId;
    Exam exam;
    String startTime;
    String endTime;
    int point;

    public ExamHistory(int examHistoryId, int userId, Exam exam, String startTime, String endTime, int point) {
        this.examHistoryId = examHistoryId;
        this.userId = userId;
        this.exam = exam;
        this.startTime = startTime;
        this.endTime = endTime;
        this.point = point;
    }

    public ExamHistory(int examHistoryId) {
        this.examHistoryId = examHistoryId;
    }

    public ExamHistory() {
    }

    @Override
    public String toString() {
        return "ExamHistory{" +
                "examHistoryId=" + examHistoryId +
                ", userId=" + userId +
                ", exam=" + exam +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", point=" + point +
                '}';
    }

    public int getExamHistoryId() {
        return examHistoryId;
    }

    public void setExamHistoryId(int examHistoryId) {
        this.examHistoryId = examHistoryId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }
}
