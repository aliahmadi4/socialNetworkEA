package edu.mum.ea.socialnetwork.aspects;

import edu.mum.ea.socialnetwork.domain.Profile;
import edu.mum.ea.socialnetwork.repository.UnhealthyWordRepository;
import edu.mum.ea.socialnetwork.services.UnhealthyWordService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Aspect
@Component
public class ContentManagement {
//    @Autowired
//    private UnhealthyWordService unhealthyWordService;

//    @After("execution(* edu.mum.ea.socialnetwork.controller.*.*(..))")//PostController.doPost(..))")
//    public void filterUnhealthyContent(JoinPoint jp) {
//        String postText = (String) jp.getArgs()[0];
//        String[] postWords = postText.split(" ");
//        for (String word : postWords) {
//            if (unhealthyWordService.wordExists(word)) {
//                set post unhealthy.
//            }
//        }
//    }
}
