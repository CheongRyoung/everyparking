package com.everyparking.admin.api.noticeManagement.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface NoticeDao {
	
	/* 03/12 종화 작성*/
	public int insertNotiTest(@Param("editorData") String editorData
								, @Param("notiTitle") String notiTitle
								, HashMap<String,Object> params) throws Exception;
						
	public List<HashMap<String,Object>> selectListNoti(HashMap<String,Object> params) throws Exception;
	
	public int selectListCountNoti(HashMap<String,Object> params) throws Exception;
	
	public int updateNoti(@Param("editorData") String editorData
							, @Param("notiTitle") String notiTitle
							, HashMap<String,Object> params) throws Exception;
	
	public int deleteNoti(HashMap<String,Object> params) throws Exception;
	
	public HashMap<String,Object> getNotice(int NOTI_SEQ) throws Exception;
	
}
