package com.zagle.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zagle.service.domain.User;
import com.zagle.service.user.UserService;

//==> 회원관리 Controller
@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public UserController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="addUser", method=RequestMethod.GET)
	public ModelAndView addUser() throws Exception {
		
		System.out.println("::==>/addUserView() start");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/user/addUserView.jsp");
		
		return modelAndView;
		
	}
	@RequestMapping(value="getUser", method=RequestMethod.GET)
	public ModelAndView getUser(@RequestParam("userNo") String userNo) throws Exception {
		
		System.out.println("getUser Start!!!!!!!!");
		
		User user = userService.getUser(userNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(user);
		modelAndView.setViewName("/user/getUser.jsp");
		
		return modelAndView;
		
	}
	
	@RequestMapping(value="updateUser", method=RequestMethod.GET)
	public ModelAndView updateUser(@RequestParam("userNo") String userNo) throws Exception {
		
		System.out.println(":==>/updateUserView.start");
		
		User user = userService.getUser(userNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(user);
		modelAndView.setViewName("/user/updateUserView.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value="updateUser", method=RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute("user") User user, Model model, HttpSession session) throws Exception {
		
		System.out.println("/user/updateUser : POST");
		
		//Business Logic 
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserNo();
		if(sessionId.equals(user.getUserNo())) {
			session.setAttribute("user", user);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(user);
		modelAndView.setViewName("redirect:/user/`etUser?userNo="+user.getUserNo());
		
		return modelAndView;
	}
	
}
