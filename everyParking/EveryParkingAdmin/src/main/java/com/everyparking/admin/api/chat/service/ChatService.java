package com.everyparking.admin.api.chat.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyparking.admin.api.chat.dao.ChatDao;

@Service
public class ChatService {

	@Autowired
	private ChatDao chatDao;
	
	public void insertAdminChat(HashMap<String, Object> params) {
		chatDao.insertAdminChat(params);
	}
	
	public ArrayList<HashMap<String, Object>> getChatMemberInfoList(){
		ArrayList<HashMap<String, Object>> chatMemberList = chatDao.getChatMemberInfoList();
		return chatMemberList;
	}
	
	public ArrayList<HashMap<String, Object>> getAllChatList(int lastChatSeq){
		ArrayList<HashMap<String, Object>> chatAllList = chatDao.getAllChatList(lastChatSeq);
		return chatAllList;
	}
	
}
