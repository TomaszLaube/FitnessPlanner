package pl.coderslab.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import pl.coderslab.services.SpringDataUserDetailsService;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;


    @Bean
    public SpringDataUserDetailsService customAdminDetailsService()	{
        return	new SpringDataUserDetailsService();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected	void	configure(HttpSecurity http)	throws	Exception	{
        http.authorizeRequests()
                .antMatchers("/app/**").authenticated()
                .anyRequest().permitAll()
               // .and().formLogin().loginPage("/login").defaultSuccessUrl("/app/dashboard")
                .and().formLogin().loginPage("/login").defaultSuccessUrl("/app/dashboard")
                .and().logout()
                //.deleteCookies("remove").invalidateHttpSession(true)
                .logoutUrl("/logout")
                .logoutSuccessUrl("/");
    }
}
