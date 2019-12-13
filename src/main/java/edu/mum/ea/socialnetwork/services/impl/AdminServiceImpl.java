package edu.mum.ea.socialnetwork.services.impl;

import edu.mum.ea.socialnetwork.domain.Post;
import edu.mum.ea.socialnetwork.domain.Role;
import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.repository.PostRepository;
import edu.mum.ea.socialnetwork.repository.UserRepository;
import edu.mum.ea.socialnetwork.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    private UserRepository userRepository;
    private PostRepository postRepository;

    @Autowired
    public AdminServiceImpl(UserRepository userRepository, PostRepository postRepository) {
        this.userRepository = userRepository;
        this.postRepository = postRepository;
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
        userRepository.setUserEnabled(userId, true);
    }

    @Override
    public void deactivateUser(Long userId) {
        userRepository.setUserEnabled(userId, false);
    }

    @Override
    public void setUserRole(Long userId, Role role) {
        User user = userRepository.getOne(userId);
        user.setRole(role);
        userRepository.save(user);
    }

    @Override
    public void setNoOfUnhealthyPosts(Long userId, Integer num) {
        userRepository.setNumberOfDisapprovedPosts(userId, num);
    }

    @Override
    public void setNumberOfDisapprovedPosts(Long userId, Integer noOfDisapprovedPosts) {
        userRepository.setNumberOfDisapprovedPosts(userId, noOfDisapprovedPosts);
    }

    @Override
    public void setUserEnabled(Long userId, boolean isEnabled) {
        userRepository.setUserEnabled(userId, isEnabled);
    }

    @Override
    public void setPostUnhealthy(Long postId, boolean isUnhealthy) {
        postRepository.setPostUnhealthy(postId, isUnhealthy);
    }

    @Override
    public List<Post> getUnhealthyPosts() {
        return postRepository.findAllByUnhealthy();
    }

    @Override
    public void setPostEnabled(Long postId, boolean isEnabled) {
        postRepository.setPostEnabled(postId, isEnabled);
    }

}