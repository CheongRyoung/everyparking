 package com.everyparking.admin.api.noticeManagement.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.everyparking.admin.api.noticeManagement.service.NoticeService;
import com.everyparking.admin.api.noticeManagement.service.NoticeServiceImpl;
import com.everyparking.admin.framework.common.controller.BaseController;
import com.everyparking.admin.framework.common.util.SessionUtil;
import com.everyparking.admin.framework.common.vo.Ajax;

/*03/14 종화 작성*/
@RestController
@RequestMapping(value="/noticeManagement")
public class NoticeManagementRestController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(NoticeManagementRestController.class);
	
	@Autowired
	private NoticeService noticeService;

	/*
	@RequestMapping("/uploadTest")
	public String uploadTest(HttpServletRequest request
							, @RequestParam HashMap<String,Object> params
							, String editorData
							, String notiTitle) throws Exception {
		System.out.println(editorData);
		System.out.println(notiTitle);
		noticeService.insertNotiTest(editorData, notiTitle, request, params);
		return "sucess";
	}
	*/
	
	@RequestMapping("/selectListNoti")
	public ModelAndView selectListNoti(@RequestBody HashMap<String,Object> params) throws Exception{
		ModelAndView mav = super.createMav();
		try {
			mav = super.createMav(noticeService.selectListNoti(params),noticeService.selectListCountNoti(params));
		} catch (Exception e) {
			logger.error(e.getMessage());
			super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.TYPE_FAIL);
		}
		return mav;
	}

	
	@RequestMapping("/updateNoti")
	public ModelAndView updateNoti(HttpServletRequest request
								, @RequestBody HashMap<String,Object> params) throws Exception{
		ModelAndView mav = super.createMav();
		try {
			SessionUtil.setCreator(request, params);
			mav = super.createMav(noticeService.updateNoti(params));
			super.setMessage(mav, Ajax.UPDATE.TEXT+"."+ Ajax.TYPE_SUCCESS);
		}catch(Exception e) {
			super.setMessage(mav, Ajax.UPDATE.TEXT+"."+ Ajax.TYPE_FAIL);
		}
		return mav;
	}
	
	@RequestMapping("/deleteNoti")
	public ModelAndView deleteNoti(HttpServletRequest request, @RequestBody HashMap<String,Object> params) throws Exception{
		ModelAndView mav = super.createMav();
		try {
			SessionUtil.setCreator(request, params);
			mav = super.createMav(noticeService.deleteNoti(params));
			super.setMessage(mav, Ajax.DELETE.TEXT+"."+ Ajax.TYPE_SUCCESS);
		} catch (Exception e) {
			logger.error(e.getMessage());
			super.setMessage(mav, Ajax.DELETE.TEXT+"."+Ajax.TYPE_FAIL);
		}
		return mav;
	}
	
	@RequestMapping("/testlogin")
	public ModelAndView testlogin(HttpServletRequest request) throws Exception {
		HashMap<String,Object> params = new HashMap<>();
		params.put("USER_SEQ", 0);
		SessionUtil.setSessionData(request, "member", params );
		return super.createMav(Ajax.SEARCH.TEXT+"."+Ajax.TYPE_SUCCESS);
	}
}
