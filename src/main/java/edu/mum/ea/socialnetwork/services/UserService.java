package edu.mum.ea.socialnetwork.services;

import edu.mum.ea.socialnetwork.domain.User;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {
    User save(User user);
    User findUserById(Long id);

    User findByUsername(String username);
    User findUserByName(String name);
}
