package com.everyparking.admin.api.qnaManage.service;

import java.util.HashMap;
import java.util.List;

public interface QnaService {
	
	public List<HashMap<String,Object>> selectListQna (HashMap<String,Object> params) throws Exception;
	
	public int selectListCountQna(HashMap<String,Object> params) throws Exception;
	
}
