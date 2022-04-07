package com.everyparking.admin.api.chat.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ChatDao {

	public void insertAdminChat(HashMap<String, Object> params);
	public ArrayList<HashMap<String, Object>> getChatMemberInfoList();
	public ArrayList<HashMap<String, Object>> getAllChatList(int lastChatSeq);
	
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           