package com.everyparking.user.api.operation.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface QnaDao {

	public List<HashMap<String, Object>> selectListQna(HashMap<String, Object> params) throws Exception;

	public int selectListCountQna(HashMap<String, Object> params) throws Exception;
	
	public HashMap<String,Object> getQna(int QNA_SEQ) throws Exception;
	
	public int qnaReadCount(int QNA_SEQ) throws Exception;
	
	public int insertComment(HashMap<String, Object> params) throws Exception;
	
	public int insertReply(HashMap<String, Object> params) throws Exception;
	
	public int deleteReply(int QNAC_SEQ) throws Exception;	
	
	public int insertQna(HashMap<String, Object> params) throws Exception;
	
	public int updateQna(HashMap<String, Object> params) throws Exception;

	public int deleteQna(int QNA_SEQ) throws Exception;
	
	public int deleteComment(int QNAC_SEQ) throws Exception;
		
	public int updateComment(HashMap<String, Object> params ) throws Exception;
	
	public List<HashMap<String, Object>> getCommentList(int QNA_SEQ) throws Exception;
	
	public HashMap<String,Object> getNextPrev (int QNA_SEQ) throws Exception;

}
