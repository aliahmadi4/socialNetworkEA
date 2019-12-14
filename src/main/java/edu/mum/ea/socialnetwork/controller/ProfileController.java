package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.Post;
import edu.mum.ea.socialnetwork.domain.Profile;
import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.services.PostService;
import edu.mum.ea.socialnetwork.services.ProfileImageUploadService;
import edu.mum.ea.socialnetwork.services.ProfileService;
import edu.mum.ea.socialnetwork.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.List;

@Controller
public class ProfileController {

    @Autowired
    ProfileService profileService;
    @Autowired
    UserService userService;
    @Autowired
    ProfileImageUploadService profileImageUploadService;
    @Autowired
    PostService postService;

    @ModelAttribute("currentUser")
    public Profile profilePic(Principal principal){
        User user = userService.findUserByName(principal.getName());
        return user.getProfile();
    }

    @GetMapping("/profile/{id}")
    public ModelAndView showProfile(@PathVariable("id")Long id){

        Profile profile = profileService.findById(id);
        ModelAndView mav = new ModelAndView();
        mav.addObject("profile", profile);
        List<Post> posts = postService.findPost();
        mav.addObject("posts", posts);
        mav.setViewName("profile");
        return mav;
    }

    @GetMapping("/profile/editProfile")
    public String showEditProfile(@ModelAttribute("profile") Profile profile, Principal principal){

//        Profile profile = userService.findUserByName(principal.getName()).getProfile();
//        model.addAttribute("profile",profile);
        return "editProfile";
    }

    @PostMapping("/profile/profilePhotoUpload")
    public String singleFileUpload(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes, Principal principal) {

        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return "redirect:/profile/myProfile";
        }

        String filename = profileImageUploadService.uploadImage(file);
        User user = userService.findUserByName(principal.getName());
        user.getProfile().setProfilePhoto(filename);
        userService.update(user);

        return "redirect:/profile/myProfile";
    }


    @PostMapping("/profile")
    public String updateProfile(@Valid @ModelAttribute Profile profile, BindingResult bindingResult, Principal principal){
        if(bindingResult.hasErrors()){
            return "editProfile";
        }
        User user = userService.findUserByName(principal.getName());
        user.setProfile(profile);
        userService.update(user);
        return "redirect:/profile/myProfile";
    }

    @GetMapping("/profile/myProfile")
    public String showMyProfile(Model model,Principal principal){
        User me = userService.findUserByName(principal.getName());
//        model.addAttribute("profile", me.getProfile());
        return "redirect:/profile/"+me.getId();
    }

    @PostMapping("/profile/changePassword")
    public String changePassword(@ModelAttribute Profile profile, @RequestParam("new-password") String password, @RequestParam("repeat-password") String repeat, Model model, Principal principal){
        if(!password.equals(repeat)){
            model.addAttribute("passwordError", "Password does not match!");
            return "editProfile";
        }
        if(password.equals("")){
            model.addAttribute("passwordError", "Password can not be empty!");
            return "editProfile";
        }

        User currentUser = userService.findUserByName(principal.getName());
        currentUser.setPassword(password);
        userService.save(currentUser);
        return "redirect:/profile/myProfile";
    }


    @GetMapping("/test")
    public String test(){
        return "test";
    }

    @PostMapping("/test")
    public String test3(){

        return "redirect:/index";
    }


}
