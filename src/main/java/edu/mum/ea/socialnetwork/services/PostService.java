package edu.mum.ea.socialnetwork.services;

import edu.mum.ea.socialnetwork.domain.Post;
import org.springframework.data.domain.Page;

import java.util.List;

public interface PostService {
    Post save(Post post);

    List<Post> findPost();

    Post findPostById(Long id);

    List<Post> findAllPostForSpecificUser(Long id);

    Page<Post> allPostsPaged(int pageNo);

    List<Post> searchPosts(String text);

}
