package service;

import model.ExamHistory;
import model.User;

import java.util.List;

public interface UserService {
    public List<User> getUserList();
    public List<ExamHistory> getListExamHistory(int id);
    public User getUserId(int id);
    public User getUserAccount(String accountName);
    public void addUserList(User user);
    public void updateUserId(User user);
    public void updateImageUserId(int id , String image);
    public void deleteUser (int id);
}
