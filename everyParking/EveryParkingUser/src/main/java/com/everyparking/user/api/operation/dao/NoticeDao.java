package com.everyparking.user.api.operation.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface NoticeDao {
	
	public List<HashMap<String,Object>> selectListNoti(HashMap<String,Object> params) throws Exception;
	
	public int selectListCountNoti(HashMap<String,Object> params) throws Exception;

	public HashMap<String,Object> getNotice(int NOTI_SEQ) throws Exception;
	
	public HashMap<String,Object> getNextPrev (int NOTI_SEQ) throws Exception;
	
	public int notiReadCount(int NOTI_SEQ) throws Exception;
}
