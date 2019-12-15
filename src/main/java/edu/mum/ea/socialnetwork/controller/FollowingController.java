package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.Profile;
import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.services.ProfileService;
import edu.mum.ea.socialnetwork.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.List;

@RestController
public class FollowingController {

    @Autowired
    UserService userService;

    @Autowired
    ProfileService profileService;

    @ModelAttribute("currentUser")
    public Profile profilePic(Principal principal){
        User user = userService.findUserByName(principal.getName());
        return user.getProfile();
    }


    @PostMapping(value = "/follow")
    public User follow(@RequestBody Long id, Principal principal){
        User user = userService.findUserById(id);
        User currentUser = userService.findUserByName(principal.getName());

        List<User> following = currentUser.getFollowing();
        for(User user1: following){
            if(user1.getId() == user.getId()){
                return null;
            }
        }

        currentUser.addFollowing(user);
        return userService.rawSave(currentUser);
    }


    @PostMapping(value = "/unfollow")
    public User unfollow(@RequestBody Long id, Principal principal){
        User user = userService.findUserById(id);
        User currentUser = userService.findUserByName(principal.getName());

        List<User> following = currentUser.getFollowing();
        for(User user1: following){
            if(user1.getId() == user.getId()){
               following.remove(user1);
               return userService.rawSave(currentUser);
            }
        }
        return null;
    }


    // this function display all the profiles that user doesn't follow and we call it when we go to the list of
    // profile page
    @GetMapping("/profileList")
    public ModelAndView showProfile(Principal principal){
        User currentUser = userService.findUserByName(principal.getName());
        List<Profile> profiles = profileService.unfollowedUsers(currentUser.getId());
        System.out.println(currentUser.getUsername());
        System.out.println("list" + profiles);
        ModelAndView mav = new ModelAndView();
        mav.addObject("profiles", profiles);
        mav.setViewName("profileList");
        return mav;
    }


    @PostMapping(value = "/search")
    public List<Profile> search(@RequestBody String username, Principal principal){
        User userId = userService.findUserByName(principal.getName());
        List<Profile> profiles = profileService.searchProfiles(userId.getId(), username); // this function comes form profile service
        return profiles;
    }
}
