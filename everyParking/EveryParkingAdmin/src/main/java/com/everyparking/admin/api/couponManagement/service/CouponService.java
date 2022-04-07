package com.everyparking.admin.api.couponManagement.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface CouponService {
	
	public int insertCoupon(HttpServletRequest request, HashMap<String, Object> params) throws Exception;
	
	public List<HashMap<String, Object>> selectListCoupon(HashMap<String, Object> params) throws Exception;
	
	public int selectListCountCoupon(HashMap<String, Object> params) throws Exception;
	
	public int deleteCoupon(HashMap<String, Object> params)throws Exception;
}
