package com.everyparking.user.framework.file.controller;

import com.everyparking.user.framework.common.view.DownloadView;
import com.everyparking.user.framework.file.service.FileService;
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

    @RequestMapping("/downloadFile/{FILE_SEQ}")
    public ModelAndView downloadFile(@PathVariable(value="FILE_SEQ") String FILE_SEQ) throws Exception {
        HashMap params = new HashMap();
        params.put("FILE_SEQ" , FILE_SEQ);
        return new ModelAndView( downloadView, fileService.getFile(params));
    }
}
