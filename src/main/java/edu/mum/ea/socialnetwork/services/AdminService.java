package edu.mum.ea.socialnetwork.services;

import edu.mum.ea.socialnetwork.domain.Role;
import edu.mum.ea.socialnetwork.domain.User;
import java.util.List;

public interface AdminService {

    List<User> getUsers();

    List<User> getDeactivatedUsers();

    void activateUser(Long userId);

    void deactivateUser(Long userId);

    void setUserRole(Long userId, Role role);

}
