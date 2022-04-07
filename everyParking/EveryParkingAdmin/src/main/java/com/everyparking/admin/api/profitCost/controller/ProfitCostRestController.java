package com.everyparking.admin.api.profitCost.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;



import com.everyparking.admin.api.profitCost.service.ProfitCostService;
import com.everyparking.admin.framework.common.controller.BaseController;
import com.everyparking.admin.framework.common.util.SessionUtil;
import com.everyparking.admin.framework.common.vo.Ajax;

@RestController
@RequestMapping(value="/profitCost")
public class ProfitCostRestController extends BaseController {

	
    private static final Logger logger = LoggerFactory.getLogger(ProfitCostRestController.class);

    
    @Autowired
    ProfitCostService profitCostService;
    
    
    
    @RequestMapping("/selectListProfitCost")
    public ModelAndView selectListProfitCost(@RequestBody HashMap<String,Object> params) throws Exception{
        ModelAndView mav = super.createMav();
        try {
            mav = super.createMav(profitCostService.selectListProfitCost(params), profitCostService.selectListCountProfitCost(params));
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.TYPE_FAIL);
        }
        return mav;
    }
    
    
    
    @RequestMapping("/selectOneProfitCost")
    public ModelAndView selectOneProfitCost(@RequestBody HashMap<String,Object> params) throws Exception {
        ModelAndView mav = super.createMav();
        try {
            mav = super.createMav(profitCostService.selectOneProfitCost(params));
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.TYPE_FAIL);
        }
        return mav;
    }
    
    
    
    @RequestMapping("/deleteProfitCost")
    public ModelAndView deleteProfitCost(HttpServletRequest request, @RequestBody HashMap<String,Object> params) throws Exception{
        ModelAndView mav = super.createMav();
        try {
        	SessionUtil.setCreator(request, params);
            mav = super.createMav(profitCostService.deleteProfitCost(params));
            super.setMessage(mav, Ajax.DELETE.TEXT+"."+Ajax.TYPE_SUCCESS);
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.DELETE.TEXT+"."+Ajax.TYPE_FAIL);
        }
        return mav;
    }
    
    
    @RequestMapping("/selectReserChartDataByParkSeq")
    public ModelAndView selectReserChartDataByParkSeq(@RequestParam HashMap<String, Object> params) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	
    	ModelAndView mav = super.createMav();
    	map.put("reserList", profitCostService.selectChartByParkSeqAndYear(params));
    	map.put("costList", profitCostService.selectCostChartByParkSeqAndYear(params));
    	
    	try {
    		mav = super.createMav(map);
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.FAIL);
        }
        return mav;
    }
    
    
    @RequestMapping("/selectSearchYear")
    public ModelAndView selectSearchYear() throws Exception {
    	ModelAndView mav = super.createMav();
    	try {
    		mav = super.createMav(profitCostService.selectSearchYear());
    	}catch (Exception e) {
			logger.error(e.getMessage());
			super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.FAIL);
		}
    	return mav;
    }
}
