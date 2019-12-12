package edu.mum.ea.socialnetwork.services.impl;

import edu.mum.ea.socialnetwork.domain.Post;
import edu.mum.ea.socialnetwork.repository.PostRepository;
import edu.mum.ea.socialnetwork.repository.UserRepository;
import edu.mum.ea.socialnetwork.services.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class PostServiceImpl implements PostService {

    @Autowired
    PostRepository postRepository;

    public Post save(Post post){
        return postRepository.save(post);
    }

    public List<Post> findPost(){
        return postRepository.findByEnabledOrderByCreationDateDesc(true);
    }

    public Post findPostById(Long id) {
        return postRepository.getOne(id);
    }

}
