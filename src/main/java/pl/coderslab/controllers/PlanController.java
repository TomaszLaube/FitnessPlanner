package pl.coderslab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.comparators.PlanExerciseDayOrderComparator;
import pl.coderslab.models.CurrentUser;
import pl.coderslab.models.Plan;
import pl.coderslab.models.PlanExercise;
import pl.coderslab.models.User;
import pl.coderslab.services.PlanExerciseService;
import pl.coderslab.services.PlanService;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/app/plan")
public class PlanController {

    @Autowired
    PlanService planService;

    @Autowired
    PlanExerciseService planExerciseService;

    @RequestMapping("/list")
    public String planList(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User currentUser = customUser.getUser();
        model.addAttribute("user", currentUser);
        List<Plan> userPlans = planService.findAllByUser(currentUser.getId());
        model.addAttribute("userPlans", userPlans);
        return "plans/planList";
    }

    @GetMapping("/add")
    public String addPlanForm(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User currentUser = customUser.getUser();
        model.addAttribute("user", currentUser);
        model.addAttribute("plan", new Plan());
        return "plans/addForm";
    }

    @PostMapping("/add")
    public String addedPlan(@ModelAttribute @Valid Plan plan, BindingResult result, @AuthenticationPrincipal CurrentUser customUser) {
        if (result.hasErrors()) {
            return "plans/addForm";
        }
        User currentUser = customUser.getUser();
        plan.setUser(currentUser);
        planService.save(plan);
        return "redirect:/app/plan/list";
    }

    @GetMapping("/details/{planId}")
    public String planDetails(@PathVariable Long planId, @AuthenticationPrincipal CurrentUser customUser, Model model) {
        User currentUser = customUser.getUser();
        Plan plan = (Plan) planService.findById(planId);
        List<PlanExercise> monday = planExerciseService.findAllByPlanAndDay(planId, 1L);
        List<PlanExercise> tuesday = planExerciseService.findAllByPlanAndDay(planId, 2L);
        List<PlanExercise> wednesday = planExerciseService.findAllByPlanAndDay(planId, 3L);
        List<PlanExercise> thursday = planExerciseService.findAllByPlanAndDay(planId, 4L);
        List<PlanExercise> friday = planExerciseService.findAllByPlanAndDay(planId, 5L);
        List<PlanExercise> saturday = planExerciseService.findAllByPlanAndDay(planId, 6L);
        List<PlanExercise> sunday = planExerciseService.findAllByPlanAndDay(planId, 7L);
        if (monday.size() > 0) {
            Collections.sort(monday, new PlanExerciseDayOrderComparator());
        }
        if (tuesday.size() > 0) {
            Collections.sort(tuesday, new PlanExerciseDayOrderComparator());
        }
        if (wednesday.size() > 0) {
            Collections.sort(wednesday, new PlanExerciseDayOrderComparator());
        }
        if (thursday.size() > 0) {
            Collections.sort(thursday, new PlanExerciseDayOrderComparator());
        }
        if (friday.size() > 0) {
            Collections.sort(friday, new PlanExerciseDayOrderComparator());
        }
        if (saturday.size() > 0) {
            Collections.sort(saturday, new PlanExerciseDayOrderComparator());
        }
        if (sunday.size() > 0) {
            Collections.sort(sunday, new PlanExerciseDayOrderComparator());
        }
        List<List<PlanExercise>> fullWeek = new ArrayList<>();
        fullWeek.add(monday);
        fullWeek.add(tuesday);
        fullWeek.add(wednesday);
        fullWeek.add(thursday);
        fullWeek.add(friday);
        fullWeek.add(saturday);
        fullWeek.add(sunday);
        model.addAttribute("fullWeek", fullWeek);
        model.addAttribute("user", currentUser);
        model.addAttribute("plan", plan);
        return "plans/details";
    }

    @GetMapping("/delete/{planId}")
    public String deletePlan(@PathVariable Long planId, @AuthenticationPrincipal CurrentUser customUser, Model model) {
        User currentUser = customUser.getUser();
        model.addAttribute("user", currentUser);
        return "plans/confirmDelete";
    }

    @PostMapping("/delete/{planId}")
    public String deletedPlan(@PathVariable Long planId) {
        planService.delete(planService.findById(planId));
        return "redirect:/app/plan/list";
    }

    @GetMapping("/edit/{planId}")
    public String editPlan(@AuthenticationPrincipal CurrentUser customUser, Model model, @PathVariable Long planId) {
        Plan plan = (Plan) planService.findById(planId);
        User currentUser = customUser.getUser();
        model.addAttribute("user", currentUser);
        model.addAttribute("plan", plan);
        return "plans/editPlan";
    }

    @PostMapping("edit/{planId}")
    public String editedPlan(@ModelAttribute @Valid Plan plan, BindingResult result, @PathVariable Long planId) {
        if (result.hasErrors()) {
            return "redirect:/app/plan/edit/" + planId;
        }
        planService.update(plan);
        return "redirect:/app/plan/list";
    }
}
