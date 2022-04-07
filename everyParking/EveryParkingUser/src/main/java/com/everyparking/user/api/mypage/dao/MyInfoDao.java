package com.everyparking.user.api.mypage.dao;

import java.util.HashMap;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


import com.everyparking.user.framework.common.vo.MemberVo;

@Mapper
@Repository
public interface MyInfoDao {

	public int checkPw(HashMap<String,Object> params) throws Exception;
	public HashMap<String, Object> selectOneInfo(HashMap<String, Object> params) throws Exception;
	public String selectUserRoyal(HashMap<String, Object> params) throws Exception;
    public int updateInfo(HashMap<String,Object> params) throws Exception;
    public int deleteInfo(HashMap<String,Object> params) throws Exception;
    public int deleteUserRoyal(HashMap<String,Object> params) throws Exception;
    public int insertUserRoyal(HashMap<String,Object> params) throws Exception;

}


