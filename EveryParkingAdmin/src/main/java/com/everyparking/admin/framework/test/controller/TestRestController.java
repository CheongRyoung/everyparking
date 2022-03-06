package com.everyparking.admin.framework.test.controller;

import com.everyparking.admin.framework.common.controller.BaseController;
import com.everyparking.admin.framework.test.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/test")
public class TestRestController extends BaseController {

    @Autowired
    private TestService testService;

    @RequestMapping("/testAjax")
    public ModelAndView testAjax(){
        return createMav(testService.getDBTest());
    }


}
