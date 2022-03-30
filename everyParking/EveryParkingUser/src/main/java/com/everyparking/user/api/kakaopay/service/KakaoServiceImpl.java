package com.everyparking.user.api.kakaopay.service;

import com.everyparking.user.api.kakaopay.dao.KakaoDao;
import com.everyparking.user.api.kakaopay.vo.ApproveResponse;
import com.everyparking.user.api.kakaopay.vo.ReadyResponse;
import com.everyparking.user.api.kakaopay.vo.RefundResponse;
import com.everyparking.user.framework.common.util.SessionUtil;
import com.everyparking.user.framework.common.vo.MemberVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class KakaoServiceImpl implements KakaoService{

	@Autowired
	KakaoDao kakaoDao;

    @Override
    public ReadyResponse payReady(HttpSession session, HttpServletRequest request, HashMap<String, Object> params) throws Exception {
        /**
         *  order id 뽑아오기 mapper에서
         *  user_id 뽑아오기 setCreator
         *  하단 값에 넣기
         *         * **/
        String order_id = "";
        String user_id = "";
        
        int orderId = kakaoDao.getOrderIdByReseSeq();
        order_id = Integer.toString(orderId);
        
        SessionUtil.setCreator(request, params);
        MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
        user_id = sessionUser.getUSER_MAIL();


        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("cid", "TC0ONETIME");
        parameters.add("partner_order_id", order_id);
        parameters.add("partner_user_id", user_id);
        parameters.add("item_name", String.valueOf(params.get("item")));
        parameters.add("quantity", "1");
        parameters.add("total_amount", String.valueOf(params.get("RESE_PRICE")));
        parameters.add("tax_free_amount", String.valueOf(params.get("RESE_PRICE")));
        parameters.add("approval_url", "http://localhost:9123/order/pay/completed"); // 결제승인시 넘어갈 url
        parameters.add("cancel_url", "http://localhost:9123/order/pay/cancel"); // 결제취소시 넘어갈 url
        parameters.add("fail_url", "http://localhost:9123/order/pay/fail"); // 결제 실패시 넘어갈 url

        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
        // 외부url요청 통로 열기.

        RestTemplate template = new RestTemplate();
        String url = "https://kapi.kakao.com/v1/payment/ready";

        // template으로 값을 보내고 받아온 ReadyResponse값 readyResponse에 저장.
        ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);

        // 받아온 값 return
        return readyResponse;
    }

    @Override
    public ApproveResponse payApprove(HttpSession session, String tid, String pgToken) {

        /**
         *  order id 뽑아오기 mapper에서
         *  하단 값에 넣기
         *         * **/

        String order_id = "";
        String user_id = "";

        int orderId = kakaoDao.getOrderIdByReseSeq();
        order_id = Integer.toString(orderId);

        MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
        user_id = sessionUser.getUSER_MAIL();

        // request값 담기.
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
        parameters.add("cid", "TC0ONETIME");
        parameters.add("tid", tid);
        parameters.add("partner_order_id", order_id); // 주문명
        parameters.add("partner_user_id", user_id);
        parameters.add("pg_token", pgToken);

        // 하나의 map안에 header와 parameter값을 담아줌.
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());

        // 외부url 통신
        RestTemplate template = new RestTemplate();
        String url = "https://kapi.kakao.com/v1/payment/approve";
        // 보낼 외부 url, 요청 메시지(header,parameter), 처리후 값을 받아올 클래스.
        ApproveResponse approveResponse = template.postForObject(url, requestEntity, ApproveResponse.class);

        return approveResponse;
    }

    @Override
    public RefundResponse payRefund(HashMap<String, Object> params) {

        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
        parameters.add("cid", "TC0ONETIME");
        parameters.add("tid", String.valueOf(params.get("RESE_TID")));   // 결제 tid 번호
        parameters.add("cancel_amount", String.valueOf(params.get("RESE_PRICE"))); // 취소 금액
        parameters.add("cancel_tax_free_amount", String.valueOf(params.get("RESE_PRICE"))); // 취소 비과세금액

        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
        RestTemplate template = new RestTemplate();
        String url = "https://kapi.kakao.com/v1/payment/cancel";
        RefundResponse refundResponse = template.postForObject(url, requestEntity, RefundResponse.class);

        return refundResponse;
    }

    @Override
    public HashMap<String, Object> getTid(HashMap<String, Object> params) {
        return kakaoDao.getTid(params);
    }

    // 카카오페이 서버로 보낼때 필요한 헤더 작성
    private HttpHeaders getHeaders() {
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "KakaoAK 61cf1fe34edc623cd354590478f465ba");
        headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        return headers;
    }
}
