package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    private AdminService adminService;

    @Autowired
    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    @GetMapping("/deactivatedUsers")
    public String getDeactivatedUsers(Model model) {
        model.addAttribute(adminService.getDeactivatedUsers());
        return "userList";
    }

    @PostMapping("/activateUser/{userId}")
    public void activateUsers(@PathVariable("userId") Long userId) {
        adminService.activateUser(userId);
    }
}
