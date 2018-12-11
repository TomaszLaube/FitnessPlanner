package pl.coderslab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.comparators.PlanExerciseDayOrderComparator;
import pl.coderslab.models.CurrentUser;
import pl.coderslab.models.Plan;
import pl.coderslab.models.PlanExercise;
import pl.coderslab.models.User;
import pl.coderslab.repositories.ExerciseRepository;
import pl.coderslab.services.ExerciseService;
import pl.coderslab.services.PlanExerciseService;
import pl.coderslab.services.PlanService;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/app")
public class AppController {

    @Autowired
    PlanService planService;

    @Autowired
    ExerciseService exerciseService;

    @Autowired
    PlanExerciseService planExerciseService;


    @RequestMapping("/dashboard")
    public String dashboard(@AuthenticationPrincipal CurrentUser customUser, Model model){

        User currentUser = customUser.getUser();

        long userPlans = planService.countByUser(currentUser.getId());
        long userExercises = exerciseService.countByUserId(currentUser.getId());

        Plan latestPlan = (Plan)planService.findLatestByUser(currentUser.getId());

        List<PlanExercise> monday = planExerciseService.findAllByPlanAndDay(latestPlan.getId(), 1L);
        List<PlanExercise> tuesday = planExerciseService.findAllByPlanAndDay(latestPlan.getId(), 2L);
        List<PlanExercise> wednesday = planExerciseService.findAllByPlanAndDay(latestPlan.getId(), 3L);
        List<PlanExercise> thursday = planExerciseService.findAllByPlanAndDay(latestPlan.getId(), 4L);
        List<PlanExercise> friday = planExerciseService.findAllByPlanAndDay(latestPlan.getId(), 5L);
        List<PlanExercise> saturday = planExerciseService.findAllByPlanAndDay(latestPlan.getId(), 6L);
        List<PlanExercise> sunday = planExerciseService.findAllByPlanAndDay(latestPlan.getId(), 7L);
        if(monday.size()>0){
            Collections.sort(monday,new PlanExerciseDayOrderComparator());
        }
        if(tuesday.size()>0){
            Collections.sort(tuesday,new PlanExerciseDayOrderComparator());
        }
        if(wednesday.size()>0){
            Collections.sort(wednesday,new PlanExerciseDayOrderComparator());
        }
        if(thursday.size()>0){
            Collections.sort(thursday,new PlanExerciseDayOrderComparator());
        }
        if(friday.size()>0){
            Collections.sort(friday,new PlanExerciseDayOrderComparator());
        }
        if(saturday.size()>0){
            Collections.sort(saturday,new PlanExerciseDayOrderComparator());
        }
        if(sunday.size()>0){
            Collections.sort(sunday,new PlanExerciseDayOrderComparator());
        }
        List<List<PlanExercise>> fullWeek = new ArrayList<>();
        fullWeek.add(monday);
        fullWeek.add(tuesday);
        fullWeek.add(wednesday);
        fullWeek.add(thursday);
        fullWeek.add(friday);
        fullWeek.add(saturday);
        fullWeek.add(sunday);

        model.addAttribute("user", currentUser);
        model.addAttribute("countPlans", userPlans);
        model.addAttribute("countExercises", userExercises);
        model.addAttribute("latestPlan", latestPlan);
        model.addAttribute("fullWeek", fullWeek);

        return "app/dashboard";
    }
}
