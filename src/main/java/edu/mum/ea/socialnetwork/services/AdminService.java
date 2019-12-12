package edu.mum.ea.socialnetwork.services;

import edu.mum.ea.socialnetwork.domain.User;
import java.util.List;

public interface AdminService {

    List<User> getDeactivatedUsers();

    void activateUser(Long userId);

    void deactivateUser(Long userId);

}
