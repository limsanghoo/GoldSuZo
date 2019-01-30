package com.zagle.web.chat;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	@RequestMapping(value = "getChat", method = RequestMethod.GET)
    public String getChat(Locale locale, Model model,HttpServletRequest request) {
		String room = request.getParameter("room");
		System.out.println("참가방 : "+room);
		System.out.println("참가조건 : "+room.substring(0, 2));
		System.out.println("참가방2 : "+room.substring(2));
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
        String formattedDate = dateFormat.format(date);
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip==null) {
			ip=request.getRemoteAddr();
		}
        System.out.println(locale+" "+formattedDate+" "+ip+"유저 채팅방입장");
        
        model.addAttribute("serverTime", formattedDate );
        if (room.substring(0, 2).equals("@@")) {
        	model.addAttribute("room", room.substring(2));
        	return "forward:/view/chat/oneToOneChat.jsp";
		}else {
			model.addAttribute("room", room);
			return "forward:/view/chat/chat.jsp";
		}
    }
}
