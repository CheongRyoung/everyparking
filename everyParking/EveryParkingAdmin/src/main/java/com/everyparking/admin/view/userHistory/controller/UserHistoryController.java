package com.everyparking.admin.view.userHistory.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.everyparking.admin.api.parkingManage.service.ParkingInfoService;
import com.everyparking.admin.framework.common.controller.BaseController;

@Controller
@RequestMapping("/parkingManage")
public class UserHistoryController extends BaseController{

	@Autowired
    ParkingInfoService parkingInfoService;
	
	
    @RequestMapping("/userHistory")
   
    	 public String userHistory(Model model) throws Exception {
    	    	
    	    	HashMap<String, Object> data = new HashMap<String, Object>();
    	    	
    	    	model.addAttribute("list", parkingInfoService.selectListParkingInfo(data));
    	
        return "/parkingManage/userHistory";
        
        
    }

}
