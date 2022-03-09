package com.everyparking.admin.framework.test.dao;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

public interface TestSqlDao {
	public void DBTest();
	public int DBUploadTest(@Param("editorData") String editorData);
	public ArrayList<LinkedHashMap<String, Object>> getDBTest();
	public Map<String, Object> getUploadFile();
}
