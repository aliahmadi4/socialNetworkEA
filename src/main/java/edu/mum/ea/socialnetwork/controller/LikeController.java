package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.Likes;
import edu.mum.ea.socialnetwork.domain.Post;
import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.services.LikeService;
import edu.mum.ea.socialnetwork.services.PostService;
import edu.mum.ea.socialnetwork.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.security.Principal;

@RestController
public class LikeController {

    @Autowired
    PostService postService;

    @Autowired
    LikeService likeService;

    @Autowired
    UserService userService;

    @PostMapping(value = "/addlike")
    public Likes addLike(@RequestBody Long id, Principal principal) {
        System.out.println("I am inside addLike method" + id);

        System.out.println(principal.getName());
        User currentUser = userService.findUserByName(principal.getName());

        Post post = postService.findPostById(id);
        Likes likes = new Likes();

        likes.setUser(currentUser);
        likes.addPost(post);
        return likeService.save(likes);

    }


}
