package service;

import model.User;

import java.util.List;

public interface UserService {
    public List<User> getUserList();
    public Integer getIdMax();
    public User getUserId(int id);
    public void addUserList(User user);
    public void updateUserId(User user);
    public void deleteUser (int id);
}
