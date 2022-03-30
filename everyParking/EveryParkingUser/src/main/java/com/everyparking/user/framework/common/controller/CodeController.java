package com.everyparking.user.framework.common.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.everyparking.user.framework.common.service.CodeService;
import com.everyparking.user.framework.common.vo.Ajax;

@RestController
@RequestMapping(value="/code")
public class CodeController extends BaseController{


	@Autowired
	CodeService codeService;
	
    private static final Logger logger = LoggerFactory.getLogger(CodeController.class);
    
	@RequestMapping("/getCodeList")
	public ModelAndView getCodeList(@RequestBody HashMap<String,Object> params) throws Exception {
		ModelAndView mav = createMav();
		try {
			mav = super.createMav(codeService.getCodeList(params));
        } catch (Exception e) {
            super.setMessage(mav, Ajax.FAIL+"."+Ajax.TYPE_FAIL);
            logger.error(e.getMessage());
        }
		return mav;
	}
	
	
}
