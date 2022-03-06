package com.everyparking.admin.framework.test.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyparking.admin.framework.test.mapper.TestSqlDao;

@Service
public class TestService {
	
	@Autowired
	private TestSqlDao testSqlDao;
	
	public void DBTest() {
		testSqlDao.DBTest();
	}
	
	public void DBUploadTest(String editorData) {
		testSqlDao.DBUploadTest(editorData);
	}
	
	public Map<String, Object> getUploadFile() {
		return testSqlDao.getUploadFile();
	}
	
	public ArrayList<Map<String, Object>> getDBTest() {
		return testSqlDao.getDBTest();
	}
}
