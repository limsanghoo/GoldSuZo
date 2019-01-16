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

	@RequestMapping(value = "getChat", method = RequestMethod.GET)
    public String getChat(Locale locale, Model model,HttpServletRequest request) {

        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
        String formattedDate = dateFormat.format(date);
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip==null) {
			ip=request.getRemoteAddr();
		}
        System.out.println(locale+" "+formattedDate+" "+ip+"유저 채팅방입장");
        model.addAttribute("serverTime", formattedDate );

        return "forward:/view/chat/chat.jsp";
    }
//	
//	@RequestMapping(value="chat/{value}",method=RequestMethod.GET)
//	public ModelAndView getChat(@PathVariable String userNo) throws Exception {
//		
//		User chatUser = (User)userService.getUser(userNo);
//		
//		System.out.println(chatUser.getUserName()+"님 채팅방입장");
//		
//		Chat chat = new Chat();
//		
//		chat.setChatAddress(chatUser.getUserAddr());
//		chat.setNickName(chatUser.getUserNickname());
//		chat.setProfile(chatUser.getProfile());
//		
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.addObject("chat", chat);
//		modelAndView.setViewName("forward:chat/json/chat");
//		
//		return modelAndView;
//	}
	
	@RequestMapping(value="testUser")
	public String testUser(HttpServletRequest request,HttpSession session) {
		User user = new User();
		user.setUserNickname("유저1");
		user.setUserAddr("강남");
		
		session.setAttribute("user", user);
		System.out.println("세션에 유저넣음1");
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="testUser2")
	public String testUser2(HttpServletRequest request,HttpSession session) {
		User user = new User();
		user.setUserNickname("유저2");
		user.setUserAddr("강남");
		
		session.setAttribute("user", user);
		System.out.println("세션에 유저넣음2");
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="testUser3")
	public String testUser3(HttpServletRequest request,HttpSession session) {
		User user = new User();
		user.setUserNickname("유저3");
		user.setUserAddr("서초");
		
		session.setAttribute("user", user);
		System.out.println("세션에 유저넣음3");
		return "redirect:/index.jsp";
	}
}
