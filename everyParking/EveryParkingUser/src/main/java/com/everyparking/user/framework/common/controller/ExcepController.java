package com.everyparking.user.framework.common.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExcepController {

    private static final Logger logger = LoggerFactory.getLogger(ExcepController.class);

    @ExceptionHandler(Exception.class)
    public String handleException(Exception e, Model model) {
        logger.error(e.getMessage());

        model.addAttribute("message", "올바르지 않는 시도입니다");
        return "/error/error";
    }

}
