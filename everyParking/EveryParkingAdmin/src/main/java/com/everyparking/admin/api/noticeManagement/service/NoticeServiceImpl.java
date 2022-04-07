package com.everyparking.admin.api.noticeManagement.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.everyparking.admin.api.noticeManagement.dao.NoticeDao;
import com.everyparking.admin.framework.file.service.FileService;

@Service
@Transactional(rollbackFor = Exception.class)
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticedao;	
	
    @Autowired
    FileService fileService;
    
    @Value("#{file['file.notice']}")
    String filePath;

	@Override
	public int insertNoti(HttpServletRequest request,  HashMap<String, Object> params) throws Exception {
		
		    List<Integer> file_seq = fileService.uploadFile(request, filePath);

		    if(file_seq != null){
		        params.put("FILE_SEQ", file_seq.get(0));
		    }		   
		    noticedao.insertNoti(params);
		    
		return 1;
	}
	
	@Override
	public List<HashMap<String, Object>> selectListNoti(HashMap<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		return noticedao.selectListNoti(params);
	}

	@Override
	public int selectListCountNoti(HashMap<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		return noticedao.selectListCountNoti(params);
	}

	@Override
	public int updateNoti(HashMap<String, Object> params) throws Exception  {
		return noticedao.updateNoti(params);
	}

	@Override
	public int deleteNoti(HashMap<String, Object> params) throws Exception {
		return noticedao.deleteNoti(params);
	}

	@Override
	public HashMap<String, Object> getNotice(int NOTI_SEQ) throws Exception {
		HashMap<String, Object> result = noticedao.getNotice(NOTI_SEQ);
		return result;
	}

	@Override
	public int notiReadCount(int NOTI_SEQ) throws Exception {
		return noticedao.notiReadCount(NOTI_SEQ);
	}

	@Override
	public HashMap<String, Object> getNextPrev(int NOTI_SEQ) throws Exception {
		HashMap<String, Object> nextPrev = noticedao.getNextPrev(NOTI_SEQ);
		return nextPrev;
	}	

}