package com.everyparking.user.api.mypage.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface ReviewDao {

	public List<HashMap<String, Object>> selectMyReviewList(HashMap<String, Object> params) throws Exception;
	public HashMap<String, Object> selectOneMyReservationInfo(HashMap<String, Object> params) throws Exception;
	public HashMap<String, Object> selectOneReviewInfo(HashMap<String, Object> params) throws Exception;
	public int insertReview(HashMap<String, Object> params) throws Exception;
	public int updateReview(HashMap<String, Object> params) throws Exception;
	public int deleteReview(HashMap<String, Object> params) throws Exception;
}
