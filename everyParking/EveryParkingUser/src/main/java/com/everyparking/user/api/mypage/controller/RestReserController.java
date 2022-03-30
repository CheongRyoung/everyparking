package com.everyparking.user.api.mypage.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.everyparking.user.api.mypage.service.ReserService;
import com.everyparking.user.api.mypage.service.ReserServiceImpl;
import com.everyparking.user.framework.common.controller.BaseController;
import com.everyparking.user.framework.common.util.SessionUtil;
import com.everyparking.user.framework.common.vo.Ajax;

@RestController
@RequestMapping("/mypage/reservation")
public class RestReserController extends BaseController{


	private static final Logger logger = LoggerFactory.getLogger(RestMyInfoController.class);

	@Autowired
	ReserService reserService;
	
	
	@RequestMapping("/selectListReservation")
	public ModelAndView selectListReservation(HttpServletRequest request, @RequestBody HashMap<String,Object> params) throws Exception{
		ModelAndView mav = super.createMav();
        try {
        	SessionUtil.setCreator(request, params);
            mav = super.createMav(reserService.selectListReservation(params), reserService.selectListCountReservation(params));
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.FAIL);
        }
        return mav;
	}
	

	@RequestMapping("/selectOneReservation")
	public ModelAndView selectOneReservation(HttpServletRequest request,@RequestBody HashMap<String,Object> params) throws Exception{
		ModelAndView mav = super.createMav();
        try {
        	SessionUtil.setCreator(request, params);
            mav = super.createMav(reserService.selectOneReservation(params));
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.FAIL);
        }
        return mav;
	}

	@RequestMapping("/cancelReservation")
	public ModelAndView cancelReservation(HttpServletRequest request, @RequestBody HashMap<String,Object> params) throws Exception{
		ModelAndView mav = super.createMav();
        try {
        	SessionUtil.setCreator(request, params);
            mav = super.createMav(reserService.cancelReservation(params));
            super.setCustomMessage(mav, Ajax.SUCCESS, "예약 취소되었습니다.");
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setCustomMessage(mav, Ajax.FAIL, "예약 취소에 실패 하였습니다. 관리자에게 문의하세요.");
        }
        return mav;
	}
}
