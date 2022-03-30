package com.everyparking.user.api.mypage.service;

import java.util.HashMap;
import java.util.List;

import com.everyparking.user.framework.common.vo.MemberVo;

public interface MyInfoService {

	public int checkPw(HashMap<String,Object> params) throws Exception;

	public HashMap<String, Object> selectOneInfo(HashMap<String, Object> params) throws Exception;
	public String selectUserRoyal(HashMap<String, Object> params) throws Exception;
    
    public int updateInfo(HashMap<String, Object> params) throws Exception;
    public int deleteInfo(HashMap<String, Object> params) throws Exception;
	
	
	
}
