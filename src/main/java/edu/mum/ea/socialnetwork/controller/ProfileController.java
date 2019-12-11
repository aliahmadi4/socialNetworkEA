package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.Profile;
import edu.mum.ea.socialnetwork.repository.ProfileRepository;
import edu.mum.ea.socialnetwork.services.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.websocket.server.PathParam;

@Controller
public class ProfileController {

    @Autowired
    ProfileService profileService;

    @GetMapping("/profile/{id}")
    public ModelAndView showProfile(@PathParam("id")long id){
        Profile profile = profileService.findById(id);
        ModelAndView mav = new ModelAndView();
        mav.addObject("profile", profile);
        mav.setViewName("profile");
        return mav;
    }
}
