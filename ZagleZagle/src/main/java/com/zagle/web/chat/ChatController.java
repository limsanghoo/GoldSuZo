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
    public String getChat(Locale locale, Model model,HttpServletRequest request,HttpSession session) {
		User user = (User)session.getAttribute("user");
		String room = request.getParameter("room");
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
        String formattedDate = dateFormat.format(date);
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip==null) {
			ip=request.getRemoteAddr();
		}
        System.out.println(locale+" "+formattedDate+" "+ip+"유저 채팅방입장");
        model.addAttribute("room", room);
        model.addAttribute("serverTime", formattedDate );

        if (room.equals(user.getUserAddr())) {
            return "forward:/view/chat/chat.jsp";
		}else {
	        return "forward:/view/chat/oneToOneChat.jsp";
		}
        
    }
	
	@RequestMapping(value="testUser")
	public String testUser(HttpServletRequest request,HttpSession session) {
		User user = new User();
		user.setProfile("juh.jpg");
		user.setUserNickname("주현");
		user.setUserAddr("서울시 서초구 서초동");
		
		session.setAttribute("user", user);
		System.out.println("세션에 유저넣음1");
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="testUser2")
	public String testUser2(HttpServletRequest request,HttpSession session) {
		User user = new User();
		user.setProfile("dlsgh.jpg");
		user.setUserNickname("백인호");
		user.setUserAddr("서울시 서초구 서초동");
		
		session.setAttribute("user", user);
		System.out.println("세션에 유저넣음2");
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="testUser3")
	public String testUser3(HttpServletRequest request,HttpSession session) {
		User user = new User();
		user.setProfile("sanghoo.jpg");
		user.setUserNickname("상후형");
		user.setUserAddr("서울시 관악구 봉천동");
		
		session.setAttribute("user", user);
		System.out.println("세션에 유저넣음3");
		return "redirect:/index.jsp";
	}
}
