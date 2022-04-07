package com.everyparking.user.api.chat.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ChatDao {

	public void insertUserChat(HashMap<String, Object> params);
	public ArrayList<HashMap<String, Object>> getChatListByOneUser(@Param("USER_SEQ") int USER_SEQ , @Param("lastChatSeq") int lastChatSeq);
	public HashMap<String, Object> getAdminInfo();
	
}
