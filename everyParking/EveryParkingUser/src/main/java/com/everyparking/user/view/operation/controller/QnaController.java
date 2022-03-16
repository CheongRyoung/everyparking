package com.everyparking.user.view.operation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/operation/QNA")
public class QnaController {


    @RequestMapping("/list")
    public ModelAndView list() {

        return new ModelAndView("/operation/qna/list");
    }

    @RequestMapping("/reply")
    public ModelAndView reply() {

        return new ModelAndView("/operation/qna/reply");
    }

    @RequestMapping("/write")
    public ModelAndView write() {

        return new ModelAndView("/operation/qna/write");
    }
}
