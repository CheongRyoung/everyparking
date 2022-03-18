package com.everyparking.user.api.mypage.service;

import java.util.HashMap;
import java.util.List;

public interface ReviewService {

    public List<HashMap<String, Object>> getReservationList(HashMap<String, Object> params);
    public HashMap<String, Object> getReservationInfo(HashMap<String, Object> params);
    public int insertReview(HashMap<String, Object> params);
    public int updateReview(HashMap<String, Object> params);
    public int deleteReview(HashMap<String, Object> params);
}
