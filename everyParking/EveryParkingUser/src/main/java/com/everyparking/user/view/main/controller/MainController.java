package com.everyparking.user.view.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@Controller
@RequestMapping("/main")
public class MainController {


    @RequestMapping("/content")
    public ModelAndView content() {

        return new ModelAndView("/main/content");
    }

    @RequestMapping("/home")
    public ModelAndView home() {

        return new ModelAndView("/main/home");
    }

    @RequestMapping("/list")
    public ModelAndView list() {

        return new ModelAndView("/main/list");
    }

    @RequestMapping("/map")
    public String map(@RequestParam HashMap<String, Object> params, Model model) {
        model.addAttribute("data", params);
        return "/main/map";
    }
}
