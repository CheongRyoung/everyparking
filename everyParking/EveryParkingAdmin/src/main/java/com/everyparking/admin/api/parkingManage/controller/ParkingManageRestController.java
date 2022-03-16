package com.everyparking.admin.api.parkingManage.controller;

import com.everyparking.admin.api.parkingManage.service.ParkingInfoService;
import com.everyparking.admin.framework.common.controller.BaseController;
import com.everyparking.admin.framework.common.vo.Ajax;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@RestController
@RequestMapping(value="/parkingManage")
public class ParkingManageRestController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(ParkingManageRestController.class);

    @Autowired
    ParkingInfoService parkingInfoService;

    @RequestMapping("/selectListParkingInfo")
    public ModelAndView selectListParkingInfo(@RequestBody HashMap<String,Object> params) throws Exception{
        ModelAndView mav = super.createMav();
        try {
            mav = super.createMav(parkingInfoService.selectListParkingInfo(params), parkingInfoService.selectListCountParkingInfo(params));
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.FAIL);
        }
        return mav;
    }

    @RequestMapping("/selectOneParkingInfo")
    public ModelAndView selectOneParkingInfo(@RequestBody HashMap<String,Object> params) throws Exception {
        ModelAndView mav = super.createMav();
        try {
            mav = super.createMav(parkingInfoService.selectOneParkingInfo(params));
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.FAIL);
        }
        return mav;
    }

    @RequestMapping("/deleteParkingInfo")
    public ModelAndView deleteParkingInfo(@RequestBody HashMap<String,Object> params) throws Exception{
        ModelAndView mav = super.createMav();
        try {
            mav = super.createMav(parkingInfoService.deleteParkingInfo(params));
            super.setMessage(mav, Ajax.DELETE.TEXT+"."+Ajax.SUCCESS);
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.DELETE.TEXT+"."+Ajax.FAIL);
        }
        return mav;
    }




}
