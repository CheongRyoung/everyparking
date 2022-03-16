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
	public int getCountById(String USER_MAIL);
	
	public List<HashMap<String, Object>> getSubCodeRoyalUser();
	


}
