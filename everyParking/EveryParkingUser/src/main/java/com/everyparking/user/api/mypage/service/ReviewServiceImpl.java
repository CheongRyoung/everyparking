package com.everyparking.user.api.mypage.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everyparking.user.api.mypage.dao.ReviewDao;

@Service
@Transactional(rollbackFor = Exception.class)
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDao reviewDao;
	
	public List<HashMap<String, Object>> selectMyReviewList(HashMap<String, Object> params) throws Exception{
		return reviewDao.selectMyReviewList(params);
	}
	
	public HashMap<String, Object> selectOneMyReservationInfo(HashMap<String, Object> params) throws Exception{
		return reviewDao.selectOneMyReservationInfo(params);
	}
	
	public HashMap<String, Object> selectOneReviewInfo(HashMap<String, Object> params) throws Exception{
		return reviewDao.selectOneReviewInfo(params);
	}
	public int insertReview(HashMap<String, Object> params) throws Exception{
		return reviewDao.insertReview(params);
	}
	
	public int updateReview(HashMap<String, Object> params) throws Exception{
		return reviewDao.updateReview(params);
	}

	public int deleteReview(HashMap<String, Object> params) throws Exception{
		return reviewDao.deleteReview(params);
	}
	
	
}
