package pl.coderslab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.models.Exercise;
import pl.coderslab.models.User;
import pl.coderslab.services.ExerciseService;
import pl.coderslab.services.UserService;

import javax.validation.Valid;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    UserService userService;
    @Autowired
    ExerciseService exerciseService;


    @RequestMapping("/")
    public String homepage(){
        return "home/homepage";
    }

    @RequestMapping("/contact")
    public String contact(){
        return "home/contact";
    }
    @RequestMapping("/about")
    public String about(){
        return "home/about";
    }
    @GetMapping("/register")
    public String register(Model model){
        User user = new User();
        model.addAttribute("user", user);
        return "home/register";
    }
    @PostMapping("/register")
    public String registerUser(@ModelAttribute @Valid User user, BindingResult result, Model model){
        User byUsername = (User)userService.findByUsername(user.getUsername());
        User byEmail = (User)userService.findByEmail(user.getEmail());

        if(result.hasErrors()){
            return "home/register";
        }else if(byUsername != null || byEmail != null || !user.getPassword().equals(user.getCheckPassword())){
            if(byUsername != null){
                model.addAttribute("usernameExists", true);
            }
            if(byEmail != null){
                model.addAttribute("emailExists", true);
            }
            if(!user.getPassword().equals(user.getCheckPassword())){
                model.addAttribute("incorrectPassword",true);
            }
            return "home/register";
        }
        else{
            userService.saveUser(user);
            return "home/homepage";
        }
    }
    @RequestMapping("/userExercises")
    public String userExercises(Model model){
        List<Exercise> exercises = exerciseService.findAll();
        model.addAttribute("exercises", exercises);
        return "home/userExercises";
    }
    @RequestMapping("/exerciseDetails/{exerciseId}")
    public String exerciseDetails(Model model, @PathVariable Long exerciseId){
        Exercise exercise = (Exercise) exerciseService.findById(exerciseId);
        model.addAttribute("exercise", exercise);
        return "home/exerciseDetails";
    }



}
