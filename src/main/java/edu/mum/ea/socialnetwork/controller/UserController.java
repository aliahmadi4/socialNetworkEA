package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.Role;
import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.Arrays;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @GetMapping("/login")
    public String login(@ModelAttribute("newUser") User user, @ModelAttribute("login")User user2){
        return "login";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User user , BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "login";
        }
        user.setRoles(Arrays.asList(new Role("ROLE_ADMIN")));
        userService.save(user);
        return "index";
    }

//    @PostMapping("/custom")
//    public String home(){
//        if (bindingResult.hasErrors()){
//            System.out.println("Erorr");
//            return "login";
//        }
//        System.out.println(user.getUserName() + " " + user.getPassword());
//        UserDetails userDetails = userService.loadUserByUsername(user.getUserName());
//        System.out.println("this is the user name: " + userDetails.getUsername());
//        if(userDetails != null){
//
//            System.out.println("this is the user name: " + userDetails.getUsername());
//            return "index";
//        }
//        System.out.println("inside of the methodS");
//        return "login";
//    }

    @GetMapping("/")
    public String welcome(){
        return "index";
    }

    @GetMapping("/error")
    public String showErrorPage(){
        return "error";
    }
}
