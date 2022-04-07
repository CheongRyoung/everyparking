package com.everyparking.admin.view.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.everyparking.admin.api.chat.service.ChatService;

@Controller
@RequestMapping("/chat")
public class ChatController {


	@Autowired
	private ChatService chatService;
	
	@RequestMapping("/adminChat")
	public String adminChat(Model model) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> chatMemberList = chatService.getChatMemberInfoList();
		data.put("chatMemberList", chatMemberList);
		model.addAttribute("data", data);
		
		return "/chat/adminChat";
	}
}
