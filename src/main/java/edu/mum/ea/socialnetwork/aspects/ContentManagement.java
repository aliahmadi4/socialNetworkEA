package edu.mum.ea.socialnetwork.aspects;

import edu.mum.ea.socialnetwork.domain.Post;
import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.services.AdminService;
import edu.mum.ea.socialnetwork.services.PostService;
import edu.mum.ea.socialnetwork.services.UnhealthyWordService;
import edu.mum.ea.socialnetwork.services.MailService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDate;

@Aspect
@Component
public class ContentManagement {
    private UnhealthyWordService unhealthyWordService;
    private PostService postService;
    private AdminService adminService;
    private MailService mailService;

    @Autowired
    public ContentManagement(UnhealthyWordService unhealthyWordService, PostService postService,
                             AdminService adminService, MailService mailService) {
        this.unhealthyWordService = unhealthyWordService;
        this.postService = postService;
        this.adminService = adminService;
        this.mailService = mailService;
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
        boolean isApproved = (boolean) jp.getArgs()[1];
        if (!isApproved) {
            Post post = postService.findPostById(postId);
            User user = post.getUser();
            Long userId = user.getId();
            //1. Update No. of dispproved posts for the user of the currently disapproved post
            Integer noOfDisapprovedPosts = user.getProfile().getNoOfDisapprovedPosts() + 1;
            adminService.setNumberOfDisapprovedPosts(userId, noOfDisapprovedPosts);
            //2. Deactivate malicious user:
            if (noOfDisapprovedPosts >= 20) {
                adminService.setUserEnabled(userId, false);
                // Prepare email to send to deactivated user:
                String emailSubject = "ASAL Social Network - Deactivation Notice";
                String emailBody = "Dear " + user.getProfile().getFirstName() + " " + user.getProfile().getLastName() + ",\n\n" +
                        "This is a notification that your account has been deactivated for violation of our society rules. " +
                        "You have posted at least 20 posts that contain at least one word that is considered unhealthy for our society.\n\n" +
                        "If you think this is a mistake, please contact us at asal.sn.2019@gmail.com. An admin will study your case and will " +
                        "Re-activate your account if you were found correct.\n\n" +
                        "Please accept our apologies for any inconvenience caused.\n\n" +
                        "Best regards,\n\n" +
                        "ASAL Social Network team \n\n\n\n" +
                        "(c) Copyright ASAL Social Network " + LocalDate.now().getYear();
                //3. Send deactivation notification:
                mailService.sendEmail(user, emailSubject, emailBody);
            }
        }
    }
}