package com.everyparking.user.api.mypage.service;

import com.everyparking.user.api.mypage.dao.ReviewDao;
import com.everyparking.user.framework.common.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class ReviewServiceImpl implements ReviewService{

    @Autowired
    ReviewDao reviewDao;

    @Override
    public List<HashMap<String, Object>> getReservationList(HashMap<String, Object> params) {
        return reviewDao.getReservationList(params);
    }

    @Override
    public HashMap<String, Object> getReservationInfo(HashMap<String, Object> params) {
        return reviewDao.getReservationInfo(params);
    }

    @Override
    public int insertReview(HashMap<String, Object> params) {
        return insertReview(params);
    }

    @Override
    public int updateReview(HashMap<String, Object> params) {
        return updateReview(params);
    }

    @Override
    public int deleteReview(HashMap<String, Object> params) {
        return deleteReview(params);
    }
}
