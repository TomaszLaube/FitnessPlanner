package pl.coderslab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.models.*;
import pl.coderslab.services.DayService;
import pl.coderslab.services.ExerciseService;
import pl.coderslab.services.PlanExerciseService;
import pl.coderslab.services.PlanService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/app/exercise")
public class ExerciseController {

    @Autowired
    ExerciseService exerciseService;

    @Autowired
    PlanService planService;

    @Autowired
    DayService dayService;

    @Autowired
    PlanExerciseService planExerciseService;

    @RequestMapping("/list")
    public String exercises(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User currentUser = customUser.getUser();
        model.addAttribute("user", currentUser);
        List<Exercise> userExercises = exerciseService.findAllByUser(currentUser.getId());
        model.addAttribute("userExercises", userExercises);
        return "exercises/exerciseList";
    }

    @GetMapping("/add")
    public String addExercise(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User currentUser = customUser.getUser();
        model.addAttribute("user", currentUser);

        model.addAttribute("exercise", new Exercise());

        return "exercises/addExercise";
    }
    @PostMapping("/add")
    public String addedExercise(@ModelAttribute @Valid Exercise exercise, BindingResult result, @AuthenticationPrincipal CurrentUser customUser){
        if(result.hasErrors()){
            return "exercises/addExercise";
        }
        User currentUser = customUser.getUser();
        exercise.setUser(currentUser);
        exerciseService.save(exercise);
        return "redirect:/app/exercise/list";
    }
    @GetMapping("/details/{exerciseId}")
    public String exerciseDetails(@PathVariable Long exerciseId, @AuthenticationPrincipal CurrentUser customUser, Model model){
        User currentUser = customUser.getUser();
        model.addAttribute("user", currentUser);
        Exercise exercise = (Exercise) exerciseService.findById(exerciseId);
        model.addAttribute("exercise", exercise);
        return "exercises/details";
    }
    @GetMapping("/plan/add")
    public String exerciseToPlanForm(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User currentUser = customUser.getUser();
        model.addAttribute("user", currentUser);
        List<Plan> userPlans = planService.findAllByUser(currentUser.getId());
        List<Exercise> userExercises = exerciseService.findAllByUser(currentUser.getId());
        List<Day> days = dayService.findAllDays();


        model.addAttribute("planExercise", new PlanExercise());
        model.addAttribute("userPlans",userPlans);
        model.addAttribute("days",days);
        model.addAttribute("userExercises",userExercises);
        return "exercises/addToPlan";
    }
    @PostMapping("/plan/add")
    public String exerciseToPlan(@ModelAttribute @Valid PlanExercise planExercise, BindingResult result, @AuthenticationPrincipal CurrentUser customUser, Model model){
        if(result.hasErrors()){
            return "exercises/addToPlan";
        }
        List<PlanExercise> otherExercises = planExerciseService.findAllByPlanAndDay(planExercise.getPlan().getId(), planExercise.getDay().getId());
        if(otherExercises == null || otherExercises.size()==0){
            planExercise.setExerciseOrder(1L);
        }else{
            Long max = 0L;
            for(PlanExercise p: otherExercises){
                if(p.getExerciseOrder()>max){
                    max=p.getExerciseOrder();
                }
            }
            if(max>=10){
                User currentUser = customUser.getUser();
                model.addAttribute("user", currentUser);
                List<Plan> userPlans = planService.findAllByUser(currentUser.getId());
                List<Exercise> userExercises = exerciseService.findAllByUser(currentUser.getId());
                List<Day> days = dayService.findAllDays();
                model.addAttribute("planExercise", new PlanExercise());
                model.addAttribute("userPlans",userPlans);
                model.addAttribute("days",days);
                model.addAttribute("userExercises",userExercises);
                model.addAttribute("dayLimit", true);
                return "exercises/addToPlan";
            }
            planExercise.setExerciseOrder(max+1);
        }
        planExerciseService.save(planExercise);
        return "redirect:/app/dashboard";
    }
    @RequestMapping("/reorderUp/{planExerciseId}")
    public String reorderUp(@PathVariable Long planExerciseId){
        PlanExercise planExercise = (PlanExercise) planExerciseService.findById(planExerciseId);
        Plan plan = (Plan) planService.findById(planExercise.getPlan().getId());
        PlanExercise upperPE = (PlanExercise) planExerciseService.findforReorder(plan.getId(),planExercise.getDay().getId(),planExercise.getExerciseOrder()-1);

        planExercise.setExerciseOrder(planExercise.getExerciseOrder()-1);
        upperPE.setExerciseOrder((upperPE.getExerciseOrder()+1));
        planExerciseService.save(planExercise);
        planExerciseService.save(upperPE);

        return "redirect:/app/plan/details/" + plan.getId();
    }

    @RequestMapping("/reorderDown/{planExerciseId}")
    public String reorderDown(@PathVariable Long planExerciseId){
        PlanExercise planExercise = (PlanExercise) planExerciseService.findById(planExerciseId);
        Plan plan = (Plan) planService.findById(planExercise.getPlan().getId());
        PlanExercise upperPE = (PlanExercise) planExerciseService.findforReorder(plan.getId(),planExercise.getDay().getId(),planExercise.getExerciseOrder()+1);

        planExercise.setExerciseOrder(planExercise.getExerciseOrder()+1);
        upperPE.setExerciseOrder((upperPE.getExerciseOrder()-1));
        planExerciseService.save(planExercise);
        planExerciseService.save(upperPE);

        return "redirect:/app/plan/details/" + plan.getId();
    }
    @RequestMapping("/deleteFromPlan/{planExerciseId}")
    public String deleteFromPlan(@PathVariable Long planExerciseId){
        PlanExercise planExercise = (PlanExercise) planExerciseService.findById(planExerciseId);
        Plan plan = (Plan) planService.findById(planExercise.getPlan().getId());
        List<PlanExercise> toUpdate = planExerciseService.findAllByPlanAndDay(plan.getId(),planExercise.getDay().getId());
        for(PlanExercise p: toUpdate){
            if(p.getExerciseOrder()>planExercise.getExerciseOrder()){
                p.setExerciseOrder(p.getExerciseOrder()-1);
                planExerciseService.save(p);
            }
        }
        planExerciseService.delete(planExercise);
        return "redirect:/app/plan/details/" + plan.getId();
    }
    @GetMapping("/delete/{exerciseId}")
    public String deleteExercise(@PathVariable Long exerciseId, @AuthenticationPrincipal CurrentUser customUser, Model model){
        User currentUser = customUser.getUser();
        model.addAttribute("user", currentUser);
        return "exercises/confirmDelete";
    }
    @PostMapping("/delete/{exerciseId}")
    public String deletedExercise(@PathVariable Long exerciseId){
        exerciseService.delete(exerciseService.findById(exerciseId));
        return "redirect:/app/exercise/list";
    }
    @GetMapping("/edit/{exerciseId}")
    public String updateExercise(@PathVariable Long exerciseId, @AuthenticationPrincipal CurrentUser customUser, Model model){
        User currentUser = customUser.getUser();
        model.addAttribute("user", currentUser);
        Exercise exercise = (Exercise) exerciseService.findById(exerciseId);
        model.addAttribute("exercise",exercise);
        return "exercises/editExercise";
    }
    @PostMapping("/edit/{exerciseId}")
    public String updatedExercise(@ModelAttribute @Valid Exercise exercise, BindingResult result){
        if(result.hasErrors()){
            return "exercises/editExercise";
        }
        exerciseService.update(exercise);
        return "redirect:/app/exercise/list";
    }


}
