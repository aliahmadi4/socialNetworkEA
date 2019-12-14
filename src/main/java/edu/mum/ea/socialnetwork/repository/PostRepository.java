package edu.mum.ea.socialnetwork.repository;

import edu.mum.ea.socialnetwork.domain.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostRepository extends JpaRepository<Post, Long> {
    List<Post> findByEnabledOrderByCreationDateDesc(boolean enabled);

    @Query("update Post p set p.unhealthy=:isUnhealthy where p.id=:postId")
    void setPostUnhealthy(@Param("postId") Long postId, @Param("isUnhealthy") boolean isUnhealthy);

    @Query("select p from Post p where p.unhealthy=true")
    List<Post> findAllByUnhealthy();

    @Query("update Post p set p.enabled= :isEnabled where p.id= :postId")
    void setPostEnabled(@Param("postId") Long postId, @Param("isEnabled") boolean isEnabled);

    @Query("select p from Post p join p.user u where u.id = :id order by p.creationDate desc ")
    List<Post> findAllPostForSpecificUser(@Param("id") Long id);


}
