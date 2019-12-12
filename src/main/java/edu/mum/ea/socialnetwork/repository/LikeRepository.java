package edu.mum.ea.socialnetwork.repository;

import edu.mum.ea.socialnetwork.domain.Likes;
import edu.mum.ea.socialnetwork.domain.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository


public interface LikeRepository extends JpaRepository<Likes, Long> {
//    List<Post> findByEnabledOrderByCreationDateDesc(boolean enabled);


}
