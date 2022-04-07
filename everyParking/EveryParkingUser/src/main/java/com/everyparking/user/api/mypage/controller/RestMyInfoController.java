package com.everyparking.user.api.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.everyparking.user.api.mypage.controller.RestMyInfoController;
import com.everyparking.user.api.mypage.service.MyInfoService;
import com.everyparking.user.framework.common.util.MessageDigestUtil;
import com.everyparking.user.framework.common.util.SessionUtil;
import com.everyparking.user.framework.common.vo.Ajax;
import com.everyparking.user.framework.common.controller.BaseController;

@Controller
@ResponseBody
@RequestMapping("/mypage/myinfo")
public class RestMyInfoController extends BaseController{


	 private static final Logger logger = LoggerFactory.getLogger(RestMyInfoController.class);

	    
	    @Autowired
	    MyInfoService myInfoService;
	    
	    
	    
	    @RequestMapping("/selectOneInfo")
	    public ModelAndView selectOneInfo(@RequestBody HashMap<String,Object> params) throws Exception {
	        ModelAndView mav = super.createMav();
	        try {
	            mav = super.createMav(myInfoService.selectOneInfo(params));
	        }catch (Exception e){
	            logger.error(e.getMessage());
	            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.FAIL);
	        }
	        return mav;
	    }
	    
	    @RequestMapping("/deleteInfo")
	    public ModelAndView deleteInfo(HttpServletRequest request, @RequestBody HashMap<String,Object> params) throws Exception{
	        ModelAndView mav = super.createMav();
	        try {
	        	SessionUtil.setCreator(request, params);
	            mav = super.createMav(myInfoService.deleteInfo(params));
	            SessionUtil.clearSession(request.getSession());
	        }catch (Exception e){
	            logger.error(e.getMessage());
	            super.setCustomMessage(mav, Ajax.FAIL, "탈퇴에 실패하였습니다. 관리자에게 문의해주세요.");
	        }
	        return mav;
	    }
	  
	    
	}
