package com.everyparking.admin.framework.test.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyparking.admin.framework.test.dao.TestSqlDao;

@Service
public class TestService {
	
	@Autowired
	private TestSqlDao testSqlDao;
	
	public void DBTest() {
		testSqlDao.DBTest();
	}
	
	public int DBUploadTest(String editorData) {
		return testSqlDao.DBUploadTest(editorData);
	}
	
	public Map<String, Object> getUploadFile() {
		return testSqlDao.getUploadFile();
	}
	
	public List<HashMap<String, Object>> getDBTest(HashMap<String,Object> params) {
		return testSqlDao.getDBTest(params);
	}

	public int getDBTestCount(HashMap<String,Object> params) {
		return testSqlDao.getDBTestCount(params);
	}

	public HashMap<String,Object> getDBTestDetail(HashMap<String,Object> params) {
		return testSqlDao.getDBTestDetail(params);
	}

}
