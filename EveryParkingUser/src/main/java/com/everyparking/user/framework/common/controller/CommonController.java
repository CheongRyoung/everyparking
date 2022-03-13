package com.everyparking.user.framework.common.controller;

import com.everyparking.user.framework.common.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class CommonController {

    @Autowired
    CommonService commonService;


    @RequestMapping("/Home")
    public String adminHome(){
        /** 세션 검사 추가해야하는데 이작업은 나중에 하셔도 됩니다 **/
        return "/parkingManage/adminHome";
    }
}
