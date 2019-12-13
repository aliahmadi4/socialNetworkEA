package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.Advertisement;
import edu.mum.ea.socialnetwork.services.AdvertisementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdvertisementController {
    private AdvertisementService advertisementService;

    @Autowired
    public AdvertisementController(AdvertisementService advertisementService) {
        this.advertisementService = advertisementService;
    }

    @GetMapping("/adsList")
    public String getAdvertisementsList(Model model) {
        model.addAttribute(advertisementService.getAdList());
        return "adsList";
    }

    @GetMapping("/createAd")
    public String newAd(Model model) {
        model.addAttribute("newAd", new Advertisement());
        return "createNewAd";
    }

    @PostMapping("/createAd")
    public String createAd(@ModelAttribute("newAd") Advertisement advertisement, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "/createAd";
        }
        redirectAttributes.addFlashAttribute("newAd", advertisement);
        return "redirect:/confirmNewAd";
    }

    @GetMapping("/confirmNewAd")
    public String adCreated(Model model) {
        return "showNewAd";
    }
}
