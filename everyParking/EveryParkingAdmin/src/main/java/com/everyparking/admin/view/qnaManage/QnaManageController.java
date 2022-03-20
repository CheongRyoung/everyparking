package com.everyparking.admin.view.qnaManage;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.everyparking.admin.api.qnaManage.service.QnaService;

@Controller
@RequestMapping("/qnaManage")
public class QnaManageController {
	
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping("/qnaManage")
	public String qnaManage(){
		return "/qnaManage/qnaManage";
	}
	
	@RequestMapping("/readQnaPage")
	public String readQnaPage(int QNA_SEQ , Model model) throws Exception{
		
		qnaService.qnaReadCount(QNA_SEQ);
		HashMap<String, Object> map = qnaService.getQna(QNA_SEQ);
		model.addAttribute("qna",map);
		return "/qnaManage/readQnaPage";
	}
}
