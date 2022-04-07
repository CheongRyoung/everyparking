package com.everyparking.admin.api.common;

import com.everyparking.admin.framework.common.controller.BaseController;
import com.everyparking.admin.framework.common.service.CommonService;
import com.everyparking.admin.framework.common.vo.Ajax;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/com")
public class RestComController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(RestComController.class);


    @Autowired
    CommonService commonService;

    @RequestMapping("/main")
    public ModelAndView todayData() {
        ModelAndView mav = createMav();
        try {
            mav = super.createMav(commonService.todayData());
        } catch (Exception e) {
            logger.error(e.getMessage());
            super.setMessage(mav,Ajax.FAIL+"."+Ajax.TYPE_FAIL);
        }
        return mav;
    }
}
