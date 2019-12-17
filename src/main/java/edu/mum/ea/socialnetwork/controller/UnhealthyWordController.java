package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.UnhealthyWord;
import edu.mum.ea.socialnetwork.services.UnhealthyWordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@Secured({"ADMIN", "CONTENT_MANAGER"})
@RequestMapping("/unhealthyWords")
public class UnhealthyWordController {
    private UnhealthyWordService unhealthyWordService;

    @GetMapping(value = "/add")
    public String getUnhealthyWord(@ModelAttribute("unhealthyWord") UnhealthyWord unhealthyWord, Model model) {
        return "addUnhealthyWord";
    }

    @PostMapping(value = "/add")
    public void addUnhealthyWord(@RequestBody String newWord) {
        unhealthyWordService.addWord(newWord);
    }

    @PostMapping(value = "/delete")
    public void deleteUnhealthyWord(@RequestBody String newWord) {
        unhealthyWordService.deleteWord(newWord);
    }

    @GetMapping(value = "/")
    public ModelAndView unhealthyWordList(Model model) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("unhealthyWordList", unhealthyWordService.getUnhealthyWordList());
        mav.setViewName("unhealthyWords");
        return mav;
    }

    @Autowired
    public UnhealthyWordController(UnhealthyWordService unhealthyWordService) {
        this.unhealthyWordService = unhealthyWordService;
    }
}
