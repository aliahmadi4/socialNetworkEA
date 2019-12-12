package edu.mum.ea.socialnetwork.repository;

import edu.mum.ea.socialnetwork.domain.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository


public interface PostRepository extends JpaRepository<Post, Long> {
    List<Post> findByEnabledOrderByCreationDateDesc(boolean enabled);
}
