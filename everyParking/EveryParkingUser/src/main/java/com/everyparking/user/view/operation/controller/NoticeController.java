package com.everyparking.user.view.operation.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.everyparking.user.api.operation.controller.RestNoticeController;
import com.everyparking.user.api.operation.service.NoticeService;
import com.everyparking.user.framework.common.controller.BaseController;


@Controller
@RequestMapping("/operation/notice")
public class NoticeController extends BaseController{

	private static final Logger logger = LoggerFactory.getLogger(RestNoticeController.class);

	@Autowired
	private NoticeService noticeService;

    @RequestMapping("/content")
    public ModelAndView content(int NOTI_SEQ, Model model) throws Exception {
    	
		HashMap<String, Object> map = noticeService.getNotice(NOTI_SEQ);
		model.addAttribute("noti", map);
		
		HashMap<String, Object> move = noticeService.getNextPrev(NOTI_SEQ);
		model.addAttribute("move",move);   
		
		noticeService.notiReadCount(NOTI_SEQ);

        return new ModelAndView("/operation/notice/content");
    }

    @RequestMapping("/list")
    public ModelAndView list() throws Exception {
        return new ModelAndView("/operation/notice/list");
    }
}
