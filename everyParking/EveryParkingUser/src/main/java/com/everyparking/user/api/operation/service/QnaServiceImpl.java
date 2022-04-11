package com.everyparking.user.api.operation.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everyparking.user.api.operation.dao.QnaDao;
import com.everyparking.user.framework.file.service.FileService;


@Service
@Transactional(rollbackFor = Exception.class)
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	private QnaDao qnadao;
	
    @Autowired
    FileService fileService;
	
    @Value("#{file['file.qna']}")
    String filePath;
	
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
	public int updateQna(HashMap<String, Object> params) throws Exception {
		return qnadao.updateQna(params);
	}

	@Override
	public int deleteQna(int QNA_SEQ) throws Exception {
		return qnadao.deleteQna(QNA_SEQ);
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
	public HashMap<String, Object> getNextPrev(int QNA_SEQ) throws Exception {
		HashMap<String, Object> nextPrev = qnadao.getNextPrev(QNA_SEQ);
		return nextPrev;
	}

	@Override
	public int insertQna(HttpServletRequest request, HashMap<String, Object> params) throws Exception {
		
	    List<Integer> file_seq = fileService.uploadFile(request, filePath);

	    if(file_seq != null){
	        params.put("FILE_SEQ", file_seq.get(0));
	    }		   
	    qnadao.insertQna(params);
	    
	return 1;
	}

}
