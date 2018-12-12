package pl.coderslab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.comparators.PlanExerciseDayOrderComparator;
import pl.coderslab.models.*;
import pl.coderslab.repositories.ExerciseRepository;
import pl.coderslab.services.ExerciseService;
import pl.coderslab.services.PlanExerciseService;
import pl.coderslab.services.PlanService;
import pl.coderslab.services.UserService;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/app")
public class AppController {

    @Autowired
    UserService userService;

    @Autowired
    PlanService planService;

    @Autowired
    ExerciseService exerciseService;

    @Autowired
    PlanExerciseService planExerciseService;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;


    @RequestMapping("/dashboard")
    public String dashboard(@AuthenticationPrincipal CurrentUser customUser, Model model) {

        User currentUser = customUser.getUser();

        long userPlans = planService.countByUser(currentUser.getId());
        long userExercises = exerciseService.countByUserId(currentUser.getId());

        Plan latestPlan = (Plan) planService.findLatestByUser(currentUser.getId());
        List<List<PlanExercise>> fullWeek = new ArrayList<>();
        if (latestPlan != null) {
            List<PlanExercise> monday = planExerciseService.findAllByPlanAndDay(latestPlan.getId(), 1L);
            List<PlanExercise> tuesday = planExerciseService.findAllByPlanAndDay(latestPlan.getId(), 2L);
            List<PlanExercise> wednesday = planExerciseService.findAllByPlanAndDay(latestPlan.getId(), 3L);
            List<PlanExercise> thursday = planExerciseService.findAllByPlanAndDay(latestPlan.getId(), 4L);
            List<PlanExercise> friday = planExerciseService.findAllByPlanAndDay(latestPlan.getId(), 5L);
            List<PlanExercise> saturday = planExerciseService.findAllByPlanAndDay(latestPlan.getId(), 6L);
            List<PlanExercise> sunday = planExerciseService.findAllByPlanAndDay(latestPlan.getId(), 7L);
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
            fullWeek.add(monday);
            fullWeek.add(tuesday);
            fullWeek.add(wednesday);
            fullWeek.add(thursday);
            fullWeek.add(friday);
            fullWeek.add(saturday);
            fullWeek.add(sunday);
        }
        model.addAttribute("user", currentUser);
        model.addAttribute("countPlans", userPlans);
        model.addAttribute("countExercises", userExercises);
        model.addAttribute("latestPlan", latestPlan);
        model.addAttribute("fullWeek", fullWeek);

        return "app/dashboard";
    }

    @GetMapping("/editUserData")
    public String editUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User user = customUser.getUser();
        User updatedUser = (User) userService.findById(user.getId());
        model.addAttribute("user", updatedUser);
        return "app/editUser";
    }

    @PostMapping("/editUserData")
    public String editedUsed(@ModelAttribute @Valid User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "app/editUser";
        }
        User byUsername = (User) userService.findByUsername(user.getUsername());
        User byEmail = (User) userService.findByEmail(user.getEmail());
        if (byUsername != null && byUsername.getId() == user.getId()) {
            byUsername = null;
        }
        if (byEmail != null && byEmail.getId() == user.getId()) {
            byEmail = null;
        }
        if (byUsername != null || byEmail != null) {
            if (byUsername != null) {
                model.addAttribute("usernameExists", true);
            }
            if (byEmail != null) {
                model.addAttribute("emailExists", true);
            }
            model.addAttribute("user", user);
            return "app/editUser";
        } else {
            User temp = (User) userService.findById(user.getId());
            user.setRoles(temp.getRoles());
            userService.updateUser(user);
            return "redirect:/app/dashboard";
        }
    }

    @GetMapping("/changePassword")
    public String changePassword(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User user = customUser.getUser();
        model.addAttribute("user", user);
        return "app/changePassword";
    }

    @PostMapping("/changePassword")
    public String changedPassword(@AuthenticationPrincipal CurrentUser customUser, Model model, @RequestParam String oldPassword, @RequestParam String newPassword, @RequestParam String newPasswordCheck) {
        User user = customUser.getUser();
        if (!passwordEncoder.matches(oldPassword, user.getPassword())) {
            model.addAttribute("incorrectOldPassword", true);
            return "app/changePassword";
        } else if (!newPassword.equals(newPasswordCheck)) {
            model.addAttribute("incorrectNewPassword", true);
            return "app/changePassword";
        } else {
            User temp = (User) userService.findById(user.getId());
            user.setRoles(temp.getRoles());
            user.setPassword(newPassword);
            userService.changePassword(user);
            return "redirect:/app/dashboard";
        }
    }

}
