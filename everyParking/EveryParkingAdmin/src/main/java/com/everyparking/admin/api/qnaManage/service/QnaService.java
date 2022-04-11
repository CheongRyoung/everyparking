package com.everyparking.admin.api.qnaManage.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface QnaService {
	
	public List<HashMap<String,Object>> selectListQna (HashMap<String,Object> params) throws Exception;
	
	public int selectListCountQna(HashMap<String,Object> params) throws Exception;
	
	public HashMap<String, Object> getQna(int QNA_SEQ) throws Exception;
	
	public int qnaReadCount(int QNA_SEQ) throws Exception;
	
	public int answerQna(int QNA_SEQ) throws Exception;
	
	public int insertComment(HttpServletRequest request, HashMap<String, Object> params) throws Exception;

	public int insertReply(HttpServletRequest request, HashMap<String, Object> params) throws Exception;

	public List<HashMap<String, Object>> getCommentList(int QNA_SEQ) throws Exception;
	
	public int deleteQna(int QNA_SEQ) throws Exception;	
	
	public int deleteComment(int QNAC_SEQ) throws Exception;
	
	public int deleteReply(int QNAC_SEQ) throws Exception;	
		
	public int updateComment(HashMap<String, Object> params) throws Exception;

	public HashMap<String,Object> getNextPrev(int QNA_SEQ) throws Exception;
}
