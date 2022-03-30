package com.everyparking.user.view.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.everyparking.user.api.main.service.MainService;

import java.util.HashMap;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	MainService mainService;


    @RequestMapping("/home")
    public ModelAndView home() {

        return new ModelAndView("/main/home");
    }

    @RequestMapping("/map")
    public String map(@RequestParam HashMap<String, Object> params, Model model) {
        model.addAttribute("data", params);
        return "/main/map";
    }
    
    @RequestMapping("/reservationComplete")
    public String map() {
        return "/main/reservationComplete";
    }
}
