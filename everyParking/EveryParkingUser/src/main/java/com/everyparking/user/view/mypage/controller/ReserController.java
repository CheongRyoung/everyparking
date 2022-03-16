package com.everyparking.user.view.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mypage/reservation")
public class ReserController {


    @RequestMapping("/checkUsageCancelPage")
    public ModelAndView checkUsageCancelPage() {

        return new ModelAndView("/mypage/reservation/checkUsageCancelPage");
    }

    @RequestMapping("/checkUsageDetailsPage")
    public ModelAndView checkUsageDetailsPage() {

        return new ModelAndView("/mypage/reservation/checkUsageDetailsPage");
    }
}
