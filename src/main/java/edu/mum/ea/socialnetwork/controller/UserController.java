package edu.mum.ea.socialnetwork.controller;

import edu.mum.ea.socialnetwork.domain.AuthenticationResponse;
import edu.mum.ea.socialnetwork.domain.Role;
import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.services.UserService;
import edu.mum.ea.socialnetwork.util.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.validation.Valid;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    private JwtUtil jwtTokenUtil;

    @GetMapping("/login")
    public String login(@ModelAttribute("newUser") User user) {
        return "login";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "login";
        }
        user.setRole(Role.ROLE_USER);
        userService.save(user);
        System.out.println("testtttttttttt");
        return "redirect:/login";
    }

    // this method redirect request to the login page with get method which happen after changing the language
    @GetMapping("/register")
    public String redirect(@Valid @ModelAttribute("newUser") User user, BindingResult bindingResult) {
        return "login";
    }

/************************************************************************************/

    @PostMapping("/authenticate")
    public ResponseEntity<?> createAuthenticationToken(@RequestBody User user) throws Exception {
        try {
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword())
            );
        }
        catch (BadCredentialsException e) {
            throw new Exception("Incorrect username or password", e);
        }


        final UserDetails userDetails = userService
                .loadUserByUsername(user.getUsername());

        final String jwt = jwtTokenUtil.generateToken(userDetails);

        return ResponseEntity.ok(new AuthenticationResponse(jwt));
    }
}
