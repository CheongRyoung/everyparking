package com.everyparking.user.framework.common.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.everyparking.user.framework.common.service.CommonService;
import com.everyparking.user.framework.common.util.MessageDigestUtil;
import com.everyparking.user.framework.common.util.SessionUtil;
import com.everyparking.user.framework.common.vo.MemberVo;

@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {
	
	@Autowired
	CommonService commonService;
	
    @RequestMapping("/loginPage")
    public String loginForm(){
        return "/login/loginForm";
    }

    @RequestMapping("/register")
    public String registerForm(Model model) throws Exception{
    	List<HashMap<String, Object>> list = commonService.getSubCodeRoyalUser();
    	model.addAttribute("getSubCodeRoyalUserList", list);
        return "/login/register";
    }
    
    @RequestMapping("/home")
    public String mainHome(HttpSession session, Model model) {
		model.addAttribute("sessionUser", session.getAttribute("sessionUser"));
    	return "../main/home";
    }
    
    
    @RequestMapping("/registerProcess")
    public String registerProcess(MemberVo param, String [] SUB_CODE) throws Exception {
    	
    	System.out.println("시스템 로그] 회원가입 프로세스 실행");
		System.out.println("시스템 로그] id : " + param.getUSER_MAIL() + " pw : " + param.getUSER_PW());
    	
		commonService.registerMember(param, SUB_CODE);
		
		return "/login/welcome";
    }
    

	@RequestMapping("/loginProcess")
	public ModelAndView loginProcess(HttpServletRequest request, MemberVo param) throws Exception {
		
		MemberVo sessionUser = commonService.login(param);
		ModelAndView mav = new ModelAndView();
		
		
		if(sessionUser != null) {
			mav.addObject("sessionUser", sessionUser);
				SessionUtil.setSessionData(request, "sessionUser", sessionUser );
				mav.setViewName("redirect: /main/home");
		} else {
			//로그인 인증 실패
			mav.setViewName("/login/loginFail");
		}
		
		return mav;
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public String loggout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		return "redirect:/main/home";
	}
	
	//이메일 찾기
	@RequestMapping("/findEmail")
	public String findEmail() {
		return "/login/findEmail";
	}
	
	@RequestMapping("/findEmailProcess")
	public String findEmailProcess(MemberVo param, Model model) {
		
		
		
		MemberVo member = commonService.findEmail(param);
		
		if(member != null) {
			model.addAttribute("check", 0);
			model.addAttribute("USER_MAIL", member.getUSER_MAIL());
		} else {
			model.addAttribute("check", 1);
		}
		return "/login/findEmail";
	}
	
}