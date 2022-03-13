package com.everyparking.admin.framework.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

    @RequestMapping("/login/loginPage")
    public String loginForm(){
        return "/login/loginForm";
    }

    @RequestMapping("/login/register")
    public String registerForm(){
        return "/login/register";
    }
}
