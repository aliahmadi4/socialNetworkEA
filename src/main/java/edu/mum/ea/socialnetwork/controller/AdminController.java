package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.Role;
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
        model.addAttribute("userList", adminService.getDeactivatedUsers());
        return "userList";
    }

    @PostMapping("/activateUser")
    public void activateUsers(@RequestBody Long userId) {
        adminService.activateUser(userId);
    }

    @GetMapping("/manageUserRoles")
    public String getUsers(Model model) {
        model.addAttribute("userList", adminService.getUsers());
        return "userList";
    }

    @PostMapping("/setUserRole")
    public void setUserRole(@RequestBody Long userId, Role role) {
        adminService.setUserRole(userId, role);
    }

    @GetMapping("/unhealthyPosts")
    public String getUnhealthyPosts(Model model) {
        model.addAttribute("postList", adminService.getUnhealthyPosts());
        return "unhealthyPosts";
    }

    @PostMapping("/postApproval")
    public void processPost(@RequestBody Long postId, boolean isApproved) {
        adminService.setPostEnabled(postId, isApproved);
    }
}
