package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.Likes;
import edu.mum.ea.socialnetwork.domain.Post;
import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.services.FileUploadService;
import edu.mum.ea.socialnetwork.services.LikeService;
import edu.mum.ea.socialnetwork.services.PostService;
import edu.mum.ea.socialnetwork.services.UserService;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.List;

@RestController
public class LikeController {

    @Autowired
    PostService postService;

    @Autowired
    LikeService likeService;

    @Autowired
    UserService userService;

    @PostMapping(value = "/addlike")
    public Likes addLike(@RequestBody Long id, Principal principal){
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
