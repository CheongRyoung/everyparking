package com.everyparking.user.view.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@Controller
@RequestMapping("/mypage/review")
public class ReviewContorller {


    @RequestMapping("/checkUsageReviewListPage")
    public ModelAndView checkUsageReviewListPage() {

        return new ModelAndView("/mypage/review/checkUsageReviewListPage");
    }

    @RequestMapping("/checkUsageReviewPage")
    public ModelAndView checkUsageReviewPage() {

        return new ModelAndView("/mypage/review/checkUsageReviewPage");
    }

    @RequestMapping("/write")
    public ModelAndView write(@RequestParam HashMap<String, Object> params) {

        return new ModelAndView("/mypage/review/write");
    }
}
