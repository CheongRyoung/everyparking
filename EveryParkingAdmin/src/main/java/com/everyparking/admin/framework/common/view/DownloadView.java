package com.everyparking.admin.framework.common.view;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.net.URLEncoder;
import java.util.Map;

@Component
public class DownloadView extends AbstractView{

    @Value("#{file['file.rootPath']}")
    private String rootPath;

    @Override
    protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String image_originalName = (String) map.get("image_originalName");
        String convert_name = (String) map.get("convert_name");
        String image_url = (String) map.get("image_url");

        String fileName = URLEncoder.encode(image_originalName,"UTF-8");
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition","attchment; filename="+ fileName);

        FileUtils.copyFile(new File(rootPath + image_url+ "/"+ convert_name ), response.getOutputStream());
    }
}
