package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.Role;
import edu.mum.ea.socialnetwork.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
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

    @Secured("ROLE_ADMIN")
    @GetMapping("/deactivatedUsers")
    public String getDeactivatedUsers(Model model) {
        model.addAttribute("userList", adminService.getDeactivatedUsers());
        return "userList";
    }

    @Secured("ROLE_ADMIN")
    @PostMapping("/activateUser")
    public void activateUsers(@RequestBody Long userId) {
        adminService.activateUser(userId);
    }

    @GetMapping("/manageUserRoles")
    @Secured("ROLE_ADMIN")
    public String getUsers(Model model) {
        model.addAttribute("userList", adminService.getUsers());
        return "userList";
    }

    @Secured("ROLE_ADMIN")
    @PostMapping("/setUserRole")
    public void setUserRole(@RequestParam Long userId, @RequestParam Role role) {
        adminService.setUserRole(userId, role);
    }

    @Secured({"ROLE_ADMIN", "ROLE_CONTENT_MANAGER"})
    @GetMapping("/unhealthyPosts")
    public String getUnhealthyPosts(Model model) {
        model.addAttribute("postList", adminService.getUnhealthyPosts());
        return "unhealthyPosts";
    }

    @Secured({"ROLE_ADMIN", "ROLE_CONTENT_MANAGER"})
    @PostMapping("/postApproval")
    public void processPost(@RequestParam Long postId, @RequestParam boolean isApproved) {
        adminService.setPostEnabled(postId, isApproved);
    }
}
