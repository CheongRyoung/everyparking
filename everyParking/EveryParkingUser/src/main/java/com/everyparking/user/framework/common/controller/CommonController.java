package com.everyparking.user.framework.common.controller;

import com.everyparking.user.framework.common.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.everyparking.user.framework.common.service.CommonService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class CommonController {

    @Autowired
    CommonService commonService;

    @Autowired
    FileUtil fileUtil;

    @RequestMapping("/Home")
    public String adminHome(){
        /** 세션 검사 추가해야하는데 이작업은 나중에 하셔도 됩니다 **/
        return "/parkingManage/adminHome";
    }

    @ResponseBody
    @RequestMapping("/editor/uploadView")
    public Map<String, Object> imageUpload(@RequestParam("upload") MultipartFile image, HttpServletRequest request) throws IOException {
        Map<String, Object> data = new HashMap<String, Object>();
        if(image != null) {
            String originalName = image.getOriginalFilename();
            /**
             *   -------------------------------
             *   db에 이미지 기존 이름 저장
             *   -------------------------------
             * **/

            /**  new FileUtil(MultipartFile image, enum객체로 폴더 선택)     **/

            /**
             *   -------------------------------
             *   db에 이미지 url저장
             *   -------------------------------
             * **/
            data.put("uploaded", 1);
            data.put("fileName", originalName);
            data.put("url", fileUtil.editorImg(image, "noti"));
        }
        return data;
    }

    @RequestMapping("/error")
    public String error(Model model){
        model.addAttribute("code", "404");
        model.addAttribute("message", "올바르지 않는 경로입니다");
        return "/error/error";
    }
}
