package com.everyparking.admin.view.parkingManage.controller;

import com.everyparking.admin.api.parkingManage.controller.ParkingManageRestController;
import com.everyparking.admin.api.parkingManage.service.ParkingInfoService;
import com.everyparking.admin.framework.common.controller.BaseController;
import com.everyparking.admin.framework.common.util.SessionUtil;
import com.everyparking.admin.framework.common.vo.Ajax;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/parkingManage")
public class ParkingManageController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(ParkingManageRestController.class);

    @Autowired
    ParkingInfoService parkingInfoService;

//    AOP - 기능별로 패키징구성

    @RequestMapping("/adminHome")
    public String adminHome() {
        return "/parkingManage/adminHome";
    }

    @RequestMapping("/parkingZone")
    public String parkingZone() throws Exception{
    	return "/parkingManage/parkingZone";
    }
	    
		
    @RequestMapping("/modifyParkingZone")
    public String modifyParkingZone(){return "/parkingManage/modifyParkingZone";}

    @RequestMapping("/parkingRegister")
    public String parkingRegister(Model model) throws Exception{
    	List<HashMap<String, Object>> ryList = parkingInfoService.selectSubcodeByRY();
    	model.addAttribute("ryList", ryList);
    	
        return "/parkingManage/parkingRegister";
    }

    @RequestMapping("/insertParkingInfo")
    public ModelAndView insertParkingInfo(HttpServletRequest request
            , @RequestParam HashMap<String, Object> params
            , @RequestParam(value="SEC_TYPE", required = false) String[] SEC_TYPE
            , @RequestParam(value="SEC_COUNT", required = false) String[] SEC_COUNT
            , @RequestParam(value="SEC_DIS", required = false) String[] SEC_DIS
    		) throws Exception {
        ModelAndView mav = super.createMav();
        try {
        	params.put("SEC_TYPE", SEC_TYPE);
            params.put("SEC_COUNT", SEC_COUNT);
            params.put("SEC_DIS", SEC_DIS);
            SessionUtil.setCreator(request, params);
            mav = super.createMav(parkingInfoService.insertParkingInfo(request, params));
            super.setMessage(mav, Ajax.UPDATE.TEXT+"."+Ajax.TYPE_SUCCESS);
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SAVE.TEXT+"."+Ajax.TYPE_FAIL);
        }
        mav.setViewName("redirect:/parkingManage/parkingZone");
        return mav;
    }

    @RequestMapping("/parkingRevise")
    public ModelAndView parkingRevise(@ModelAttribute(value="PARK_SEQ") String PARK_SEQ, Model model) throws Exception { // ModelAttribute : 파라미터로 넘어온 값을 바로 model에 담아 출력
    	
    	List<HashMap<String, Object>> ryList = parkingInfoService.selectSubcodeByRY();
    	model.addAttribute("ryList", ryList);
    	
    	int parkSeq = Integer.parseInt(PARK_SEQ);
    	HashMap<String, Object> imageFile = parkingInfoService.selectParkingInfoFileImage(parkSeq);
    	model.addAttribute("imageFile", imageFile);
    	
    	ModelAndView mav = super.createMav(Ajax.UPDATE.TEXT+"."+Ajax.SUCCESS);
    	
    	mav.setViewName("/parkingManage/parkingRevise");
        
        return mav;
    	
        
    }

    @RequestMapping("/updateParkingInfo")
    public ModelAndView updateParkingInfo(HttpServletRequest request
            , @RequestParam HashMap<String, Object> params
            , @RequestParam(value="SEC_TYPE", required = false) String[] SEC_TYPE
            , @RequestParam(value="SEC_COUNT", required = false) String[] SEC_COUNT
            , @RequestParam(value="SEC_DIS", required = false) String[] SEC_DIS
    ) throws Exception {
        ModelAndView mav = super.createMav();
        try {
            params.put("SEC_TYPE", SEC_TYPE);
            params.put("SEC_COUNT", SEC_COUNT);
            params.put("SEC_DIS", SEC_DIS);
            SessionUtil.setCreator(request, params);
            mav = super.createMav(parkingInfoService.updateParkingInfo(request, params));
            super.setMessage(mav, Ajax.UPDATE.TEXT+"."+Ajax.TYPE_SUCCESS);
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.UPDATE.TEXT+"."+Ajax.TYPE_FAIL);
        }
        mav.setViewName("redirect:/parkingManage/parkingZone");
        
        return mav;
    }


    @RequestMapping("/parkingRevise2")
    public String test7() {
        return "/parkingManage/parkingRevise2";
    }

    @RequestMapping("/parkingRevise3")
    public String test8() {
        return "/parkingManage/parkingRevise3";
    }

    @RequestMapping("/qnaManagement")
    public String test16() {
        return "/parkingManage/qnaManagement";
    }

    @RequestMapping("/noticeManagement")
    public String test17() {
        return "/parkingManage/noticeManagement";
    }

    @RequestMapping("/noticeInsertForm")
    public String test18() {
        return "/parkingManage/noticeInsertForm";
    }


}
