package com.everyparking.admin.api.qnaManage.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everyparking.admin.api.qnaManage.dao.QnaDao;

@Service
@Transactional(rollbackFor = Exception.class)
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaDao qnadao;
	
	@Override
	public List<HashMap<String, Object>> selectListQna(HashMap<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		return qnadao.selectListQna(params);
	}

	@Override
	public int selectListCountQna(HashMap<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		return qnadao.selectListCountQna(params);
	}

	@Override
	public HashMap<String, Object> getQna(int QNA_SEQ) throws Exception {
		HashMap<String, Object> result = qnadao.getQna(QNA_SEQ);
		return result;
	}

	@Override
	public int qnaReadCount(int QNA_SEQ) throws Exception {
		return qnadao.qnaReadCount(QNA_SEQ);
	}

	@Override
	public int insertComment(HttpServletRequest request, HashMap<String, Object> params) throws Exception {
		return qnadao.insertComment(params);
	}

	@Override
	public int insertReply(HttpServletRequest request, HashMap<String, Object> params) throws Exception {
		return qnadao.insertReply(params);
	}

	@Override
	public List<HashMap<String, Object>> getCommentList(int QNA_SEQ) throws Exception {
		return qnadao.getCommentList(QNA_SEQ);
	}

	@Override
	public int deleteComment(int QNAC_SEQ) throws Exception {
		return qnadao.deleteComment(QNAC_SEQ);
	}

	@Override
	public int deleteReply(int QNAC_SEQ) throws Exception {
		return qnadao.deleteReply(QNAC_SEQ);
	}
	
	
	@Override
	public int updateComment(HashMap<String, Object> params) throws Exception {
		return qnadao.updateComment(params);
	}

	@Override
	public int answerQna(int QNA_SEQ) throws Exception {
		return qnadao.answerQna(QNA_SEQ);
	}
	
	@Override
	public HashMap<String, Object> getNextPrev(int QNA_SEQ) throws Exception {
		HashMap<String, Object> nextPrev = qnadao.getNextPrev(QNA_SEQ);
		return nextPrev;
	}
	
	@Override
	public int deleteQna(int QNA_SEQ) throws Exception {
		return qnadao.deleteQna(QNA_SEQ);
	}


}
