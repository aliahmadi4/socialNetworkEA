package edu.mum.ea.socialnetwork.repository;

import edu.mum.ea.socialnetwork.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);

    @Query("select u from User u join u.profile p where p.isMalicious=true and u.enabled=true")
    List<User> findUsersByMaliciousAndEnabled();

    List<User> findUsersByEnabled(boolean enabled);

    @Query("update User u set u.enabled =: enabled where u.id =: userId")
    void setUserActive(@Param("userId") Long userId, @Param("enabled") boolean enabled);


}
