package com.everyparking.user.api.chat.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyparking.user.api.chat.dao.ChatDao;

@Service
public class ChatService {

	@Autowired
	private ChatDao chatDao;
	
	public void insertUserChat(HashMap<String, Object> params) {
		chatDao.insertUserChat(params);
	}
	
	public ArrayList<HashMap<String, Object>> getChatListByOneUser(int USER_SEQ , int lastChatSeq){
		ArrayList<HashMap<String, Object>> list = chatDao.getChatListByOneUser(USER_SEQ , lastChatSeq);
		return list;
	}
	
	public HashMap<String, Object> getAdminInfo(){
		HashMap<String, Object> adminInfo = chatDao.getAdminInfo();
		return adminInfo;
	}
}
