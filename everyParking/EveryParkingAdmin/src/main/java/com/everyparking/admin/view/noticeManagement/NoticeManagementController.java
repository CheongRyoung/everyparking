package com.everyparking.admin.view.noticeManagement;

import java.util.HashMap;

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

import com.everyparking.admin.api.noticeManagement.controller.NoticeManagementRestController;
import com.everyparking.admin.api.noticeManagement.service.NoticeService;
import com.everyparking.admin.framework.common.controller.BaseController;
import com.everyparking.admin.framework.common.util.SessionUtil;
import com.everyparking.admin.framework.common.vo.Ajax;

/*03/14 종화 작성*/
@Controller
@RequestMapping("/noticeManagement")
public class NoticeManagementController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeManagementRestController.class);
	
	@Autowired
	private NoticeService noticeService;
		
	@RequestMapping("/noticeManagement")
	public String noticeManagement(){
		return"/noticeManagement/noticeManagement";
	}
	
	@RequestMapping("/readNoticePage")
	public String readNoticePage(int NOTI_SEQ, Model model) throws Exception {

		noticeService.notiReadCount(NOTI_SEQ);
		
		HashMap<String, Object> map = noticeService.getNotice(NOTI_SEQ);
		model.addAttribute("noti", map);

		return"/noticeManagement/readNoticePage";
	}
	
	@RequestMapping("/noticeInsertForm")
	public String noticeInsertForm(@ModelAttribute(value="NOTI_SEQ") String NOTI_SEQ){
		return"/noticeManagement/noticeInsertForm";
	}
	
	@RequestMapping("/noticeUpdateForm")
	public String noticeUpdateForm(int NOTI_SEQ , Model model) throws Exception {
		
		HashMap<String, Object> map = noticeService.getNotice(NOTI_SEQ);
		model.addAttribute("noti", map);
				
		return"/noticeManagement/noticeUpdateForm";
	}
	
	@RequestMapping("/insertNoti")
	public ModelAndView insertNoti(HttpServletRequest request
			, @RequestParam HashMap<String, Object> params
			) throws Exception{
		
		ModelAndView mav = super.createMav();
		try {
			SessionUtil.setCreator(request, params);
			mav = super.createMav(noticeService.insertNoti(request, params));
			super.setMessage(mav, Ajax.SAVE.TEXT+"."+Ajax.TYPE_SUCCESS);
		} catch (Exception e) {
			logger.error(e.getMessage());
			super.setMessage(mav, Ajax.SAVE.TEXT+"."+Ajax.TYPE_FAIL);
		}
		mav.setViewName("redirect: /noticeManagement/noticeManagement");
		return mav;
	}
}
