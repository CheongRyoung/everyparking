package com.everyparking.user.api.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.everyparking.user.api.chat.service.ChatService;
import com.everyparking.user.framework.common.vo.MemberVo;

@RestController
@RequestMapping("/chat")
public class RestChatController {

	@Autowired
	private ChatService chatService;
	
	
	@RequestMapping("/writeCommentProcess")
	public HashMap<String, Object> writeComment(@RequestParam HashMap<String, Object> params, HttpSession session){
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int userSeq = sessionUser.getUSER_SEQ();
		// 댓글 작성 회원
		params.put("CHAT_SENDE", userSeq);
		// 채팅 받는 사람 관리자 한명
		params.put("CHAT_RECIV", 2);
		
		chatService.insertUserChat(params);
		
		return data;
	}
	
	@RequestMapping("/getChatListByOneUser")
	public HashMap<String, Object> getChatListByOneUser(HttpSession session , int lastChatSeq){
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int userSeq = sessionUser.getUSER_SEQ();
		
		ArrayList<HashMap<String, Object>> chatList = chatService.getChatListByOneUser(userSeq,lastChatSeq);
		
		data.put("chatList", chatList);
		data.put("USER_SEQ", userSeq);
		
		return data;
	}
	
	@RequestMapping("/getAdminInfo")
	public HashMap<String, Object> getAdminInfo(){
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		HashMap<String, Object> adminInfo = chatService.getAdminInfo();
		data.put("adminInfo", adminInfo);
		return data;
	}
	
}
