package edu.mum.ea.socialnetwork.services;

import edu.mum.ea.socialnetwork.domain.User;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {
    public User save(User user);

    public User findUserByName(String name);
}
