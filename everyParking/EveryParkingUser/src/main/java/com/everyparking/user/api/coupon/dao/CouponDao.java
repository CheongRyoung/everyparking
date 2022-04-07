package com.everyparking.user.api.coupon.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CouponDao {

	public List<HashMap<String, Object>> selectCouponList(int USER_SEQ) throws Exception;
	
	public void insertPublish(HashMap<String, Object> params) throws Exception;
	
	public List<HashMap<String, Object>> getCoupon(HashMap<String, Object> params) throws Exception;
	
	public List<HashMap<String, Object>> selectMyCouponList(HashMap<String, Object> params) throws Exception;
	
	public void updateCouponCount(HashMap<String, Object> params) throws Exception;
}	
