package com.everyparking.admin.api.couponManagement.controller;

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

import com.everyparking.admin.api.couponManagement.service.CouponService;
import com.everyparking.admin.framework.common.controller.BaseController;
import com.everyparking.admin.framework.common.util.SessionUtil;
import com.everyparking.admin.framework.common.vo.Ajax;
import com.everyparking.admin.framework.file.service.FileService;

@RestController
@RequestMapping(value="/couponManagement")
public class CouponManagementRestController extends	BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(CouponManagementRestController.class);
	
	@Autowired
	CouponService couponService;
	
	@Autowired
	FileService fileService;
	
	@RequestMapping("/insertCoupon")
	public ModelAndView insertCoupon(HttpServletRequest request
			, @RequestParam HashMap<String, Object> params
			) throws Exception{
		
		ModelAndView mav = super.createMav();
		try {
			SessionUtil.setCreator(request, params);
			mav = super.createMav(couponService.insertCoupon(request, params));
			super.setMessage(mav, Ajax.SAVE.TEXT+"."+Ajax.TYPE_SUCCESS);
		} catch (Exception e) {
			logger.error(e.getMessage());
			super.setMessage(mav, Ajax.SAVE.TEXT+"."+Ajax.TYPE_FAIL);
		}
		mav.setViewName("redirect: /couponManagement/couponManagement");
		return mav;
	}
	
	@RequestMapping("/selectListCoupon")
	public ModelAndView selectListCoupon(@RequestBody HashMap<String,Object> params) throws Exception{
		ModelAndView mav = super.createMav();
		try {
			mav = super.createMav(couponService.selectListCoupon(params), couponService.selectListCountCoupon(params));
		} catch (Exception e) {
			logger.error(e.getMessage());
			super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.TYPE_FAIL);
		}
		return mav;
	}
	
	@RequestMapping("/deleteCoupon")
	public ModelAndView deleteCoupon(HttpServletRequest request, @RequestBody HashMap<String,Object> params) throws Exception{
		ModelAndView mav = super.createMav();
		try {
			SessionUtil.setCreator(request, params);
			mav = super.createMav(couponService.deleteCoupon(params));
			super.setMessage(mav, Ajax.DELETE.TEXT+"."+ Ajax.TYPE_SUCCESS);
		} catch (Exception e) {
			logger.error(e.getMessage());
			super.setMessage(mav, Ajax.DELETE.TEXT+"."+Ajax.TYPE_FAIL);
		}
		return mav;
	}

}
