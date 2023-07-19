package com.example.groupplanning.controllers;

import com.example.groupplanning.models.LoginUser;
import com.example.groupplanning.models.User;
import com.example.groupplanning.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

@Controller
public class view {
    @Autowired
    UserService userService;

    @GetMapping("/")
    public String login(Model model){
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "login.jsp";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session){
        User loginUser = userService.login(newLogin, result);
        if(result.hasErrors()){
            model.addAttribute("newUser", new User());
            return "login.jsp";
        }
        session.setAttribute("userId", loginUser.getId());
        session.setAttribute("userName", loginUser.getName());
        return "redirect:/home";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session){
        User registeredUser = userService.register(newUser, result);
        if(result.hasErrors()){
            model.addAttribute("newLogin", new LoginUser());
            return "login.jsp";
        }
        session.setAttribute("userId",registeredUser.getId());
        session.setAttribute("userName",registeredUser.getName());
        return "redirect:/home";
    }

    @GetMapping("/home")
    public String home(HttpSession session){
        if (session.getAttribute("userId")  == null) {
            session.invalidate();
            return "redirect:/";
        }
        return "home.jsp";
    }

    @GetMapping("/create")
    public String create(HttpSession session, Model model){
        if (session.getAttribute("userId")  == null) {
            session.invalidate();
            return "redirect:/";
        }
        User user = new User();
        model.addAttribute("newUser", user);
        return "create.jsp";
    }

    @GetMapping("/account")
    public String account(HttpSession session, Model model){
        if (session.getAttribute("userId")  == null) {
            session.invalidate();
            return "redirect:/";
        }
        User user = userService.findUser((Long)session.getAttribute("userId"));
        model.addAttribute("user", user);
        return "account.jsp";
    }

    @GetMapping("/search")
    public String search(HttpSession session, Model model){
        if (session.getAttribute("userId")  == null) {
            session.invalidate();
            return "redirect:/";
        }
        User user = new User();
        model.addAttribute("user", user);
//        List<User> allUsers = userService.allUsers();
//        session.setAttribute("allUsers", allUsers);
        return "search.jsp";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }
}
