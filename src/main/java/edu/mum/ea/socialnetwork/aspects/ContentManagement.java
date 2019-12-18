package edu.mum.ea.socialnetwork.aspects;

import edu.mum.ea.socialnetwork.domain.Post;
import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.services.AdminService;
import edu.mum.ea.socialnetwork.services.PostService;
import edu.mum.ea.socialnetwork.services.UnhealthyWordService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class ContentManagement {
    private UnhealthyWordService unhealthyWordService;
    private PostService postService;
    private AdminService adminService;

    @Autowired
    public ContentManagement(UnhealthyWordService unhealthyWordService, PostService postService, AdminService adminService) {
        this.unhealthyWordService = unhealthyWordService;
        this.postService = postService;
        this.adminService = adminService;
    }

    @After("execution(* edu.mum.ea.socialnetwork.controller.PostController.addPost(..))")
    public void filterUnhealthyContent(JoinPoint jp) {
        Post post = (Post) jp.getArgs()[0];
        String postText = post.getText();
        String[] postWords = postText.split(" ");
        for (String word : postWords) {
            if (unhealthyWordService.wordExists(word)) {
                adminService.setPostUnhealthy(post.getId(), true);
            }
        }
    }

    @After("execution(* edu.mum.ea.socialnetwork.controller.AdminController.processPost(..))")
    public void handleUnhealthyPost(JoinPoint jp) {
        Long postId = (Long) jp.getArgs()[0];
        boolean isApproved = (boolean)jp.getArgs()[1];
        if(!isApproved)
        {
            Post post = postService.findPostById(postId);
            User user = post.getUser();
            Long userId = user.getId();
            Integer noOfDisapprovedPosts = user.getProfile().getNoOfDisapprovedPosts() + 1;
            adminService.setNumberOfDisapprovedPosts(userId, noOfDisapprovedPosts);
            if (noOfDisapprovedPosts >= 20) {
                adminService.setUserEnabled(userId, false);
                // send email
            }}
    }
}