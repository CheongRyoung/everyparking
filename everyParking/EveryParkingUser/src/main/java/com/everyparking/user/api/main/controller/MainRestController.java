package com.everyparking.user.api.main.controller;

import java.util.HashMap;
import java.util.Map;

import com.everyparking.user.api.main.service.MainServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.everyparking.user.framework.common.controller.BaseController;
import com.everyparking.user.framework.common.vo.Ajax;

@RestController
@RequestMapping(value="/main")
public class MainRestController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(MainRestController.class);


    @Autowired
    MainServiceImpl mainService;

    // 3/16 메인 지도 장문 작업 부분

    @RequestMapping("/selectParkingInfoList")
    public ModelAndView selectParkingInfoList(@RequestBody HashMap<String,Object> params) throws Exception{
        ModelAndView mav = super.createMav();
        try {
            mav = super.createMav(mainService.selectParkingInfoList(params), mainService.selectParkingInfoListCount(params));
        }catch (Exception e){
            logger.error(e.getMessage());
            e.printStackTrace();
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.FAIL);
        }
        return mav;
    }


    @RequestMapping("/selectOneParkingInfo")
    public ModelAndView selectOneParkingInfo(@RequestBody HashMap<String,Object> params) throws Exception{
        ModelAndView mav = super.createMav();
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("sectionList", mainService.selectSectionList(params));
        data.put("reviewList", mainService.selectReviewList(params));
        data.put("parkingInfo", mainService.selectOneParkingInfo(params));
        data.put("reviewCount", mainService.selectReviewListCount(params));
        try {
            mav = super.createMav(data);
        }catch (Exception e){
            logger.error(e.getMessage());
            e.printStackTrace();
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.FAIL);
        }
        return mav;
    }

    
    
    
    
    
}
