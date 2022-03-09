package com.everyparking.admin.framework.test.controller;

import com.everyparking.admin.HomeController;
import com.everyparking.admin.framework.common.controller.BaseController;
import com.everyparking.admin.framework.common.vo.Ajax;
import com.everyparking.admin.framework.test.service.TestService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

@RestController
@RequestMapping("/test")
public class TestRestController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(TestRestController.class);

    @Autowired
    private TestService testService;

    @RequestMapping("/testAjax")
    public ModelAndView testAjax(@RequestBody HashMap<String, Object> params){
        // grid ajax를 호출하게 되면 파라미터로 row개수("CNT")와 시작 index("START")를 던저준다.
        int count = (Integer) params.get("CNT");
        int startIndex = (Integer) params.get("START");
        int extCount = count+startIndex;

        ArrayList<LinkedHashMap<String, Object>> result = testService.getDBTest();
        ArrayList<LinkedHashMap<String, Object>> responseData = new ArrayList<>();

        /** 마지막 페이지 갯수 검사**/
        if(count+startIndex > result.size()) {
            extCount = result.size();
        }

        /** 배열중 원하는 인덱스 복사 **/
        for(int i=startIndex; i<extCount; i++){
            responseData.add(result.get(i));
        }

        ModelAndView mav = createMav();
        try {
            mav = createMav(responseData, result.size());
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.FAIL);
        }
        return mav;
    }

    @RequestMapping("/testSaveAjax")
    public ModelAndView testSaveAjax(@RequestBody HashMap<String,Object> params){
        ModelAndView mav = createMav(Ajax.SAVE.TEXT+"."+Ajax.SUCCESS);
        try {
            mav = createMav(testService.DBUploadTest("1"));
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SAVE.TEXT+"."+Ajax.FAIL);
        }
        return mav;
    }

}
