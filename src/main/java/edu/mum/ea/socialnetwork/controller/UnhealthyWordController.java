package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.services.UnhealthyWordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.access.annotation.Secured;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/unhealthyWords")
public class UnhealthyWordController {
    private UnhealthyWordService unhealthyWordService;
    private MessageSource messageSource;

    @PostMapping(value = "/add")
    public String addUnhealthyWord(@RequestBody String newWord) {
        unhealthyWordService.addWord(newWord);
        return messageSource.getMessage("WordList.delete", null, LocaleContextHolder.getLocale());
    }

    @PostMapping(value = "/delete")
    public void deleteUnhealthyWord(@RequestBody String deletedWord) {
        unhealthyWordService.deleteWord(deletedWord);
    }

    @GetMapping("/")
    public ModelAndView unhealthyWordList() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("unhealthyWordList", unhealthyWordService.getUnhealthyWordList());
        mav.setViewName("unhealthyWords");
        return mav;
    }

    @Autowired
    public UnhealthyWordController(UnhealthyWordService unhealthyWordService, MessageSource messageSource) {
        this.unhealthyWordService = unhealthyWordService;
        this.messageSource = messageSource;
    }
}
