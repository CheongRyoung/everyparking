package com.everyparking.admin.framework.file.controller;

import com.everyparking.admin.framework.common.view.DownloadView;
import com.everyparking.admin.framework.file.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@Controller
public class FileConroller {

    @Autowired
    DownloadView downloadView;

    @Autowired
    FileService fileService;

    @RequestMapping("/downloadFile/{image_no}")
    public ModelAndView downloadFile(@PathVariable(value="image_no") String image_no) throws Exception {
        HashMap params = new HashMap();
        params.put("image_no" ,image_no);
        return new ModelAndView( downloadView, fileService.getFile(params));
    }
}
