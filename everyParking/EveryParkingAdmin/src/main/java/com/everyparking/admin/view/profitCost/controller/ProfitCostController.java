package com.everyparking.admin.view.profitCost.controller;

import com.everyparking.admin.api.parkingManage.service.ParkingInfoService;
import com.everyparking.admin.framework.common.controller.BaseController;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/profitCost")
public class ProfitCostController extends BaseController {


	@Autowired
    ParkingInfoService parkingInfoService;
	
	
    @RequestMapping("/costTable")
   
    	 //정자운 0316 19:30 추가부분
    	 public String costTable(Model model) throws Exception {
    	    	
    	    	HashMap<String, Object> data = new HashMap<String, Object>();
    	    	
    	    	model.addAttribute("list", parkingInfoService.selectListParkingInfo(data));
    	
        return "/profitCost/costTable";
        
        
    }

    @RequestMapping("/costInsertForm")
    public String costInsertForm() {
        return "/profitCost/costInsertForm";
    }

    @RequestMapping("/profitTable")
    public String profitTable(Model model) throws Exception {
    	
    	HashMap<String, Object> data = new HashMap<String, Object>();
    	
    	model.addAttribute("list", parkingInfoService.selectListParkingInfo(data));
    	
    	
        return "/profitCost/profitTable";
    }

    @RequestMapping("/profitChart")
    public String profitChart() {
        return "/profitCost/profitChart";
    }

    @RequestMapping("/reservationInquiry")
    public String reservationInquiry() {
        return "/profitCost/reservationInquiry";
    }

}
