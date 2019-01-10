package com.zagle.web.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zagle.service.user.UserService;

//==>회원관리 RestController
@Controller
@RequestMapping("/user/*")

public class UserRestController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//private RestTemplate restTemplate = new RestTemplate(); 
	
	public UserRestController() {
		System.out.println(this.getClass());
	}
	
	

}
