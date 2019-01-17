package com.zagle.web.mypage;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.zagle.common.Page;
import com.zagle.common.Search;
import com.zagle.service.domain.SearchMypage;
import com.zagle.service.domain.User;
import com.zagle.service.mypage.MypageService;
import com.zagle.service.user.UserService;

//==> 마이페이지 Controller 
@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	///Field
	@Autowired
	@Qualifier("mypageServiceImpl")
	private MypageService mypageService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public MypageController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping( value="addAccount", method=RequestMethod.GET)
	public ModelAndView addAccount( HttpSession session) throws Exception {
		
		System.out.println("/mypage/addAccount : GET");
		
		User user = (User) session.getAttribute("user");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(user);
		modelAndView.setViewName("forward:/view/mypage/addAccount.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping( value="addAccount", method=RequestMethod.POST)
	public ModelAndView addAccount( @ModelAttribute("user") User user) throws Exception {
		
		System.out.println("/mypage/addAccount : POST");
	    
	mypageService.addAccount(user);
		
	   ModelAndView modelAndView = new ModelAndView();
	   modelAndView.addObject("accUser", user);
	   modelAndView.setViewName("forward:/view/mypage/MypageMain.jsp");
	   
	   return modelAndView;
	}
	
	@RequestMapping(value="updateAccount", method=RequestMethod.GET)
	public ModelAndView updateAccount(HttpSession session) throws Exception {
		
		System.out.println(":==>/updateAccount : start");
		
	  User user = (User) session.getAttribute("user");
	   	
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(user);
		modelAndView.setViewName("/view/mypage/updateAccount.jsp");
		
		return modelAndView;
		
	}
	@RequestMapping(value="updateAccount", method=RequestMethod.POST)
	public ModelAndView updateAccount(@ModelAttribute("user") User user) throws Exception {
		
		System.out.println("/mypage/updateAccount : POST");
		System.out.println(user);
	
		
		System.out.println(user.getUserNo());
				
		mypageService.addAccount(user);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(user);
		modelAndView.setViewName("redirect:/view/mypage/MypageMain.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping( value="listComment")
	public ModelAndView listComment(@ModelAttribute("SearchMypage") SearchMypage search, HttpSession session, HttpServletRequest request)throws Exception {
		
		System.out.println("/mypage/listComment : GET/POST");
		
//		if(search.getCurrentPage()==0) {
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
		
		User user = (User) session.getAttribute("user");
		
		search.setMyUser(user);
				
		
		Map<String, Object> map = mypageService.listComment(search);
		
		
		
//		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
//		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("forward:/view/mypage/listComment.jsp");
	
	
		return modelAndView;
	
	}
	@RequestMapping( value="listMyBoard")
	public ModelAndView listMyBoard(@ModelAttribute("SearchMypage") SearchMypage search, HttpServletRequest request, HttpSession session)throws Exception {
		
		System.out.println("/mypage/listMyboard : GET/POST");
		
		User user = (User) session.getAttribute("user");
		search.setMyUser(user);
		
		
		System.out.println();
		
//		if(search.getCurrentPage()==0) {
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
		
		
		Map<String, Object> map = mypageService.listMyBoard(search);
//		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println(resultPage);
//		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
//		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("forward:/view/mypage/listMyBoard.jsp");
	
	
		return modelAndView;
	}
	@RequestMapping(value="listScrap")
	public ModelAndView listScrap(@ModelAttribute("SearchMypage") SearchMypage search, HttpSession session) throws Exception {
		
		System.out.println("/mypage/listScrap : GET/POST");
		User user = (User) session.getAttribute("user");
		search.setMyUser(user);
		
		Map<String, Object> map = mypageService.listScrap(search);
		
				
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("search", search);
		modelAndView.setViewName("forward:/view/mypage/listScrap.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value="listLike")
	public ModelAndView listLike(@ModelAttribute("SearchMypage") SearchMypage search, HttpSession session) throws Exception {
		
		System.out.println("/mypage/listLike : GET/POST");
		User user = (User) session.getAttribute("user");
		search.setMyUser(user);
		
		Map<String, Object> map = mypageService.listLike(search);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("search", search);
		modelAndView.setViewName("forward:/view/mypage/listLike.jsp");
		
		return modelAndView;
	}
}
