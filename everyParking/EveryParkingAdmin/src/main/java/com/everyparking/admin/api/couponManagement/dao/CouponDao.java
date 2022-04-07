package com.everyparking.admin.api.couponManagement.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CouponDao {
	
	public int insertCoupon(HashMap<String, Object> params) throws Exception;
	
	public List<HashMap<String, Object>> selectListCoupon(HashMap<String, Object> params) throws Exception;
	
	public int selectListCountCoupon(HashMap<String, Object> params) throws Exception;
	
	public int deleteCoupon(HashMap<String, Object> params)throws Exception;
}
