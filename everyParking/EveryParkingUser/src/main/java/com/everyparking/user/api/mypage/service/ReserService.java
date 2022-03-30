package com.everyparking.user.api.mypage.service;

import java.util.HashMap;
import java.util.List;

public interface ReserService {

	public List<HashMap<String,Object>> selectListReservation(HashMap<String,Object> params) throws Exception; 
	public int selectListCountReservation(HashMap<String,Object> params) throws Exception; 
	public HashMap<String,Object> selectOneReservation(HashMap<String,Object> params) throws Exception; 
	public int cancelReservation(HashMap<String,Object> params) throws Exception; 
}
