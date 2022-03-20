package com.everyparking.admin.api.costManage.controller;

import java.util.HashMap;

import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.everyparking.admin.api.costManage.service.CostManageService;
import com.everyparking.admin.framework.common.controller.BaseController;
import com.everyparking.admin.framework.common.vo.Ajax;


@RestController
@RequestMapping(value="/costManage")
public class CostManageRestController extends BaseController {

	
    private static final Logger logger = LoggerFactory.getLogger(CostManageRestController.class);

    
    @Autowired
    CostManageService costManageService;
    
    
    
    @RequestMapping("/selectListCost")
    public ModelAndView selectListCost(@RequestBody HashMap<String,Object> params) throws Exception{
        ModelAndView mav = super.createMav();
        try {
            mav = super.createMav(costManageService.selectListCost(params), costManageService.selectListCountCost(params));
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.FAIL);
        }
        return mav;
    }
    
    
    
    @RequestMapping("/selectOneCost")
    public ModelAndView selectOneCost(@RequestBody HashMap<String,Object> params) throws Exception {
        ModelAndView mav = super.createMav();
        try {
            mav = super.createMav(costManageService.selectOneCost(params));
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.FAIL);
        }
        return mav;
    }
    
    
    
    @RequestMapping("/deleteCost")
    public ModelAndView deleteCost(@RequestBody HashMap<String,Object> params) throws Exception{
        ModelAndView mav = super.createMav();
        try {
            mav = super.createMav(costManageService.deleteCost(params));
            super.setMessage(mav, Ajax.DELETE.TEXT+"."+Ajax.SUCCESS);
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.DELETE.TEXT+"."+Ajax.FAIL);
        }
        return mav;
    }
    
    
    
    
}
