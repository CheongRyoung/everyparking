package com.everyparking.user.api.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.everyparking.user.api.mypage.service.ReviewService;
import com.everyparking.user.framework.common.controller.BaseController;
import com.everyparking.user.framework.common.util.SessionUtil;
import com.everyparking.user.framework.common.vo.Ajax;

@RestController
@RequestMapping(value="/mypage/review")
public class RestReviewController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(RestReviewController.class);
	
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping("/deleteProcess")
	public ModelAndView deleteProcess(@RequestBody HashMap<String, Object> params) throws Exception{
        ModelAndView mav = super.createMav();
        try {
            mav = super.createMav(reviewService.deleteReview(params));
            super.setMessage(mav, Ajax.DELETE.TEXT+"."+Ajax.TYPE_SUCCESS);
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.DELETE.TEXT+"."+Ajax.TYPE_FAIL);
        }
        return mav;
    }
	
}
