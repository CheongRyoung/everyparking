package com.everyparking.user.api.coupon.service;

import java.util.HashMap;
import java.util.List;

public interface CouponService {
	
	public List<HashMap<String, Object>> selectCouponList(int USER_SEQ) throws Exception;

	public void getCouponData(HashMap<String, Object> params) throws Exception;
	
	public List<HashMap<String, Object>> getCoupon(HashMap<String, Object> params) throws Exception;
	
	public List<HashMap<String, Object>> selectMyCouponList(HashMap<String, Object> params) throws Exception;
	
	public void updateCouponCount(HashMap<String, Object> params) throws Exception;
	
}
