package com.everyparking.admin.api.qnaManage.service;

import java.util.HashMap;
import java.util.List;

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
	public int insertComment(HashMap<String, Object> params) throws Exception {
		return qnadao.insertComment(params);	
	}

}
