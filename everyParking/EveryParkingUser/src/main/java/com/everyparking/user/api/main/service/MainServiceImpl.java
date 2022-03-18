package com.everyparking.user.api.main.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everyparking.user.api.main.dao.MainDao;

@Service
@Transactional(rollbackFor = Exception.class)
public class MainServiceImpl implements MainService {

	
	// 3/16 장문 지도 작업 부분
	
	@Autowired
	MainDao mainDao;
	
	
	@Override
	public List<HashMap<String, Object>> selectParkingInfoList(HashMap<String, Object> params) throws Exception {
		return mainDao.selectParkingInfoList(params);
	}
	
	
	@Override
    public int selectParkingInfoListCount(HashMap<String, Object> params) throws Exception {
        return mainDao.selectParkingInfoListCount(params);
    }
	
	
	@Override
	public HashMap<String, Object> selectOneParkingInfo(HashMap<String, Object> params) throws Exception {
		return mainDao.selectOneParkingInfo(params);
	}
	
	
	@Override
	public List<HashMap<String, Object>> selectSectionList(HashMap<String, Object> params) throws Exception {
		return mainDao.selectSectionList(params);
	}
	
	
	@Override
	public List<HashMap<String, Object>> selectReviewList(HashMap<String, Object> params) throws Exception {
		return mainDao.selectReviewList(params);
	}
	
	
	@Override
	 public int selectReviewListCount(HashMap<String, Object> params) throws Exception {
        return mainDao.selectReviewListCount(params);
    }
	
}
