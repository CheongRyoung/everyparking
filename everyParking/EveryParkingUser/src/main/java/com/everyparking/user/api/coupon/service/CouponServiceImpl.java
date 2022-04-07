package com.everyparking.user.api.coupon.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyparking.user.api.coupon.dao.CouponDao;

@Service
public class CouponServiceImpl implements CouponService {
	
	@Autowired
	CouponDao couponDao;

	@Override
	public List<HashMap<String, Object>> selectCouponList(int USER_SEQ) throws Exception {
		List<HashMap<String, Object>> couponList = couponDao.selectCouponList(USER_SEQ);
		
		return couponList;
	}

	@Override
	public void getCouponData(HashMap<String, Object> params) throws Exception {
			
		couponDao.insertPublish(params);
	}

	@Override
	public List<HashMap<String, Object>> getCoupon(HashMap<String, Object> params) throws Exception {
		return couponDao.getCoupon(params);
	}

	@Override
	public List<HashMap<String, Object>> selectMyCouponList(HashMap<String, Object> params) throws Exception {
		return couponDao.selectMyCouponList(params);
	}

	@Override
	public void updateCouponCount(HashMap<String, Object> params) throws Exception {
		couponDao.updateCouponCount(params);
	}

	

	
	
}
