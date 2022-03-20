package com.everyparking.admin.api.userhistory.dao;

import java.util.HashMap;
import java.util.List;

public interface UserHistoryDao {

	public List<HashMap<String, Object>> selectListHistory(HashMap<String, Object> params) throws Exception;
	public int selectListCountHistory(HashMap<String, Object> params) throws Exception;
	public HashMap<String, Object> selectOneHistory(HashMap<String, Object> params) throws Exception;
   
}
