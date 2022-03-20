package com.everyparking.admin.api.qnaManage.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface QnaDao {
	
	public List<HashMap<String, Object>> selectListQna(HashMap<String, Object> params) throws Exception;

	public int selectListCountQna(HashMap<String, Object> params) throws Exception;
	
	public HashMap<String,Object> getQna(int QNA_SEQ) throws Exception;
	
	public int qnaReadCount(int QNA_SEQ) throws Exception;
	
	public int insertComment(HashMap<String, Object> params) throws Exception;
}
