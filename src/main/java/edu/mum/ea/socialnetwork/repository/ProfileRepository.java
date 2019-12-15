package edu.mum.ea.socialnetwork.repository;

import edu.mum.ea.socialnetwork.domain.Profile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.util.pattern.PathPatternRouteMatcher;

import java.util.List;

@Repository
public interface ProfileRepository extends JpaRepository<Profile, Long> {

    // this query used in Following Controller to search profiles according to their first name
//    @Query("from Profile p where p.firstName like :name%")
    @Query(value = "SELECT * FROM `profile` left JOIN `user_following` on profile.id = user_following.user WHERE " +
            "profile.id != :id AND profile.id NOT IN (SELECT following FROM  `user_following` WHERE user = :id) " +
            " and profile.first_name LIKE :name% GROUP BY profile.id", nativeQuery = true)
    List<Profile> searchProfiles(@Param("id") Long id, @Param("name") String name);

    @Query(value = "SELECT * FROM `profile` left JOIN `user_following` on profile.id = user_following.user WHERE " +
            "profile.id != :id AND profile.id NOT IN (SELECT following FROM  `user_following` WHERE user = :id) " +
            "GROUP BY profile.id", nativeQuery = true)
    List<Profile> unfollowedUsers(@Param("id") Long id);
}
