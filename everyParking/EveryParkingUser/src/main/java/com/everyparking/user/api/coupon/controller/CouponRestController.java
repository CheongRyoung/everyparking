package com.everyparking.user.api.coupon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.everyparking.user.api.coupon.service.CouponService;
import com.everyparking.user.api.main.controller.MainRestController;
import com.everyparking.user.api.main.service.MainService;
import com.everyparking.user.framework.common.controller.BaseController;
import com.everyparking.user.framework.common.util.SessionUtil;
import com.everyparking.user.framework.common.vo.Ajax;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping(value="/coupon")
public class CouponRestController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(CouponRestController.class);
	
	@Autowired
	CouponService couponService;


}
