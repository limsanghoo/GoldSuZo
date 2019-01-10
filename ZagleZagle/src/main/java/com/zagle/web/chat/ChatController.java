package com.zagle.web.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.zagle.service.domain.Chat;
import com.zagle.service.domain.User;
import com.zagle.service.user.UserService;

@Controller
@RequestMapping("/chat/*")
public class ChatController {
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public ChatController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@RequestMapping(value="chat/{value}",method=RequestMethod.GET)
	public ModelAndView getChat(@PathVariable String userNo) throws Exception {
		
		User chatUser = (User)userService.getUser(userNo);
		
		System.out.println(chatUser.getUserName()+"님 채팅방입장");
		
		Chat chat = new Chat();
		
		chat.setChatAddress(chatUser.getUserAddr());
		chat.setNickName(chatUser.getUserNickname());
		chat.setProfile(chatUser.getProfile());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("chat", chat);
		modelAndView.setViewName("forward:chat/json/chat");
		
		return modelAndView;
	}
}
