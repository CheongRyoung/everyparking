package com.everyparking.user.api.kakaopay.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.everyparking.user.api.kakaopay.vo.ApproveResponse;
import com.everyparking.user.api.kakaopay.vo.ReadyResponse;

@Mapper
@Repository
public interface KakaoDao {

    public ReadyResponse payReady(HashMap<String, Object> params);
    public ApproveResponse payApprove(String tid, String pgToken);
	public int getOrderIdByReseSeq();
    public HashMap<String, Object> getTid(HashMap<String, Object> params);
}
