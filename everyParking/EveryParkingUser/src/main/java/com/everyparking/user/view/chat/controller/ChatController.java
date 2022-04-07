package com.everyparking.user.view.chat.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.everyparking.user.api.chat.service.ChatService;
import com.everyparking.user.framework.common.vo.MemberVo;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("/chatting")
	public String chatting() {
		return "/chat/chatting";
	}
	
}
