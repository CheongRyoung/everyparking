package com.everyparking.user.view.mypage.controller;

import com.everyparking.user.framework.common.util.SessionUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage/reservation")
public class ReserController {


    @RequestMapping("/cancelList")
    public ModelAndView checkUsageCancelPage() {

        return new ModelAndView("/mypage/reservation/checkUsageCancelPage");
    }

    @RequestMapping("/currentList")
    public ModelAndView checkUsageDetailsPage() {

        return new ModelAndView("/mypage/reservation/checkUsageDetailsPage");
    }

    @RequestMapping("/pastList")
    public ModelAndView checkUsageReviewListPage(HttpSession session) {
        ModelAndView mav = SessionUtil.checkSession(session);
        mav.setViewName("/mypage/reservation/checkUsageReviewListPage");
        return mav;
    }
}
