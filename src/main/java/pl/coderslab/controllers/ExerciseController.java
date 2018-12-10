package pl.coderslab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.models.CurrentUser;
import pl.coderslab.models.Exercise;
import pl.coderslab.models.User;
import pl.coderslab.services.ExerciseService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/app/exercise")
public class ExerciseController {

    @Autowired
    ExerciseService exerciseService;

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
}
