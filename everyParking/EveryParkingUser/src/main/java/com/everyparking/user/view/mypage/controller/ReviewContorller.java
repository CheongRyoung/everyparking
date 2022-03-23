package com.everyparking.user.view.mypage.controller;

import com.everyparking.user.api.mypage.service.ReviewService;
import com.everyparking.user.framework.common.util.SessionUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/mypage/review")
public class ReviewContorller {

    @Autowired
    ReviewService reviewService;



    @RequestMapping("/list")
    public ModelAndView checkUsageReviewPage() {
        return new ModelAndView("/mypage/review/checkUsageReviewPage");
    }

    @RequestMapping("/write")
    public ModelAndView write(@RequestParam HashMap<String, Object> params, HttpSession session) throws Exception {
        ModelAndView mav = SessionUtil.checkSession(session);
        mav.setViewName("/mypage/review/write");

        SessionUtil.setCreator(session, params);
        Map<String, Object> data = reviewService.getReservationInfo(params);

        mav.addObject("data", "data");

        return mav;
    }
}
