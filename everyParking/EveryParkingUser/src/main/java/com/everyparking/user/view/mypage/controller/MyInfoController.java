package com.everyparking.user.view.mypage.controller;



import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.everyparking.user.api.mypage.service.MyInfoService;
import com.everyparking.user.framework.common.controller.BaseController;
import com.everyparking.user.framework.common.service.CodeService;
import com.everyparking.user.framework.common.util.MessageDigestUtil;
import com.everyparking.user.framework.common.util.SessionUtil;

@Controller
@RequestMapping("/mypage/myinfo")
public class MyInfoController extends BaseController {
	

	@Autowired
    MyInfoService myInfoService;

	@Autowired
	CodeService codeService;
	
    @RequestMapping("/confirmPw")
    public String confirmPw(HttpServletRequest request) throws Exception {
		return "/mypage/myinfo/confirmPw";
    }

   
	    
	@RequestMapping("/logout")
	public String loggout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		String referer = request.getHeader("Referer");
		return "redirect:"+ referer;
	}
	

    
    @RequestMapping("/goodBye")
    public ModelAndView goodBye() {
        return new ModelAndView("/mypage/myinfo/goodBye");
    }

    @RequestMapping("/updatePage")
    public ModelAndView updatePage(HttpServletRequest request, @RequestParam HashMap<String,Object> params ) throws Exception {
    	ModelAndView mav = new ModelAndView();
    	// 비밀번호 체크 
    	params.put("USER_SEQ" , SessionUtil.getUSER_SEQ(request));
    	
    	int result = myInfoService.checkPw(params);
    	if(result > 0) {
    		/*TODO 기존 정보 조회하여서 셋팅할것 ..  >  우대사항은 배열이니 리스트를 따로 조회해서 반복문 돌려야할것같습니다. String_agg */
    		/* select GROUP_CONCAT(RU_TYPE)MY_ROYAL from everyparking.p_royaluser where user_seq = 1 */
    		SessionUtil.setCreator(request, params);
    		mav.addObject("data", myInfoService.selectOneInfo(params));
    		mav.addObject("royal", myInfoService.selectUserRoyal(params));
    		
    		params.put("MST_CODE", "RY");
    		mav.addObject("royalList", codeService.getCodeList(params));
    		mav.setViewName("/mypage/myinfo/updatePage");
    	} else {
    		mav.addObject("message", "비밀번호 불일치");
    		mav.setViewName("/mypage/myinfo/confirmPw");
    	}
    	return mav;
    }
   
    @RequestMapping("/updateComplete")
    public String updateInfo(HttpServletRequest request,
    		@RequestParam(value="royal") String[] royal,   
    		@RequestParam HashMap<String,Object> params) throws Exception {
    	SessionUtil.setCreator(request, params);
    	params.put("royal", royal);
    	myInfoService.updateInfo(params);
        return "/mypage/myinfo/updateComplete";
    }

}
