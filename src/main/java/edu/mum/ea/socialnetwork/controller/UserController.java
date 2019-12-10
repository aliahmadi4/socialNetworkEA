package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User user, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "login";
        }

        userService.save(user);
        return "index";
    }

    @GetMapping(path = "/login")
    public String home(@ModelAttribute("newUser") User user){
        return "login";
    }


    @GetMapping("/index")
    public String showINdex(){
        return "index";
    }
}
