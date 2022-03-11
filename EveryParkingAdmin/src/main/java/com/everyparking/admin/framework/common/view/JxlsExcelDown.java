package com.everyparking.admin.framework.common.view;

import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

/** 작성자: 김청룡
 *  작성일: 22-03-11
 *  설명: 엑셀 다운로드 템플릿 활용
 * **/

@Component
public class JxlsExcelDown {

    public void excelDown(HttpServletResponse response, Map<String, Object> data, String template, String newfileName) throws IOException {
        
        /** 템플릿을 읽어옵니다. **/
        InputStream is = new ClassPathResource("/templates/" + template +".xlsx").getInputStream();

        /** 쓰는 곳을 지정해줍니다 **/
        OutputStream os = response.getOutputStream();
        
        /**  파일 타입을 지정해줍니다. **/
        response.setContentType("ms-vnd/excel");

        /**  한글제목도 사용할 수 있게 해줍니다.  **/
        String fileName = new String(newfileName.getBytes("KSC5601"), "8859_1");

        /**  response에 파일이름을 지정해줍니다  **/
        response.setHeader("Content-Disposition", "attachment;filename="+fileName+".xlsx");

        /**  변환을 위해 jxls 라이브러리에서 요구하는 형식으로 보내줍니다  **/
        Context context = new Context();
        context.putVar("data", data);
        JxlsHelper.getInstance().processTemplate(is, os, context);
    }
}
