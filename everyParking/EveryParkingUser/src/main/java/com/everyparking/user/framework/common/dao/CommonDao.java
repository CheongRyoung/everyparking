package com.everyparking.user.framework.common.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.everyparking.user.framework.common.vo.MemberVo;

@Mapper
@Repository
public interface CommonDao {
	
	public void registerMember(MemberVo vo);
	
	public MemberVo getMemberByIdAndPw(MemberVo vo);
	
	public MemberVo getMemberByNo(int SEQ);
	
	public int getCountByEmail(String USER_MAIL);
	
	public MemberVo findEmail(MemberVo vo);
	
	public int getCountByCarNo(String USER_CAR_NO);
	
	public List<HashMap<String, Object>> getSubCodeRoyalUser() throws Exception;
	
	public int insertRoyalUser(HashMap<String, Object> params) throws Exception;
	

}
