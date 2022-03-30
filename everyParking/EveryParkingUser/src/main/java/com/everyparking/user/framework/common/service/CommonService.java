package com.everyparking.user.framework.common.service;

import java.util.HashMap;
import java.util.List;

import com.everyparking.user.framework.common.vo.MemberVo;

public interface CommonService {
	
	 public void registerMember(MemberVo vo, String [] SUB_CODE) throws Exception;
	 
	 public int insertRoyalUser(HashMap<String, Object> params) throws Exception;
	 
	 public MemberVo login(MemberVo vo);
	 
	 public List<HashMap<String, Object>> getSubCodeRoyalUser() throws Exception;
	 
	 public MemberVo findEmail(MemberVo vo);
	 
	 public boolean isExistEmail(String USER_MAIL);

	 public boolean isExistCarNo(String USER_CAR_NO);
	 
	 
}
