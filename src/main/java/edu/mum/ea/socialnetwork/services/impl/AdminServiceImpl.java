package edu.mum.ea.socialnetwork.services.impl;

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
    public List<User> getDeactivatedUsers() {
        return userRepository.findUsersByEnabled(false);
    }

    @Override
    public List<User> getMaliciousUsers() {
        return userRepository.findUsersByMaliciousAndEnabled();
    }

    @Override
    public void activateUsers(List<Long> userIds) {
        for (Long userId : userIds) {
            userRepository.setUserActive(userId, true);
        }
    }

    @Override
    public void deactivateUsers(List<Long> userIds) {
        for (Long userId : userIds) {
            userRepository.setUserActive(userId, false);
        }
    }
}