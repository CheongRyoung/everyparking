package com.everyparking.admin.view.couponManagement.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.everyparking.admin.api.couponManagement.service.CouponService;
import com.everyparking.admin.api.noticeManagement.controller.NoticeManagementRestController;
import com.everyparking.admin.api.noticeManagement.service.NoticeService;
import com.everyparking.admin.framework.common.controller.BaseController;
import com.everyparking.admin.framework.common.util.SessionUtil;
import com.everyparking.admin.framework.common.vo.Ajax;

@Controller
@RequestMapping("/couponManagement")
public class CouponManagementController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(CouponManagementController.class);
	
	@Autowired
	CouponService couponService;
		
	@RequestMapping("/couponManagement")
	public String couponManagement(){
		return"/couponManagement/couponManagement";
	}
	
	
	@RequestMapping("/couponInsertForm")
	public String couponInsertForm(){
		return"/couponManagement/couponInsertForm";
	}
	
}
