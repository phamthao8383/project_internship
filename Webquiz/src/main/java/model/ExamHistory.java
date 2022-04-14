package model;

import java.sql.Time;

public class ExamHistory {
    int examHistoryId;
    int userId;
    int examId;
    Time startTime;
    Time endTime;
    Double point;

    public ExamHistory(int examHistoryId, int userId, int examId, Time startTime, Time endTime, Double point) {
        this.examHistoryId = examHistoryId;
        this.userId = userId;
        this.examId = examId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.point = point;
    }

    public ExamHistory(int examHistoryId, int userId, int examId) {
        this.examHistoryId = examHistoryId;
        this.userId = userId;
        this.examId = examId;
    }

    public ExamHistory() {
    }

    @Override
    public String toString() {
        return "ExamHistory{" +
                "examHistoryId=" + examHistoryId +
                ", userId=" + userId +
                ", examId=" + examId +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", point=" + point +
                '}';
    }

    public ExamHistory(int examHistoryId) {
        this.examHistoryId = examHistoryId;
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

    public int getExamId() {
        return examId;
    }

    public void setExam(int examId) {
        this.examId = examId;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }

    public Double getPoint() {
        return point;
    }

    public void setPoint(Double point) {
        this.point = point;
    }
}
