package com.everyparking.user.api.mypage.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Mapper
@Repository
public interface ReviewDao {

    public List<HashMap<String, Object>> getReservationList(HashMap<String, Object> params);
    public HashMap<String, Object> getReservationInfo(HashMap<String, Object> params);
    public int insertReview(HashMap<String, Object> params);
    public int updateReview(HashMap<String, Object> params);
    public int deleteReview(HashMap<String, Object> params);
}
