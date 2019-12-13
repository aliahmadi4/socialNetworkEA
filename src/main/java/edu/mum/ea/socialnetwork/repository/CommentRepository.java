package edu.mum.ea.socialnetwork.repository;

import edu.mum.ea.socialnetwork.domain.Comments;
import edu.mum.ea.socialnetwork.domain.Likes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository


public interface CommentRepository extends JpaRepository<Comments, Long> {
//    List<Post> findByEnabledOrderByCreationDateDesc(boolean enabled);


}
