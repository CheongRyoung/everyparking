package com.everyparking.admin.framework.test.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

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
	
	public ArrayList<LinkedHashMap<String, Object>> getDBTest() {
		return testSqlDao.getDBTest();
	}
}
