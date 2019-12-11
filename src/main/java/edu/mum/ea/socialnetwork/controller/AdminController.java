package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/maliciousUsers")
    public String getMaliciousUsers(Model model) {
        model.addAttribute("userList", adminService.getMaliciousUsers());
        return "userList";
    }

    @PostMapping("/deactivateUsers")
    public String deactivateUsers(@ModelAttribute("userList") List<User> users, Model model, RedirectAttributes redirectAttributes) {
        List<Long> userIds = new ArrayList<>();
        for (User u : users) {
            userIds.add(u.getId());
        }
        adminService.deactivateUsers(userIds);
        redirectAttributes.addFlashAttribute(userIds);
        return "redirect:/confirmProcessedUsers";
    }

    @GetMapping("/deactivatedUsers")
    public String getDeactivatedUsers(Model model) {
        model.addAttribute(adminService.getDeactivatedUsers());
        return "userList";
    }

    @PostMapping("/activateUsers")
    public String activateUsers(@ModelAttribute("userList") List<User> users, Model model, RedirectAttributes redirectAttributes) {
        List<Long> userIds = new ArrayList<>();
        for (User u : users) {
            userIds.add(u.getId());
        }
        adminService.activateUsers(userIds);
        redirectAttributes.addFlashAttribute(userIds);
        return "redirect:/confirmProcessedUsers";
    }

    @GetMapping("/confirmProcessedUsers")
    public String confirmProcessedUsers(Model model) {
        return "processedUsers";
    }
}
