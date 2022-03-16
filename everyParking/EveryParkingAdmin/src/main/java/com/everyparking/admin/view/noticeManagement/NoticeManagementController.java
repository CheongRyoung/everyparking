package com.everyparking.admin.view.noticeManagement;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.everyparking.admin.api.noticeManagement.controller.NoticeManagementRestController;
import com.everyparking.admin.api.noticeManagement.service.NoticeService;
import com.everyparking.admin.api.noticeManagement.service.NoticeServiceImpI;
import com.everyparking.admin.framework.common.controller.BaseController;

/*03/14 종화 작성*/
@Controller
@RequestMapping("/noticeManagement")
public class NoticeManagementController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeManagementRestController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private NoticeServiceImpI noticeServiceImpI;
	
	@RequestMapping("/noticeManagement")
	public String noticeManagement(){
		return"/noticeManagement/noticeManagement";
	}
	
	@RequestMapping("/noticeInsertForm")
	public String noticeInsertForm(@ModelAttribute(value="NOTI_SEQ") String NOTI_SEQ){
		return"/noticeManagement/noticeInsertForm";
	}
	
	@RequestMapping("/noticeUpdateForm")
	public String noticeUpdateForm(int NOTI_SEQ , Model model) throws Exception {
		
		HashMap<String, Object> map = noticeServiceImpI.getNotice(NOTI_SEQ);
		model.addAttribute("noti", map);
				
		return"/noticeManagement/noticeUpdateForm";
	}
	
}
