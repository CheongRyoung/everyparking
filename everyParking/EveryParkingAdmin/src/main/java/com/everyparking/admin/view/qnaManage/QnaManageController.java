package com.everyparking.admin.view.qnaManage;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.everyparking.admin.api.qnaManage.service.QnaService;
import com.everyparking.admin.framework.common.controller.BaseController;

@Controller
@RequestMapping("/qnaManage")
public class QnaManageController extends BaseController{
	
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping("/qnaManage")
	public String qnaManage(){
		return "/qnaManage/qnaManage";
	}
	
	@RequestMapping("/readQnaPage")
	public String readQnaPage(int QNA_SEQ , Model model) throws Exception{
		
		HashMap<String, Object> map = qnaService.getQna(QNA_SEQ);
		model.addAttribute("qna",map);
		
		List<HashMap<String, Object>> list = qnaService.getCommentList(QNA_SEQ);
		model.addAttribute("commentList", list);
		
		HashMap<String, Object> qnaMove = qnaService.getNextPrev(QNA_SEQ);
		model.addAttribute("qnaMove",qnaMove);
		
		return "/qnaManage/readQnaPage";
	}


	
}
