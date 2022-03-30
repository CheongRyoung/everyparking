package com.everyparking.user.api.kakaopay.service;

import com.everyparking.user.api.kakaopay.vo.ApproveResponse;
import com.everyparking.user.api.kakaopay.vo.ReadyResponse;
import com.everyparking.user.api.kakaopay.vo.RefundResponse;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface KakaoService {

    public ReadyResponse payReady(HttpSession session, HttpServletRequest request, HashMap<String, Object> params) throws Exception;
    public ApproveResponse payApprove(HttpSession session, String tid, String pgToken);
    public RefundResponse payRefund(HashMap<String, Object> params);
    public HashMap<String, Object> getTid(HashMap<String, Object> params);
}
