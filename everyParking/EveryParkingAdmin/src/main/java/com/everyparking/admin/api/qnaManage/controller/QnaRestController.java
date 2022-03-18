package com.everyparking.admin.api.qnaManage.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.everyparking.admin.api.qnaManage.service.QnaService;
import com.everyparking.admin.framework.common.controller.BaseController;
import com.everyparking.admin.framework.common.vo.Ajax;

@RestController
@RequestMapping(value="/qnaManage")
public class QnaRestController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnaRestController.class);
	
	@Autowired
	private QnaService qnaservice;
	
	@RequestMapping("/selectListQna")
	public ModelAndView selectListQna(@RequestBody HashMap<String,Object> params) throws Exception{
		ModelAndView mav = super.createMav();
		try {
			mav = super.createMav(qnaservice.selectListQna(params), qnaservice.selectListCountQna(params));
		} catch (Exception e) {
			logger.error(e.getMessage());
			super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.TYPE_FAIL);
		}
		return mav;
	}
}
