package com.everyparking.admin.framework.common.controller;

import com.everyparking.admin.framework.common.view.JxlsExcelDown;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/excel")
public class ExcelController{

        @Autowired
        JxlsExcelDown je;

        /** 작성자: 김청룡
         *  작성일: 22-03-11
         * 템플릿을 활용한 엑셀 다운로드 구현 예시입니다.   **/
        @RequestMapping(value = "/download")
        public void excelDown(HttpServletResponse response) throws IOException {

        //데이터 만들기

        Map<String, Object> map = new HashMap<String, Object>();

        List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

        HashMap<String, Object> obj = null;

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");

        obj = new HashMap<String, Object>();
        obj.put("name", "나는");
        obj.put("age", "20");
        obj.put("address", "광진구");
        list.add(obj);

        obj = new HashMap<String, Object>();
        obj.put("name", "너는");
        obj.put("age", "30");
        obj.put("address", "분당구");
        list.add(obj);

        obj = new HashMap<String, Object>();
        obj.put("name", "야는");
        obj.put("age", "40");
        obj.put("address", "구로구");
        list.add(obj);

        map.put("list", list);
        map.put("count", list.size());
        map.put("DownloadDate", sdf.format(new Date()));


        /** 엑셀 다운로드
         *  Map<String, Object> 안에 data를 담는것을 완료하면 아래와 같이 파라미터 값을 넣어줍니다.
         *  excelDown(응답, 데이타, 템플릿이름, 다운로드시 나타날 이름)
         *  템플릿이름은 resource  > templates 폴더 안에서 확인할 수 있습니다.
         *  템플릿을 여서서 확인 후 각자 원하는 형식으로 바꿀수 있습니다.
         * **/
        je.excelDown(response, map, "sample", "아123");
        }
}