package com.everyparking.user.api.mypage.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ReserDao {
	
	public List<HashMap<String,Object>> selectListReservation(HashMap<String,Object> params) throws Exception; 
	public int selectListCountReservation(HashMap<String,Object> params) throws Exception; 
	public HashMap<String,Object> selectOneReservation(HashMap<String,Object> params) throws Exception; 
	public int cancelReservation(HashMap<String,Object> params) throws Exception; 
	
}
