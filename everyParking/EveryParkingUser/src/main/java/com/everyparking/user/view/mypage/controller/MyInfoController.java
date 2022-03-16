package com.everyparking.user.view.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mypage/myinfo")
public class MyInfoController {


    @RequestMapping("/confirmPw")
    public ModelAndView confirmPw() {

        return new ModelAndView("/mypage/myinfo/confirmPw");
    }

    @RequestMapping("/goodBye")
    public ModelAndView goodBye() {

        return new ModelAndView("/mypage/myinfo/goodBye");
    }

    @RequestMapping("/UpdateComplete")
    public ModelAndView UpdateComplete() {

        return new ModelAndView("/mypage/myinfo/UpdateComplete");
    }

    @RequestMapping("/updatePage")
    public ModelAndView updatePage() {

        return new ModelAndView("/mypage/myinfo/updatePage");
    }
}
