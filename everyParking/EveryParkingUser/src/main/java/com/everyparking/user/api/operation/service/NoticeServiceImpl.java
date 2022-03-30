package com.everyparking.user.api.operation.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyparking.user.api.operation.dao.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticedao;	

	@Override
	public List<HashMap<String, Object>> selectListNoti(HashMap<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		return noticedao.selectListNoti(params);
	}

	@Override
	public int selectListCountNoti(HashMap<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		return noticedao.selectListCountNoti(params);
	}

	@Override
	public HashMap<String, Object> getNotice(int NOTI_SEQ) throws Exception {
		HashMap<String, Object> result = noticedao.getNotice(NOTI_SEQ);
		return result;
	}

	@Override
	public int notiReadCount(int NOTI_SEQ) throws Exception {
		return noticedao.notiReadCount(NOTI_SEQ);
	}

	@Override
	public HashMap<String, Object> getNextPrev(int NOTI_SEQ) throws Exception {
		HashMap<String, Object> nextPrev = noticedao.getNextPrev(NOTI_SEQ);
		return nextPrev;
	}
	
}
