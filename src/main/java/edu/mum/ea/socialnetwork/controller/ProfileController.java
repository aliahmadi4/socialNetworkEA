package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.Notification;
import edu.mum.ea.socialnetwork.domain.Post;
import edu.mum.ea.socialnetwork.domain.Profile;
import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.services.*;
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

    @Autowired
    NotificationService notificationService;

    @ModelAttribute("currentUser")
    public Profile currentUser(Principal principal){
        User user = userService.findUserByName(principal.getName());
        return user.getProfile();
    }

    @GetMapping("/profile/{id}")
    public String showProfile(@PathVariable("id")Long id, Principal principal, Model model){

        Profile profile = profileService.findById(id);

        if(profile==null){
            return "redirect:/";
        }
        model.addAttribute("profile", profile);

        //check if this user is followed or not  0->notFollwed  1=>followed  -1->his/her Profile
        int follow = 0;
        if(id==currentUser(principal).getId()) follow=-1;
        List<User> following = currentUser(principal).getUser().getFollowing();
        for(User user: following){
            if(id==user.getId()) follow = 1;
        }
        model.addAttribute("follow", follow);
        List<Post> posts = postService.findAllPostForSpecificUser(id);
        model.addAttribute("posts", posts);

        User user = userService.findUserByName(principal.getName());
        List<Notification> notifications = notificationService.findNotificationByUserId(user.getId());
        System.out.println("All Notifications"+ notifications.size());
        model.addAttribute("notifications", notifications);
        return "profile";
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


    // following GetMapping functions are use for changing language because after changing the language we do a get
    // request and if we don't have this get mapping method it will throw 400 error
    @GetMapping("/profile")
    public String redirectToProfile(@Valid @ModelAttribute Profile profile, BindingResult bindingResult, Principal principal) {
        return "editProfile";
    }

    @GetMapping("/profile/profilePhotoUpload")
    public String redirectToPhotoUpload(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes, Principal principal) {
        return "editProfile";
    }

    @GetMapping("/profile/changePassword")
    public String redirectToChangePass(@ModelAttribute Profile profile, @RequestParam("new-password") String password, @RequestParam("repeat-password") String repeat, Model model, Principal principal) {
        return "editProfile";
    }
}
