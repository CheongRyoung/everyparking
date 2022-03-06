package com.everyparking.admin.test.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyparking.admin.test.mapper.TestSQLMapper;

@Service
public class TestService {
	
	@Autowired
	private TestSQLMapper test;
	
	public void DBTest() {
		test.DBTest();
	}
	
	public void DBUploadTest(String editorData) {
		test.DBUploadTest(editorData);
	}
	
	public Map<String, Object> getUploadFile() {
		return test.getUploadFile();
	}
	
	public ArrayList<Map<String, Object>> getDBTest() {
		return test.getDBTest();
	}
}
