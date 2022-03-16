package com.everyparking.admin.view.parkingBlock.controller;

import com.everyparking.admin.framework.common.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/parkingBlock")
public class ParkingBlockController extends BaseController {


    @RequestMapping("/parkingBlock")
    public String test9() {
        return "/parkingBlock/parkingBlock";
    }

    @RequestMapping("/parkingBlockRegister")
    public String test10() {
        return "/parkingBlock/parkingBlockRegister";
    }
    
    @RequestMapping("/parkingBlockRevise")
    public String test11() {
        return "/parkingBlock/parkingBlockRevise";
    }
    
}
