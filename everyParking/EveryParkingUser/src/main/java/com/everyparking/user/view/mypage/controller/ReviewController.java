package com.everyparking.user.view.mypage.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.everyparking.user.api.mypage.controller.RestReviewController;
import com.everyparking.user.api.mypage.service.ReviewService;
import com.everyparking.user.framework.common.controller.BaseController;
import com.everyparking.user.framework.common.util.SessionUtil;
import com.everyparking.user.framework.common.vo.Ajax;

@Controller
@RequestMapping("/mypage/review")
public class ReviewController extends BaseController{

	private static final Logger logger = LoggerFactory.getLogger(RestReviewController.class);
	
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping("/list")
	public String checkUsageReviewPage(@RequestParam HashMap<String, Object> params, HttpSession session, Model model) throws Exception {
		ModelAndView mav = SessionUtil.checkSession(session);
		SessionUtil.setCreator(session, params);
		List<HashMap<String, Object>> list = reviewService.selectMyReviewList(params);
		model.addAttribute("list", list);
		
		return "/mypage/review/checkUsageReviewPage";
	}
	
	@RequestMapping("/write")
	public String write(@RequestParam HashMap<String, Object> params, HttpSession session, Model model) throws Exception {
		ModelAndView mav = SessionUtil.checkSession(session);
		SessionUtil.setCreator(session, params);
		
		HashMap<String, Object> data = reviewService.selectOneMyReservationInfo(params);
		
		model.addAttribute("data", data);
		
		return "/mypage/review/write";
	}
	
	
	@RequestMapping("/insertReviewProcess")
	public String insertReviewProcess(HttpServletRequest request, HttpSession session, @RequestParam HashMap<String, Object> params) throws Exception {
		// params에 담긴 값 확인
		System.out.println("REV_STAR : " +  params.get("REV_STAR"));
		System.out.println("REV_CONT : " +  params.get("REV_CONT"));

			SessionUtil.setCreator(session, params);
			reviewService.insertReview(params);

		return "redirect:/mypage/review/list";
	}	
	
	@RequestMapping("/writeRevise")
	public String writeRevise(HttpSession session, @RequestParam HashMap<String, Object> params, Model model) throws Exception{
		SessionUtil.setCreator(session, params);
		
		System.out.println("REV_SEQ : " + params.get("REV_SEQ") );
		
		HashMap<String, Object> data = reviewService.selectOneMyReservationInfo(params);
		model.addAttribute("data", data);
		
		
		HashMap<String, Object> reviewInfo = reviewService.selectOneReviewInfo(params);
		model.addAttribute("reviewInfo", reviewInfo);
		
		return "/mypage/review/writeRevise";
	}
	
	@RequestMapping("/updateReviewProcess")
	public String updateReviewProcess(HttpServletRequest request, HttpSession session, @RequestParam HashMap<String, Object> params) throws Exception {
		System.out.println("REV_SEQ : " + params.get("REV_SEQ"));
		SessionUtil.setCreator(session, params);
		reviewService.updateReview(params);
		return "redirect:/mypage/review/list";
	}
	

}
