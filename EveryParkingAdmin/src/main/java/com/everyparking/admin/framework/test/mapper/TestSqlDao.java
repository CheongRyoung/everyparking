package com.everyparking.admin.framework.test.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface TestSqlDao {
	public void DBTest();
	public void DBUploadTest(@Param("editorData") String editorData);
	public ArrayList<Map<String, Object>> getDBTest();
	public Map<String, Object> getUploadFile();
}
