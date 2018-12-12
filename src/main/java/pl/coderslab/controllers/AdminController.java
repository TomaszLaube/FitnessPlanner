package pl.coderslab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.models.CurrentUser;
import pl.coderslab.models.Role;
import pl.coderslab.models.User;
import pl.coderslab.services.RoleService;
import pl.coderslab.services.UserService;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    UserService userService;

    @Autowired
    RoleService roleService;

    @RequestMapping("/users")
    public String users(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User currentUser = customUser.getUser();
        List<User> users = userService.findAllUsers();
        Role admin = (Role) roleService.findByRoleName("ROLE_ADMIN");
        List<User> regularUsers = users.stream()
                .filter(s -> s.getId() != currentUser.getId())
                .filter(s -> !s.getRoles().contains(admin))
                .collect(Collectors.toList());
        model.addAttribute("user", currentUser);
        model.addAttribute("users", regularUsers);
        return "admin/users";
    }

    @RequestMapping("/disable/{userId}")
    public String disableUser(@PathVariable Long userId) {
        User user = (User) userService.findById(userId);
        if (user != null) {
            user.setEnabled(false);
            userService.updateUser(user);
        }
        return "redirect:/admin/users";
    }
    @RequestMapping("/enable/{userId}")
    public String enableUser(@PathVariable Long userId) {
        User user = (User) userService.findById(userId);
        if (user != null) {
            user.setEnabled(true);
            userService.updateUser(user);
        }
        return "redirect:/admin/users";
    }
}
