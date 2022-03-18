package com.everyparking.admin.api.noticeManagement.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface NoticeService {
	
	public int insertNotiTest(String editorData
								, String notiTitle
								, HttpServletRequest request
								, HashMap<String, Object> params
								) throws Exception;
	
	public List<HashMap<String,Object>> selectListNoti(HashMap<String,Object> params) throws Exception;
	
	public int selectListCountNoti(HashMap<String,Object> params) throws Exception;
	
	public int updateNoti(HashMap<String, Object> params) throws Exception;
	
	public int deleteNoti(HashMap<String,Object> params) throws Exception;
	
	public HashMap<String,Object> getNotice(int NOTI_SEQ) throws Exception;
}
