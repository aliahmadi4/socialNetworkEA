package edu.mum.ea.socialnetwork.services.impl;

import java.util.List;

import edu.mum.ea.socialnetwork.domain.Post;
import edu.mum.ea.socialnetwork.domain.Profile;
import edu.mum.ea.socialnetwork.domain.Role;
import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.repository.PostRepository;
import edu.mum.ea.socialnetwork.repository.ProfileRepository;
import edu.mum.ea.socialnetwork.repository.UserRepository;
import edu.mum.ea.socialnetwork.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    private UserRepository userRepository;
    private ProfileRepository profileRepository;
    private PostRepository postRepository;

    @Autowired
    public AdminServiceImpl(UserRepository userRepository, ProfileRepository profileRepository, PostRepository postRepository) {
        this.userRepository = userRepository;
        this.profileRepository = profileRepository;
        this.postRepository = postRepository;
    }

    @Override
    public List<User> getUsers() {
        return userRepository.findAll();
    }

    @Override
    public List<User> getDeactivatedUsers() {
        return userRepository.findUsersByEnabledIs(false);
    }

    @Override
    public void toggleUser(Long userId) {
        User user = userRepository.getOne(userId);
        userRepository.setUserEnabled(userId, !user.isEnabled());
    }

    @Override
    public void setUserRole(Long userId, Role role) {
        User user = userRepository.getOne(userId);
        user.setRole(role);
        userRepository.save(user);
    }

    @Override
    public void setNumberOfDisapprovedPosts(Long userId, Integer noOfDisapprovedPosts) {
        Profile profile = profileRepository.getByUserId(userId);
        profileRepository.setNumberOfDisapprovedPosts(profile.getId(), noOfDisapprovedPosts);
    }

    @Override
    public void setUserEnabled(Long userId, boolean isEnabled) {
        userRepository.setUserEnabled(userId, isEnabled);
    }

    @Override
    public boolean userIsEnabled(Long userId) {
        return userRepository.getOne(userId).isEnabled();
    }

    @Override
    public void setPostUnhealthy(Long postId, boolean isUnhealthy) {
        postRepository.setPostUnhealthy(postId, isUnhealthy);
    }

    @Override
    public List<Post> getUnhealthyPosts() {
        return postRepository.findAllByUnhealthy(true);
    }

    @Override
    public void setPostEnabled(Long postId, boolean isEnabled) {
        postRepository.setPostEnabled(postId, isEnabled);
    }

}