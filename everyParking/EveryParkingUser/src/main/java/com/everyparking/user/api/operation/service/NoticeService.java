package com.everyparking.user.api.operation.service;

import java.util.HashMap;
import java.util.List;

public interface NoticeService {
	
	public List<HashMap<String,Object>> selectListNoti(HashMap<String,Object> params) throws Exception;
	
	public int selectListCountNoti(HashMap<String,Object> params) throws Exception;
	
	public HashMap<String,Object> getNotice(int NOTI_SEQ) throws Exception;
	
	public HashMap<String,Object> getNextPrev(int NOTI_SEQ) throws Exception;
	
	public int notiReadCount(int NOTI_SEQ) throws Exception;

}
