package com.everyparking.admin.api.userhistory.controller;

import java.util.HashMap;

import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;



import com.everyparking.admin.api.userhistory.service.UserHistoryService;
import com.everyparking.admin.framework.common.controller.BaseController;
import com.everyparking.admin.framework.common.vo.Ajax;

@RestController
@RequestMapping(value="/userHistory")
public class UserHistoryRestController extends BaseController{

	

    private static final Logger logger = LoggerFactory.getLogger(UserHistoryRestController.class);

    
    @Autowired
    UserHistoryService userHistoryService;
    
    
    
    @RequestMapping("/selectListHistory")
    public ModelAndView selectListHistory(@RequestBody HashMap<String,Object> params) throws Exception{
        ModelAndView mav = super.createMav();
        try {
            mav = super.createMav(userHistoryService.selectListHistory(params), userHistoryService.selectListCountHistory(params));
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.FAIL);
        }
        return mav;
    }
    
    
    
    @RequestMapping("/selectOneHistory")
    public ModelAndView selectOneHistory(@RequestBody HashMap<String,Object> params) throws Exception {
        ModelAndView mav = super.createMav();
        try {
            mav = super.createMav(userHistoryService.selectOneHistory(params));
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.FAIL);
        }
        return mav;
    }
    
    
   
    
    
}