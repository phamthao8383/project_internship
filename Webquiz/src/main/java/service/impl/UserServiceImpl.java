package service.impl;

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
    public Integer getIdMax() {
        return userRepository.getIdMax();
    }

    @Override
    public User getUserId(int id) {
        return userRepository.getUserId(id);
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
    public void deleteUser(int id) {
        userRepository.deleteUser(id);
    }
}
