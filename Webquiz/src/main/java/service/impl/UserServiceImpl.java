package service.impl;

import model.ExamHistory;
import model.User;
import repository.UserRepository;
import service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    UserRepository userRepository = new UserRepository();
    @Override
    public List<User> getUserList() {
        return userRepository.getUserList();
    }

    @Override
    public List<ExamHistory> getListExamHistory(int id) {
        return userRepository.getListExamHistory(id);
    }

    @Override
    public User getUserId(int id) {
        return userRepository.getUserId(id);
    }

    @Override
    public User getUserAccount(String accountName) {
        return userRepository.getUserAccount(accountName);
    }

    @Override
    public void addUserList(User user) {
        userRepository.addUserList(user);
    }

    @Override
    public void updateUserId(User user) {
        userRepository.updateUserId(user);
    }

    @Override
    public void updateImageUserId(int id, String image) {
        userRepository.updateImageUserId(id, image);
    }

    @Override
    public void deleteUser(int id) {
        userRepository.deleteUser(id);
    }

    @Override
    public List<ExamHistory> getListExamHistoryPage(int id, int pageIndex, int pageSize) {
        return userRepository.getListExamHistoryPage(id, pageIndex,pageSize);
    }

    @Override
    public int countHistory(int id) {
        return userRepository.countHistory(id);
    }
}
