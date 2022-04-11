package com.everyparking.admin.view.profitCost.controller;

import com.everyparking.admin.api.costManage.service.CostManageService;
import com.everyparking.admin.api.parkingManage.service.ParkingInfoService;
import com.everyparking.admin.api.profitCost.service.ProfitCostService;
import com.everyparking.admin.framework.common.controller.BaseController;
import com.everyparking.admin.framework.common.util.SessionUtil;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/profitCost")
public class ProfitCostController extends BaseController {


	@Autowired
    ParkingInfoService parkingInfoService;

    @Autowired
    CostManageService costManageService;
    
    @Autowired
    ProfitCostService profitCostService;
    
    @RequestMapping("/costTable")
   
    	 //정자운 0316 19:30 추가부분
    	 public String costTable(Model model) throws Exception {
    	    	
    	    	HashMap<String, Object> data = new HashMap<String, Object>();
    	    	
    	    	model.addAttribute("list", parkingInfoService.selectListParkingInfo(data));
    	
        return "/profitCost/costTable";
        
        
    }

    @RequestMapping("/costInsertForm")
    public String costInsertForm(Model model) throws Exception {
    	model.addAttribute("list", parkingInfoService.selectListParkingInfo(new HashMap<String, Object>()));
        return "/profitCost/costInsertForm";
    }
    
    @RequestMapping("/insertCost")
    public String insertCost(HttpServletRequest request, Model model, @RequestParam HashMap<String,Object> params) throws Exception {
    	SessionUtil.setCreator(request, params);
        String num = String.valueOf(params.get("COST_PRICE"));
        params.put("COST_PRICE", num.replaceAll(",", ""));
    	costManageService.insertCost(params);
        return "redirect:/profitCost/costTable";
    }
    
    
    @RequestMapping("/costUpdateForm")
    public String costUpdateForm(HttpServletRequest request, Model model, @RequestParam HashMap<String,Object> params) throws Exception {
    	SessionUtil.setCreator(request, params);
        model.addAttribute("list", parkingInfoService.selectListParkingInfo(new HashMap<String, Object>()));
    	model.addAttribute("data", costManageService.selectOneCost(params));
        return "/profitCost/costUpdateForm";
    }
    
    @RequestMapping("/updateCost")
    public String updateCost(HttpServletRequest request, Model model, @RequestParam HashMap<String,Object> params) throws Exception {
    	SessionUtil.setCreator(request, params);
        String num = String.valueOf(params.get("COST_PRICE"));
        params.put("COST_PRICE", num.replaceAll(",", ""));
    	costManageService.updateCost(params);
        return "redirect:/profitCost/costTable";
    }

    @RequestMapping("/profitTable")
    public String profitTable(Model model) throws Exception {
    	
    	HashMap<String, Object> data = new HashMap<String, Object>();
    	
    	model.addAttribute("list", parkingInfoService.selectListParkingInfo(data));
    	
    	
        return "/profitCost/profitTable(new)";
    }

    @RequestMapping("/profitChart")
    public String profitChart(Model model) throws Exception {
    	HashMap<String, Object> data = new HashMap<String, Object>();
    	model.addAttribute("list", parkingInfoService.selectListParkingInfo(data));
    	model.addAttribute("yearList", profitCostService.selectSearchYear());
    	
        return "/profitCost/profitChart(new)";
    }
}
