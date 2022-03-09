package com.everyparking.admin.framework.common.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import com.everyparking.admin.framework.common.vo.ImageFolerName;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUtil {

	private MultipartFile mf;
	private String folder;
	private String folderPath;
	private ImageFolerName imageFolerName;
	private String root;

	public FileUtil() {
		
	}
	
	@Value("#{file['file.root']}")
	public void setRoot(String file) {
		this.root = file; 
	}
	
	public String folderPath(MultipartFile mf, ImageFolerName imageFolerName) {
		// C:/everyparking/EveryParkingAdmin/src/main/webapp/static/uploadimage/	
		// 앞단은 자신의 경로로 수정해주세요(맥북은 모르겠는데 아마 하실줄 믿고 있겠습니다)
		this.mf = mf;
		this.imageFolerName = imageFolerName;
		
		// static 경로
		String folder = root;
		
		// 오늘 날짜 폴더 생성
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
		
		// 랜덤 이름 생성
		UUID uuid = UUID.randomUUID();
		String randomName = uuid.toString();
		String ext = "." + FilenameUtils.getExtension(mf.getOriginalFilename());
		String newfileName = randomName + System.currentTimeMillis() + ext;
		
		// 파일 전송
		try {
			mf.transferTo(new File(folder + imageFolerName + folderPath + newfileName));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 파일 url 리턴
		return imageFolerName + folderPath + newfileName;

	}
	
}
