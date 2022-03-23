package com.everyparking.user.view.mypage.controller;

import com.everyparking.user.framework.common.util.SessionUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage/reservation")
public class ReserController {


    @RequestMapping("/list")
    public ModelAndView checkUsageReviewListPage(HttpSession session) {
        ModelAndView mav = SessionUtil.checkSession(session);
        mav.setViewName("/mypage/reservation/list");
        return mav;
    }
}
