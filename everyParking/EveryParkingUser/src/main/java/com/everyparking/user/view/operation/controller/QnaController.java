package com.everyparking.user.view.operation.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.everyparking.user.api.operation.service.QnaService;

@Controller
@RequestMapping("/operation/QNA")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
    @RequestMapping("/list")
    public ModelAndView list() {

        return new ModelAndView("/operation/qna/list");
    }

    @RequestMapping("/reply")
    public ModelAndView reply(int QNA_SEQ , Model model) throws Exception {

		HashMap<String, Object> map = qnaService.getQna(QNA_SEQ);
		model.addAttribute("qna",map);
		
		List<HashMap<String, Object>> list = qnaService.getCommentList(QNA_SEQ);
		model.addAttribute("commentList", list);
		
		HashMap<String, Object> qnaMove = qnaService.getNextPrev(QNA_SEQ);
		model.addAttribute("qnaMove",qnaMove);
		
		qnaService.qnaReadCount(QNA_SEQ);

        return new ModelAndView("/operation/qna/reply");
    }
    

    @RequestMapping("/write")
    public ModelAndView write() {
        return new ModelAndView("/operation/qna/write");
    }
    
    @RequestMapping("/updateQnaForm")
    public ModelAndView updateQna(int QNA_SEQ, Model model) throws Exception {
    	
		HashMap<String, Object> map = qnaService.getQna(QNA_SEQ);
		model.addAttribute("qna",map);
    	
        return new ModelAndView("/operation/qna/updateQnaForm");
    }
}
