package edu.mum.ea.socialnetwork.services.impl;

import edu.mum.ea.socialnetwork.domain.Post;
import edu.mum.ea.socialnetwork.repository.PostRepository;
import edu.mum.ea.socialnetwork.services.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostServiceImpl implements PostService {

    @Autowired
    PostRepository postRepository;

    public Post save(Post post) {
        return postRepository.save(post);
    }

    public List<Post> findPost() {
        return postRepository.findByEnabledOrderByCreationDateDesc(true);
    }

    public Post findPostById(Long id) {
        return postRepository.getOne(id);
    }

    @Override
    public List<Post> findAllPostForSpecificUser(Long id) {
       return postRepository.findAllPostForSpecificUser(id);
    }

    @Override
    public Page<Post> allPostsPaged(int pageNo){
        return postRepository.findAll(PageRequest.of(pageNo, 5, Sort.by("creationDate").descending()));
    }

}
