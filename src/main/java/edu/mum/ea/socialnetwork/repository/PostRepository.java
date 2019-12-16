package edu.mum.ea.socialnetwork.repository;

import edu.mum.ea.socialnetwork.domain.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostRepository extends JpaRepository<Post, Long> {
    List<Post> findByEnabledOrderByCreationDateDesc(boolean enabled);

    @Modifying(flushAutomatically = true)
    @Query("update Post p set p.unhealthy=:isUnhealthy where p.id=:postId")
    void setPostUnhealthy(@Param("postId") Long postId, @Param("isUnhealthy") boolean isUnhealthy);

    List<Post> findAllByUnhealthy(boolean isUnhealthy);

    @Modifying(flushAutomatically = true)
    @Query("update Post p set p.enabled= :isEnabled where p.id= :postId")
    void setPostEnabled(@Param("postId") Long postId, @Param("isEnabled") boolean isEnabled);

    @Query("select p from Post p join p.user u where u.id = :id order by p.creationDate desc ")
    List<Post> findAllPostForSpecificUser(@Param("id") Long id);

    List<Post>findAllByUserIdOrderByCreationDateDesc(@Param("id") Long id);

    //Search posts
    List<Post> findPostsByTextContaining(String text);
}
