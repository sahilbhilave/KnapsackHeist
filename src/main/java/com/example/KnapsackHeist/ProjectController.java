package com.example.KnapsackHeist;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@SessionAttributes("myscore")
public class ProjectController {
    private final GameService gameService;

    public ProjectController(GameService gameService) {
        this.gameService = gameService;
    }

    @ModelAttribute("myscore")
    public Integer initializeScore() {
        return 0;
    }

    @RequestMapping("")
    public String showHome(ModelMap model) {
        return "Home";
    }

    @RequestMapping("game")
    public String showGame(ModelMap model) {
        List<Item> items = gameService.generateRandomItems();
        int knapsackCapacity = 10;

        MaxScoreResult result = gameService.calculateMaxPossibleScoreWithItems(items, knapsackCapacity);
        model.addAttribute("items", items);
        model.addAttribute("knapsackCapacity", knapsackCapacity);
        model.addAttribute("maxPossibleScore", result.maxScore());
        model.addAttribute("bestItems", result.bestItems());

        return "Game";
    }

    @RequestMapping("xuz")
    public String incrementScore(@ModelAttribute("myscore") Integer myscore, ModelMap model) {
        myscore += 1;
        model.addAttribute("myscore", myscore);

        return "redirect:/";
    }
}
