package com.everyparking.user.api.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
		
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		for(HashMap<String, Object> data : mainDao.selectParkingInfoList(params)) {
			data.put("sectionList", mainDao.selectSectionList(data));
			list.add(data);
		}
		return list;
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
	

	@Override
	public List<HashMap<String, Object>> selectSectionInfoForRese(HashMap<String, Object> params) throws Exception {
		
		List<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();		
		 
		for(HashMap<String, Object> reseList : mainDao.selectSectionInfoForRese(params)) {
			for(HashMap<String, Object> userList : mainDao.getUserInfo(params)) {
				if(reseList.get("SEC_TYPE").toString().equals(userList.get("RU_TYPE").toString()) ) {
					dataList.add(reseList);
				}
			}
		}
		return dataList;
	}


	@Override
	public int insertReservation(HashMap<String, Object> params) throws Exception {
		return mainDao.insertReservation(params);
	}

	@Override
	public int deleteReservation(HashMap<String, Object> params) throws Exception {
		return mainDao.deleteReservation(params);
	}


	@Override
	public HashMap<String, Object> checkLogin(HashMap<String, Object> params) throws Exception {
		return null;
	}


	@Override
	public List<HashMap<String, Object>> getUserPublishCoupon(HashMap<String, Object> params) throws Exception {
		return mainDao.getUserPublishCoupon(params);
	}


	@Override
	public void updateUserCoupon(HashMap<String, Object> params) throws Exception {
		mainDao.updateUserCoupon(params);
		
	}

}
