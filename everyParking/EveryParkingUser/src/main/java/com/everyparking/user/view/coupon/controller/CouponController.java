package com.everyparking.user.view.coupon.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.everyparking.user.api.coupon.service.CouponService;
import com.everyparking.user.framework.common.controller.BaseController;
import com.everyparking.user.framework.common.vo.MemberVo;

@Controller
@RequestMapping("/coupon")
public class CouponController extends BaseController {
	
	@Autowired
	CouponService couponService;

    @RequestMapping("/couponList")
    public String couponList(Model model, HttpSession session) throws Exception {

    	int USER_SEQ = 0;

    	MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
    	if(sessionUser != null) {
    		USER_SEQ = sessionUser.getUSER_SEQ();
    		
    		
    	}
    	
    	List<HashMap<String, Object>> dataList = couponService.selectCouponList(USER_SEQ);
    	model.addAttribute("dataList", dataList);
    	

        return "/coupon/couponList";
    }
    
    @RequestMapping("/myCoupon")
    public String myCoupon(HttpSession session, @RequestParam HashMap<String, Object> params, Model model) throws Exception {
    	MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
    	if(sessionUser != null) {
    		int userSeq = sessionUser.getUSER_SEQ();
    		params.put("USER_SEQ", userSeq);
    		
    		List<HashMap<String, Object>> myCouponData = couponService.selectMyCouponList(params);
    		model.addAttribute("myCouponData", myCouponData);
    	}    	
    	
    	
    	
    	
    	return "/coupon/myCoupon";
    }
    
    
    @RequestMapping("/getCoupon")
    public String getCoupon(@RequestParam HashMap<String, Object> params, HttpSession session, Model model) throws Exception {
    	
    	
    	MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
    	if(sessionUser != null) {
    		//로그인
    		int userSeq = sessionUser.getUSER_SEQ();
    		params.put("USER_SEQ", userSeq);

    		
    	}
    	
    	couponService.getCouponData(params);
    	couponService.updateCouponCount(params);
    	List<HashMap<String, Object>> couponData =  couponService.getCoupon(params);
    	model.addAttribute("couponData", couponData);
    	
    	return "redirect:/coupon/myCoupon";
    }
    

}
