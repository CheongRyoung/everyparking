package com.everyparking.admin.api.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.everyparking.admin.api.chat.service.ChatService;
import com.everyparking.admin.framework.common.vo.MemberVo;

@RestController
@RequestMapping("/chat")
public class RestChatController {

	@Autowired
	private ChatService chatService;
	
	@RequestMapping("/insertAdminChatProcess")
	public HashMap<String, Object> insertAdminChatProcess(@RequestParam HashMap<String, Object> params, HttpSession session){
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int user_seq = sessionUser.getUSER_SEQ();	
		params.put("CHAT_SENDE", user_seq);
		
		chatService.insertAdminChat(params);
		
		return data;
	}

	@RequestMapping("/getChatAllList")
	public HashMap<String, Object> getAllChatList(int lastChatSeq, HttpSession session){
		HashMap<String, Object> data = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> allList = chatService.getAllChatList(lastChatSeq);
		data.put("allList", allList);
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int ADMIN_SEQ = sessionUser.getUSER_SEQ();
		data.put("ADMIN_SEQ", ADMIN_SEQ);
		
		return data;
	}
}
