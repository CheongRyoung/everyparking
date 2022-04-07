package com.everyparking.user.api.main.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MainDao {

	// 3/16 장문 지도 작업 부분
	
	public List<HashMap<String, Object>> selectParkingInfoList(HashMap<String, Object> params) throws Exception;
	
	public int selectParkingInfoListCount(HashMap<String, Object> params) throws Exception;
	
	public HashMap<String, Object> selectOneParkingInfo(HashMap<String, Object> params) throws Exception;
	
	public List<HashMap<String, Object>> selectSectionList(HashMap<String, Object> params) throws Exception;	
	
	public List<HashMap<String, Object>> selectReviewList(HashMap<String, Object> params) throws Exception;

	public int selectReviewListCount(HashMap<String, Object> params) throws Exception;
	
	public List<HashMap<String, Object>> selectSectionInfoForRese(HashMap<String, Object> params) throws Exception;
	
	public int insertReservation(HashMap<String, Object> params) throws Exception;

	public int deleteReservation(HashMap<String, Object> params) throws Exception;
	
	public HashMap<String, Object> checkLogin(HashMap<String, Object> params) throws Exception;
	
	public List<HashMap<String, Object>> getUserInfo(HashMap<String, Object> params) throws Exception;
	
	public List<HashMap<String, Object>> getUserPublishCoupon(HashMap<String, Object> params) throws Exception;
	
	public void updateUserCoupon(HashMap<String, Object> params) throws Exception;

}
