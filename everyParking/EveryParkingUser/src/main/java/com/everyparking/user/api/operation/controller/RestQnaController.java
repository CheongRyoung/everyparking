package com.everyparking.user.api.operation.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.everyparking.user.api.operation.service.QnaService;
import com.everyparking.user.framework.common.controller.BaseController;
import com.everyparking.user.framework.common.util.SessionUtil;
import com.everyparking.user.framework.common.vo.Ajax;
import com.everyparking.user.framework.common.vo.MemberVo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



@RestController
@RequestMapping(value="/operation/QNA")
public class RestQnaController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestQnaController.class);
	@Autowired
	private QnaService qnaservice;
		
	@RequestMapping("/selectListQna")
	public ModelAndView selectListQna(@RequestBody HashMap<String,Object> params) throws Exception{
		ModelAndView mav = super.createMav();
		try {
			mav = super.createMav(qnaservice.selectListQna(params), qnaservice.selectListCountQna(params));
			super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.TYPE_SUCCESS);
		} catch (Exception e) {
			logger.error(e.getMessage());
			super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.TYPE_FAIL);
		}
		return mav;
	}
	
	@RequestMapping("/insertComment")
	public ModelAndView insertComment(HttpServletRequest request
			, @RequestParam HashMap<String, Object> params
			) throws Exception{
		ModelAndView mav = super.createMav();
		try {
			SessionUtil.setCreator(request, params);
			mav = super.createMav(qnaservice.insertComment(request, params));
			super.setMessage(mav, Ajax.SAVE.TEXT+"."+Ajax.TYPE_SUCCESS);
		} catch (Exception e) {
			logger.error(e.getMessage());
			super.setMessage(mav, Ajax.SAVE.TEXT+"."+Ajax.TYPE_FAIL);
		}
		mav.setViewName("redirect: /operation/QNA/list");
		return mav;
	}
		
	
	@RequestMapping("/insertReply")
	public ModelAndView insertReply(HttpServletRequest request
			, @RequestParam HashMap<String, Object> params
			) throws Exception{
		ModelAndView mav = super.createMav();
		try {
			SessionUtil.setCreator(request, params);
			mav = super.createMav(qnaservice.insertReply(request, params));
			super.setMessage(mav, Ajax.SAVE.TEXT+"."+Ajax.TYPE_SUCCESS);
		} catch (Exception e) {
			logger.error(e.getMessage());
			super.setMessage(mav, Ajax.SAVE.TEXT+"."+Ajax.TYPE_FAIL);
		}
		mav.setViewName("redirect: /operation/QNA/list");
		return mav;
	}
	
	@RequestMapping("/deleteComment")
	public ModelAndView deleteComment(HttpServletRequest request
									, @RequestParam HashMap<String, Object> params
									, int QNAC_SEQ) throws Exception{
		ModelAndView mav = super.createMav();
		try {
			SessionUtil.setCreator(request, params);
			mav = super.createMav(qnaservice.deleteComment(QNAC_SEQ));
			super.setMessage(mav, Ajax.UPDATE.TEXT+"."+Ajax.TYPE_SUCCESS);
		} catch (Exception e) {
			logger.error(e.getMessage());
			super.setMessage(mav, Ajax.UPDATE.TEXT+"."+Ajax.TYPE_FAIL);
		}
		return mav;
	}
	
	@RequestMapping("/deleteReply")
	public ModelAndView deleteReply(HttpServletRequest request
									, @RequestParam HashMap<String, Object> params
									, int QNAC_SEQ) throws Exception{
		ModelAndView mav = super.createMav();
		try {
			SessionUtil.setCreator(request, params);
			mav = super.createMav(qnaservice.deleteReply(QNAC_SEQ));
			super.setMessage(mav, Ajax.UPDATE.TEXT+"."+Ajax.TYPE_SUCCESS);
		} catch (Exception e) {
			logger.error(e.getMessage());
			super.setMessage(mav, Ajax.UPDATE.TEXT+"."+Ajax.TYPE_FAIL);
		}
		return mav;
	}

	
	@RequestMapping("/insertQna")
	public ModelAndView insertQna(HttpServletRequest request
			, @RequestParam HashMap<String, Object> params
			) throws Exception{
		ModelAndView mav = super.createMav();
		try {
			SessionUtil.setCreator(request, params);
			mav = super.createMav(qnaservice.insertQna(request, params));
			super.setMessage(mav, Ajax.SAVE.TEXT+"."+Ajax.TYPE_SUCCESS);
		} catch (Exception e) {
			logger.error(e.getMessage());
			super.setMessage(mav, Ajax.SAVE.TEXT+"."+Ajax.TYPE_FAIL);
		}
		mav.setViewName("redirect:/operation/QNA/list");
		return mav;
	}
	
	@RequestMapping("/updateQna")
	public ModelAndView updateQna(HttpServletRequest request
								, @RequestBody HashMap<String,Object> params) throws Exception{
		ModelAndView mav = super.createMav();
		try {
			SessionUtil.setCreator(request, params);
			mav = super.createMav(qnaservice.updateQna(params));
			super.setMessage(mav, Ajax.UPDATE.TEXT+"."+ Ajax.TYPE_SUCCESS);
		}catch(Exception e) {
			super.setMessage(mav, Ajax.UPDATE.TEXT+"."+ Ajax.TYPE_FAIL);
		}	
		return mav;
	}
	
	@RequestMapping("getSessionInfo")
	public HashMap<String, Object> getSessionInfo(HttpSession session) throws Exception{
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");		
		
		
		if(sessionUser == null) {
			data.put("result", "empty");
		}else {
			data.put("result", "success");
			data.put("userNo", sessionUser.getUSER_SEQ());
			data.put("userName", sessionUser.getUSER_NAME());
		}
		
		
		return data;
	}
	
	@RequestMapping("/updateComment")
	public ModelAndView updateComment(HttpServletRequest request
									, @RequestBody HashMap<String, Object> params) throws Exception{
		ModelAndView mav = super.createMav();
		try {
			SessionUtil.setCreator(request, params);
			mav = super.createMav(qnaservice.updateComment(params));
			super.setMessage(mav, Ajax.UPDATE.TEXT+"."+Ajax.TYPE_SUCCESS);
		} catch (Exception e) {
			logger.error(e.getMessage());
			super.setMessage(mav, Ajax.UPDATE.TEXT+"."+Ajax.TYPE_FAIL);
		}
		return mav;
	}
		
	@RequestMapping("/getCommentList")
	public List<HashMap<String, Object>> getCommentList(@RequestParam HashMap<String,Object> params, int QNA_SEQ) throws Exception{
		List<HashMap<String, Object>> list = null;
		try {
			list = qnaservice.getCommentList(QNA_SEQ);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return list;
	}	
}
