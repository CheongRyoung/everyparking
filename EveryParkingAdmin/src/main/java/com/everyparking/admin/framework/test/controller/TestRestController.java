package com.everyparking.admin.framework.test.controller;

import com.everyparking.admin.HomeController;
import com.everyparking.admin.framework.common.controller.BaseController;
import com.everyparking.admin.framework.common.vo.Ajax;
import com.everyparking.admin.framework.test.service.TestService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

@RestController
@RequestMapping("/test")
public class TestRestController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(TestRestController.class);

    @Autowired
    private TestService testService;

    @RequestMapping("/testAjax")
    public ModelAndView testAjax(@RequestBody HashMap<String, Object> params){

        ModelAndView mav = createMav();
        try {
            mav = createMav(testService.getDBTest(params), testService.getDBTestCount(params));
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.FAIL);
        }
        return mav;
    }

    @RequestMapping("/testSaveAjax")
    public ModelAndView testSaveAjax(@RequestBody HashMap<String,Object> params){
        ModelAndView mav = createMav(Ajax.SAVE.TEXT+"."+Ajax.SUCCESS);
        try {
            mav = createMav(testService.DBUploadTest("1"));
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SAVE.TEXT+"."+Ajax.FAIL);
        }
        return mav;
    }

    @RequestMapping("/ajaxCall")
    public ModelAndView testajaxCall(@RequestBody HashMap<String,Object> params){
        ModelAndView mav = createMav(Ajax.SAVE.TEXT+"."+Ajax.SUCCESS);
        try {
            mav = createMav();
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SAVE.TEXT+"."+Ajax.FAIL);
        }
        return mav;
    }

}
