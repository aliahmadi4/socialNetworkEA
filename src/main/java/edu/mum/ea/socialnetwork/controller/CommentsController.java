package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.Comments;
import edu.mum.ea.socialnetwork.domain.Post;
import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.services.CommentsService;
import edu.mum.ea.socialnetwork.services.PostService;
import edu.mum.ea.socialnetwork.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
public class CommentsController {

    @Autowired
    PostService postService;

    @Autowired
    CommentsService commentsService;

    @Autowired
    UserService userService;

    @PostMapping(value = "/addComment")
    public Comments addComment(@RequestParam Long postId, @RequestParam String text, Principal principal){
        System.out.println("___________I am inside addComment method" + postId + " : " + text );

        System.out.println(principal.getName());
        User currentUser = userService.findUserByName(principal.getName());
//        Long id = Long.parseLong(String.valueOf(1));
        System.out.println("ID_____: " + postId);
        Post post = postService.findPostById(postId);
        Comments comment = new Comments();
        comment.setText(text);
//
        comment.setUser(currentUser);
        comment.addPost(post);
        return commentsService.save(comment);

//        return "success";

    }



}
