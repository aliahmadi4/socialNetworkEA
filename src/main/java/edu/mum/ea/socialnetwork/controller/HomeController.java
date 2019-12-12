package edu.mum.ea.socialnetwork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("/")
    public String welcome(){
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
}
