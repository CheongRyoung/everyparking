package com.everyparking.user.api.mypage.service;

import java.util.HashMap;
import java.util.Iterator;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everyparking.user.api.mypage.dao.MyInfoDao;
import com.everyparking.user.framework.common.util.MessageDigestUtil;
import com.everyparking.user.framework.common.vo.MemberVo;

@Service
@Transactional(rollbackFor = Exception.class)
public class MyInfoServiceImpl implements MyInfoService {

	@Inject
	MyInfoDao myInfoDao;

	@Override
	public HashMap<String, Object> selectOneInfo(HashMap<String, Object> params) throws Exception {
		HashMap<String, Object> result = myInfoDao.selectOneInfo(params);
		return result;
	}

	@Override
	public String selectUserRoyal(HashMap<String, Object> params) throws Exception {
		return myInfoDao.selectUserRoyal(params);
	}

	@Override
	public int updateInfo(HashMap<String, Object> params) throws Exception {
    	//회원가입쪽 비밀번호 해싱
    	String password = (String) params.get("USER_PW");
    	password = MessageDigestUtil.getPasswordHashCode(password);
    	params.put("USER_PW", password);
		
		myInfoDao.updateInfo(params);
		
		myInfoDao.deleteUserRoyal(params);
		
		String[] royals = (String[]) params.get("royal");
		for(String royal : royals) {
			params.put("RU_TYPE", royal);
			myInfoDao.insertUserRoyal(params);
		}
		return 1;
	}

	@Override
	public int deleteInfo(HashMap<String, Object> params) throws Exception {

		Iterator<String> key = params.keySet().iterator();

		String info = "USER_SEQ";

		if (key.next().equals(info)) {
			return myInfoDao.deleteInfo(params);
		} else {
			return myInfoDao.deleteInfo(params);
		}

	}

	@Override
	public int checkPw(HashMap<String, Object> params) throws Exception {
		params.put("USER_PW", MessageDigestUtil.getPasswordHashCode((String) params.get("USER_PW")));
		return myInfoDao.checkPw(params);
	}

}
