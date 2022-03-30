package com.everyparking.user.framework.common.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.everyparking.user.framework.common.service.CommonService;


@RestController
@RequestMapping(value="/login")
public class RestLoginController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestLoginController.class);
	
	@Autowired
	CommonService commonService;
	
	@RequestMapping("/isExistEmail")
	public HashMap<String, Object> isExistEmail(String USER_MAIL){
		
		HashMap<String, Object> data = new HashMap<>();
		
		boolean result = commonService.isExistEmail(USER_MAIL);
		
		data.put("result", result);
		
		return data;
	}
	
	@RequestMapping("/isExistCarNo")
	public HashMap<String, Object> isExistCarNo(String USER_CAR_NO){
		
		HashMap<String, Object> data = new HashMap<>();
		
		boolean result = commonService.isExistCarNo(USER_CAR_NO);
		
		data.put("result", result);
		
		return data;
	}
}
