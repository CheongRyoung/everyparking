package com.everyparking.user.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/test")
public class TestController {

    @RequestMapping("/test")
    public ModelAndView test(){

        return new ModelAndView("/mypage/review/checkUsageReviewPage");
    }
}
