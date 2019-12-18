package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.Role;
import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Locale;

@RestController
@RequestMapping(value = "/admin")
public class AdminController {

    private AdminService adminService;
    private MessageSource messageSource;

    @Autowired
    public AdminController(AdminService adminService, MessageSource messageSource) {
        this.adminService = adminService;
        this.messageSource = messageSource;
    }

    @Secured("ROLE_ADMIN")
    @GetMapping("/deactivatedUsers")
    public ModelAndView getDeactivatedUsers() {
        ModelAndView mav = new ModelAndView();
        List<User> users = adminService.getDeactivatedUsers();
        mav.addObject("userList", adminService.getDeactivatedUsers());
        mav.setViewName("userList");
        return mav;
    }

    @Secured("ROLE_ADMIN")
    @PostMapping("/toggleUser")
    public String toggleUser(@RequestBody Long userId) {
        adminService.toggleUser(userId);
        if (adminService.userIsEnabled(userId)) {
            return messageSource.getMessage("UserList.Enable", null, LocaleContextHolder.getLocale());
        }
        // reset counter of disapproved posts because user will be re-enabled.
        adminService.setNumberOfDisapprovedPosts(userId,0);
        return messageSource.getMessage("UserList.Disable", null, LocaleContextHolder.getLocale());
    }

    @GetMapping("/manageUserRoles")
    @Secured("ROLE_ADMIN")
    public ModelAndView getUsers() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("userList", adminService.getUsers());
        mav.setViewName("userList");
        return mav;
    }

    @Secured("ROLE_ADMIN")
    @PostMapping("/setUserRole")
    public String setUserRole(@RequestParam Long userId, @RequestParam Role role) {
        adminService.setUserRole(userId, role);
        String newRole;
        if (role == Role.ROLE_ADMIN) {
            newRole = "UserList.SetAdmin";
        } else if (role == Role.ROLE_CONTENT_MANAGER) {
            newRole = "UserList.SetContentManager";
        } else if (role == Role.ROLE_MARKETING_MANAGER) {
            newRole = "UserList.SetMarketingManager";
        } else {
            newRole = "UserList.SetUser";
        }
        return messageSource.getMessage(newRole, null, LocaleContextHolder.getLocale());
    }

    @Secured({"ROLE_ADMIN", "ROLE_CONTENT_MANAGER"})
    @GetMapping("/unhealthyPosts")
    public ModelAndView getUnhealthyPosts(Model model) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("postList", adminService.getUnhealthyPosts());
        mav.setViewName("unhealthyPosts");
        return mav;
    }

    @Secured({"ROLE_ADMIN", "ROLE_CONTENT_MANAGER"})
    @PostMapping("/postApproval")
    @ResponseStatus(value = HttpStatus.OK)
    public void processPost(@RequestParam Long postId, @RequestParam boolean isApproved) {
        adminService.setPostUnhealthy(postId, false); //post has been already procesed and doesn't need to appear on UI anymore.
        adminService.setPostEnabled(postId, isApproved);
    }
}
