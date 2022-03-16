package com.everyparking.user.view.operation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/operation/notice")
public class NoticeController {


    @RequestMapping("/content")
    public ModelAndView content() {

        return new ModelAndView("/operation/notice/content");
    }

    @RequestMapping("/test15")
    public ModelAndView list() {

        return new ModelAndView("/operation/notice/list");
    }
}
