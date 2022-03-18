package com.everyparking.admin.framework.test.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everyparking.admin.framework.common.exceptions.CustomException;
import com.everyparking.admin.framework.test.dao.TestSqlDao;

public interface TestService {
	public void DBTest();
	public int DBUploadTest(String editorData);
	public Map<String, Object> getUploadFile();
	public List<HashMap<String, Object>> getDBTest(HashMap<String,Object> params);
	public int getDBTestCount(HashMap<String,Object> params);
	public HashMap<String,Object> getDBTestDetail(HashMap<String,Object> params);
	public int insertTest() throws Exception;

}
