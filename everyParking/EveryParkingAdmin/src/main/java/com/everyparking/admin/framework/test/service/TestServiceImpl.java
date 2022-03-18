package com.everyparking.admin.framework.test.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everyparking.admin.framework.common.exceptions.CustomException;
import com.everyparking.admin.framework.test.dao.TestSqlDao;

@Service
@Transactional(rollbackFor = {Exception.class})
public class TestServiceImpl implements TestService{
	
	@Autowired
	private TestSqlDao testSqlDao;
	
	@Override
	public void DBTest() {
		testSqlDao.DBTest();
	}
	@Override
	public int DBUploadTest(String editorData) {
		return testSqlDao.DBUploadTest(editorData);
	}
	@Override
	public Map<String, Object> getUploadFile() {
		return testSqlDao.getUploadFile();
	}
	@Override
	public List<HashMap<String, Object>> getDBTest(HashMap<String,Object> params) {
		return testSqlDao.getDBTest(params);
	}
	@Override
	public int getDBTestCount(HashMap<String,Object> params) {
		return testSqlDao.getDBTestCount(params);
	}
	@Override
	public HashMap<String,Object> getDBTestDetail(HashMap<String,Object> params) {
		return testSqlDao.getDBTestDetail(params);
	}
	@Override
	public int insertTest() throws Exception{
		testSqlDao.insertTest();
		throw new CustomException("오류얌");
	}

}
