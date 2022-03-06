package com.everyparking.admin.test.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface TestSQLMapper {
	
	public void DBTest();
	public void DBUploadTest(@Param("editorData") String editorData);
	public ArrayList<Map<String, Object>> getDBTest();
	public Map<String, Object> getUploadFile();
}
