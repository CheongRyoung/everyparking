package com.everyparking.admin.framework.test.dao;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface TestSqlDao {
	public void DBTest();
	public int getDBTestCount(HashMap<String,Object> params);
	public HashMap<String,Object> getDBTestDetail(HashMap<String,Object> params);
	public int DBUploadTest(@Param("editorData") String editorData);
	public List<HashMap<String, Object>> getDBTest(HashMap<String,Object> params);
	public HashMap<String, Object> getUploadFile();
	public int insertTest();
}
