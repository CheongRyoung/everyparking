package com.everyparking.user.api.kakaopay.controller;

import com.everyparking.user.api.kakaopay.service.KakaoService;
import com.everyparking.user.api.kakaopay.vo.ApproveResponse;
import com.everyparking.user.api.kakaopay.vo.ReadyResponse;
import com.everyparking.user.api.kakaopay.vo.RefundResponse;
import com.everyparking.user.api.main.service.MainService;

import com.everyparking.user.api.mypage.service.ReserService;
import com.everyparking.user.framework.common.controller.BaseController;
import com.everyparking.user.framework.common.util.SessionUtil;
import com.everyparking.user.framework.common.vo.Ajax;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes({"tid","order"})
public class KakaopayController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(KakaopayController.class);

    @Autowired
    KakaoService kakaoService;
    
    @Autowired
    MainService mainService;

    @Autowired
    ReserService reserService;

    @ResponseBody
    @RequestMapping("/order/pay")
    public ReadyResponse readyPay(HttpSession session, HttpServletRequest request, @RequestParam HashMap<String, Object> params, Model model) throws Exception{

        // kakao service 와 통신
        ReadyResponse readyResponse = kakaoService.payReady(session, request, params);


        model.addAttribute("tid", readyResponse.getTid());
        model.addAttribute("order", params);

        return readyResponse;
    }

    
    @RequestMapping("/order/pay/completed")
    public String payCompleted(@RequestParam("pg_token") String pgToken,
                               @ModelAttribute("tid") String tid,
                               @ModelAttribute("order") HashMap<String, Object> order,
                               Model model,
                               HttpSession session) throws Exception {

        // 유효성 검사 정말로 빈자리가 있는지 체크
    	List<HashMap<String, Object>> dataList = mainService.selectSectionInfoForRese(order);
    	
    	HashMap<String, Object> data = new HashMap<String, Object>();
    	
    	String secSeq = String.valueOf(order.get("SEC_SEQ"));
    	
    	for(HashMap<String, Object> forData : dataList) {
    		if(String.valueOf(forData.get("SEC_SEQ")).equals(secSeq)) {
    			data = forData;
    			break;
    		}
    	}
    	
    	if(((BigDecimal)data.get("remaincnt")).intValue() > 0) {
    		ApproveResponse approveResponse = kakaoService.payApprove(session, tid, pgToken);
            order.put("RESE_TID", approveResponse.getTid());
    		mainService.insertReservation(order);
    		mainService.updateUserCoupon(order);
    		return "redirect:/main/reservationComplete";
    	}
        return "/order/pay/fail";
    }

    // 결제 취소시 실행 url
    @RequestMapping("/order/pay/cancel")
    public String payCancel() {
        return "redirect:/main/home";
    }

    // 결제 실패시 실행 url
    @RequestMapping("/order/pay/fail")
    public String payFail() {
        return "/mypage/reservation/failOrder";
    }

    // 결제 환불시 실행

    @RequestMapping("/order/pay/refund")
    public @ResponseBody ModelAndView payRefund(@RequestBody HashMap<String, Object> params, HttpSession session) throws Exception {
        ModelAndView mav = createMav();
        try{
            SessionUtil.setCreator(session, params);
            HashMap<String, Object> data = kakaoService.getTid(params);
            RefundResponse refundResponse = kakaoService.payRefund(data);
            mav = super.createMav(reserService.cancelReservation(params));
            super.setCustomMessage(mav, Ajax.SUCCESS, "예약 취소되었습니다.");
        } catch(Exception e) {
            logger.error(e.getMessage());
            super.setCustomMessage(mav, Ajax.FAIL, "예약 취소에 실패 하였습니다. 관리자에게 문의하세요.");
        }
        return mav;
    }

}
