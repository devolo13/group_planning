package com.example.groupplanning.controllers;

import com.example.groupplanning.models.LoginUser;
import com.example.groupplanning.models.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class view {
    @GetMapping("/")
    public String login(Model model){
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "login.jsp";
    }
}
