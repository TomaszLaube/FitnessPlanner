package pl.coderslab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import pl.coderslab.models.CurrentUser;
import pl.coderslab.models.Role;
import pl.coderslab.models.User;

import java.util.HashSet;
import java.util.Set;

public class SpringDataUserDetailsService implements UserDetailsService {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }


    @Override
    public UserDetails loadUserByUsername(String username) {
        User user = (User)userService.findByUsernameStatus(username,true);
        if(user == null){
            throw new UsernameNotFoundException(username);
        }
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        for(Role role: user.getRoles()){
            grantedAuthorities.add(new SimpleGrantedAuthority(role.getRole()));
        }
        return new CurrentUser(user.getUsername(),user.getPassword(), grantedAuthorities, user);
    }
}
