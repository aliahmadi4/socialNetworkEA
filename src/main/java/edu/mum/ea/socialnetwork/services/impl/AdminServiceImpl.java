package edu.mum.ea.socialnetwork.services.impl;

import edu.mum.ea.socialnetwork.domain.Role;
import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.repository.UserRepository;
import edu.mum.ea.socialnetwork.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    private UserRepository userRepository;

    @Autowired
    public AdminServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public List<User> getUsers() {
        return userRepository.findAll();
    }

    @Override
    public List<User> getDeactivatedUsers() {
        return userRepository.findUsersByEnabled(false);
    }

    @Override
    public void activateUser(Long userId) {
        userRepository.setUserActive(userId, true);
    }

    @Override
    public void deactivateUser(Long userId) {
        userRepository.setUserActive(userId, false);
    }

    @Override
    public void setUserRole(Long userId, Role role) {
        User user = userRepository.getOne(userId);
//        user.setRoles(role);
        userRepository.save(user);
    }

}