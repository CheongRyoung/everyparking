package com.everyparking.admin.framework.common.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import com.everyparking.admin.framework.common.vo.ImageFolerName;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {

	private MultipartFile mf;
	private String folder;
	private String folderPath;
	private ImageFolerName imageFolerName;

	@Value("#{file['file.root']}")
	private String root;


	public FileUtil(MultipartFile mf, ImageFolerName imageFolerName) {
		this.mf = mf;
		this.imageFolerName = imageFolerName;
	}
	
	public void folderPath() {
		
		// 앞단은 자신의 경로로 수정해주세요(맥북은 모르겠는데 아마 하실줄 믿고 있겠습니다)
		String folder = root;
		String folderPath = "";
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/");
		folderPath = sdf.format(date);
		
		this.folderPath = folderPath;
		this.folder = folder;
		File todayFolder = new File(folder+ imageFolerName +folderPath);
		
		if(!todayFolder.exists()) {
			todayFolder.mkdirs();
		}
	}
	
	public String imgSave() {
		folderPath();
		UUID uuid = UUID.randomUUID();
		String randomName = uuid.toString();
		String ext = "." + FilenameUtils.getExtension(mf.getOriginalFilename());
		String newfileName = randomName + System.currentTimeMillis() + ext;
		
		try {
			mf.transferTo(new File(folder + folderPath + newfileName));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return imageFolerName + folderPath + newfileName;
		
	}
}
