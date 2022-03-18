package com.everyparking.user.api.mypage.controller;

import com.everyparking.user.api.mypage.service.ReviewService;
import com.everyparking.user.framework.common.controller.BaseController;
import com.everyparking.user.framework.common.util.SessionUtil;
import com.everyparking.user.framework.common.vo.Ajax;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@ResponseBody
@RequestMapping("/mypage/review")
public class RestReviewContorller extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(RestReviewContorller.class);

    @Autowired
    ReviewService reviewService;

    @RequestMapping("/pastHistory")
    public ModelAndView pastHistory(HttpSession session, @RequestBody HashMap<String, Object> params) throws Exception {
        SessionUtil.setCreator(session, params);
        ModelAndView mav = super.createMav();
        try {
            mav = super.createMav(reviewService.getReservationList(params));
        } catch (Exception e) {
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.TPYE_FAIL);;
        }
        return mav;
    }

    @RequestMapping("/currentHistory")
    public ModelAndView currentHistory(HttpSession session, @RequestBody HashMap<String, Object> params) throws Exception {
        SessionUtil.setCreator(session, params);
        ModelAndView mav = super.createMav();
        try {
            mav = super.createMav(reviewService.getReservationList(params));
        } catch (Exception e) {
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.TPYE_FAIL);;
        }
        return mav;
    }

}
