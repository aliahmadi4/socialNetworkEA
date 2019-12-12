package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.Profile;
import edu.mum.ea.socialnetwork.repository.ProfileRepository;
import edu.mum.ea.socialnetwork.services.ProfileService;
import edu.mum.ea.socialnetwork.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.websocket.server.PathParam;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;

@Controller
public class ProfileController {

    @Autowired
    ProfileService profileService;
    @Autowired
    UserService userService;

    private static String UPLOADED_FOLDER = "C://temp//";

    @GetMapping("/profile/{id}")
    public ModelAndView showProfile(@PathVariable("id")Long id){
        Profile profile = profileService.findById(id);
        ModelAndView mav = new ModelAndView();
        mav.addObject("profile", profile);
        mav.setViewName("profile");
        return mav;
    }

    @GetMapping("/profile/editProfile")
    public String showEditProfile(Model model, Principal principal){
        System.out.println(principal.getName());
        Profile profile1 = userService.findByUsername(principal.getName()).getProfile();
        model.addAttribute("profile",profile1);
        return "editProfile";
    }

    @PostMapping("/profilePhotoUpload")
    public String singleFileUpload(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {

        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return "redirect:uploadStatus";
        }

        try {

            // Get the file and save it somewhere
            byte[] bytes = file.getBytes();
            Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
            Files.write(path, bytes);

            redirectAttributes.addFlashAttribute("message", "You successfully uploaded '" + file.getOriginalFilename() + "'");

        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/uploadStatus";
    }

    @GetMapping("/uploadStatus")
    public String uploadStatus() {
        return "uploadStatus";
    }

    @PostMapping("/profile")
    public String updateProfile(){
        return "index";
    }
}
