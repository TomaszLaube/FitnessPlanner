package pl.coderslab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.models.CurrentUser;
import pl.coderslab.models.Plan;
import pl.coderslab.models.User;
import pl.coderslab.repositories.ExerciseRepository;
import pl.coderslab.services.ExerciseService;
import pl.coderslab.services.PlanService;

@Controller
@RequestMapping("/app")
public class AppController {

    @Autowired
    PlanService planService;

    @Autowired
    ExerciseService exerciseService;


    @RequestMapping("/dashboard")
    public String dashboard(@AuthenticationPrincipal CurrentUser customUser, Model model){

        User currentUser = customUser.getUser();
        model.addAttribute("user", currentUser);

        long userPlans = planService.countByUser(currentUser.getId());
        model.addAttribute("countPlans", userPlans);
        long userExercises = exerciseService.countByUserId(currentUser.getId());
        model.addAttribute("countExercises", userExercises);

        Plan latestPlan = (Plan)planService.findLatestByUser(currentUser.getId());
        model.addAttribute("latestPlan", latestPlan);



        return "app/dashboard";
    }
}
