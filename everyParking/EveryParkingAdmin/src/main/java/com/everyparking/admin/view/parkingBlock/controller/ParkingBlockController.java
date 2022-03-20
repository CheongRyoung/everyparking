package com.everyparking.admin.view.parkingBlock.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.everyparking.admin.api.parkingManage.service.ParkingInfoService;
import com.everyparking.admin.framework.common.controller.BaseController;

@Controller
@RequestMapping("/parkingBlock")
public class ParkingBlockController extends BaseController {
	
	@Autowired
	ParkingInfoService parkingInfoService;

    @RequestMapping("/parkingBlock")
    public String parkingBlock(Model model) throws Exception {
    	
    	HashMap<String, Object> data = new HashMap<String, Object>();
    	
    	model.addAttribute("list", parkingInfoService.selectListParkingInfo(data));
    	
        return "/parkingBlock/parkingBlock";
    }

    @RequestMapping("/parkingBlockRegister")
    public String parkingBlockRegister(Model model) throws Exception {

        HashMap<String, Object> data = new HashMap<String, Object>();

        model.addAttribute("list", parkingInfoService.selectListParkingInfo(data));

        return "/parkingBlock/parkingBlockRegister";
    }
    
    @RequestMapping("/parkingBlockRevise")
    public String parkingBlockRevise() {
        return "/parkingBlock/parkingBlockRevise";
    }
    
}
