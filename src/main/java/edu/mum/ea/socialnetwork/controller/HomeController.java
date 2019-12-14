package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.Post;
import edu.mum.ea.socialnetwork.domain.Profile;
import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.services.PostService;
import edu.mum.ea.socialnetwork.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;


import java.security.Principal;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    UserService userService;

    @Autowired
    PostService postService;


    @ModelAttribute("currentUser")
    public Profile profilePic(Principal principal){
        User user = userService.findUserByName(principal.getName());
        return user.getProfile();
    }

    @GetMapping("/")
    public String post(@ModelAttribute("addPost") Post post, Model model) {
        List<Post> allPost = postService.findPost();
        Page<Post> posts = postService.allPostsPaged(1);
        for(Post p: posts){
            System.out.println("p: "+ p);
        }
        model.addAttribute("allPost", allPost);
//        System.out.println("POST PAGE: " + allPost.size());

        return "index";
    }









    @GetMapping("/error")
    public String showErrorPage(){
        return "error";
    }

    @GetMapping("/index")
    public String showIndex(){
        return "index";
    }

    @GetMapping("/denied")
    public String denied(){
        return "denied";
    }
}
