package edu.mum.ea.socialnetwork.services;

import edu.mum.ea.socialnetwork.domain.User;
import java.util.List;

public interface AdminService {

    List<User> getDeactivatedUsers();

    List<User> getMaliciousUsers();

    void activateUsers(List<Long> userIds);

    void deactivateUsers(List<Long> userIds);
}
