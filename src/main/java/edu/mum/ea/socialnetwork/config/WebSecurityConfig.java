package edu.mum.ea.socialnetwork.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true, proxyTargetClass = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Qualifier("userServiceImpl")
    @Autowired
    private UserDetailsService userService;

    @Autowired
    private DataSource dataSource;

    @Bean
    public PasswordEncoder passwordEncoder() {

        return new BCryptPasswordEncoder();
        //with no encoder
//        return NoOpPasswordEncoder.getInstance();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .userDetailsService(userService)
                .passwordEncoder(passwordEncoder());

        //using im memmory
//        auth.inMemoryAuthentication()
//                .withUser("user").password("{noop}123456").roles("user").and().withUser("admin").password("123").roles("Admin").passwordEncoder(passwordEncoder());
        //using in
//        auth.jdbcAuthentication()

    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .headers()
            .frameOptions().sameOrigin()
            .and()
            .authorizeRequests()
            .antMatchers("/css/**","/fonts/**", "/js/**", "/lib/**", "/vendor/**","/media/**" , "/register/**").permitAll()
            .antMatchers("/", "/index", "/profile/**", "/profile/editProfile").hasRole("USER")
            .antMatchers( ).hasRole("ADMIN")


            .anyRequest().authenticated()
            .and()
            .formLogin()
            .loginPage("/login")
            .defaultSuccessUrl("/")
            .failureUrl("/login?error")
                .usernameParameter("username")
                .passwordParameter("password")
            .permitAll()
            .and()
            .logout()
            .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
            .logoutSuccessUrl("/login?logout")
            .permitAll()
            .and()
            .csrf().disable()
            .exceptionHandling()
                .accessDeniedPage("/denied");
    }
}
