package edu.mum.ea.socialnetwork.services;

import edu.mum.ea.socialnetwork.domain.Post;
import edu.mum.ea.socialnetwork.domain.Role;
import edu.mum.ea.socialnetwork.domain.User;

import java.util.List;

public interface AdminService {

    List<User> getUsers();

    List<User> getDeactivatedUsers();

    void toggleUser(Long userId);

    void setUserRole(Long userId, Role role);

    void setNumberOfDisapprovedPosts(Long userId, Integer noOfDisapprovedPosts);

    void setUserEnabled(Long userId, boolean isEnabled);

    boolean userIsEnabled(Long userId);

    void setPostUnhealthy(Long postId, boolean isUnhealthy);

    List<Post> getUnhealthyPosts();

    void setPostEnabled(Long postId, boolean isEnabled);
}
