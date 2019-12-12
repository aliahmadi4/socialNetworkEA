package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.UnhealthyWord;
import edu.mum.ea.socialnetwork.services.UnhealthyWordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/unhealthyWords")
public class UnhealthyWordController {
    private UnhealthyWordService unhealthyWordService;

    @GetMapping(value = "/add")
    public String getUnhealthyWord(@ModelAttribute("unhealthyWord") UnhealthyWord unhealthyWord, Model model) {
        return "addUnhealthyWord";
    }

    @PostMapping(value = "/add")
    public String addUnhealthyWord(@Valid @ModelAttribute("unhealthyWord") UnhealthyWord unhealthyWord,
                                   BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "/add";
        }
        unhealthyWordService.addWord(unhealthyWord.getWord());
        return "redirect:/wordAdded";
    }

    @GetMapping("/wordAdded")
    public String unhealthyWordList(@ModelAttribute("unhealthyWordList") List<UnhealthyWord> unhealthyWordList, Model model) {
        unhealthyWordList = unhealthyWordService.getUnhealthyWordList();
        return "/unhealthyWords";
    }

    @Autowired
    public UnhealthyWordController(UnhealthyWordService unhealthyWordService) {
        this.unhealthyWordService = unhealthyWordService;
    }
}
