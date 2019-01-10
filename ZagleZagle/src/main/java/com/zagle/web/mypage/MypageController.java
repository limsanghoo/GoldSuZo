package com.zagle.web.mypage;

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
import com.zagle.service.mypage.MypageService;
import com.zagle.service.user.UserService;

//==> 마이페이지 Controller 
@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	///Field
	@Autowired
	@Qualifier("mypageService")
	private MypageService mypageService;
	private UserService userService;
	
	public MypageController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping( value="addAccount", method=RequestMethod.GET)
	public ModelAndView addAccount(@RequestParam("userNo") String userNo, Model model) throws Exception {
		
		System.out.println("/mypage/addAccount : GET");
		
		User user = userService.getUser(userNo);
		model.addAttribute("user", user);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(model);
		modelAndView.setViewName("forward:/mypage/addAccount.jsp");
		
		return modelAndView;
	}
	/*
	@RequestMapping( value="addAccount", method=RequestMethod.POST)
	public ModelAndView addAccount( @ModelAttribute("user") User user) throws Exception {
		
		System.out.println("/mypage/addAccount : POST");
	    
		mypageService.addAccount(user);
		
	   ModelAndView modelAndView = new ModelAndView();
	   modelAndView.addObject("accUser", user);
	   modelAndView.setViewName(");
	}
	*/

}
