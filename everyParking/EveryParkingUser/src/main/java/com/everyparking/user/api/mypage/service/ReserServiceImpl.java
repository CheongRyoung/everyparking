package com.everyparking.user.api.mypage.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyparking.user.api.mypage.dao.ReserDao;

@Service
public class ReserServiceImpl implements ReserService{
	
	@Autowired
	ReserDao reserDao;
	
	@Override
	public List<HashMap<String,Object>> selectListReservation(HashMap<String,Object> params) throws Exception{
		return reserDao.selectListReservation(params);
	}
	
	@Override
	public int selectListCountReservation(HashMap<String,Object> params) throws Exception{
		return reserDao.selectListCountReservation(params);
	}
	
	@Override
	public HashMap<String,Object> selectOneReservation(HashMap<String,Object> params) throws Exception{
		return reserDao.selectOneReservation(params);
	}
	
	@Override
	public int cancelReservation(HashMap<String,Object> params) throws Exception{
		return reserDao.cancelReservation(params);
	}
}
