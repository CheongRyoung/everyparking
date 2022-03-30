package com.everyparking.user.api.operation.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import com.everyparking.user.api.operation.service.NoticeService;
import com.everyparking.user.framework.common.controller.BaseController;
import com.everyparking.user.framework.common.vo.Ajax;



@RestController
@RequestMapping("/operation/notice")
public class RestNoticeController extends BaseController{
    private static final Logger logger = LoggerFactory.getLogger(RestNoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/selectListNoti")
	public ModelAndView selectListNoti(@RequestBody HashMap<String,Object> params) throws Exception{
		ModelAndView mav = super.createMav();
		try {
			mav = super.createMav(noticeService.selectListNoti(params),noticeService.selectListCountNoti(params));
			super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.TYPE_SUCCESS);
		} catch (Exception e) {
			logger.error(e.getMessage());
			super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.TYPE_FAIL);
		}
		return mav;
	}


}
