package com.zagle.web.mypage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zagle.common.Page;
import com.zagle.common.Search;
import com.zagle.service.board.BoardService;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Mypage;
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
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
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
		
		System.out.println("addAccount User info :"+user);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(user);
		modelAndView.setViewName("forward:/view/mypage/addAccount.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping( value="addAccount", method=RequestMethod.POST)
	public ModelAndView addAccount( @ModelAttribute("user") User user, HttpSession session) throws Exception {
		
		System.out.println("/mypage/addAccount : POST");
	 
	    
	    
		mypageService.addAccount(user);
	
		
		User user01 = (User) session.getAttribute("user");
		
		
	   ModelAndView modelAndView = new ModelAndView();
	   
	   
	   modelAndView.addObject("accUser", user);
	   modelAndView.addObject("user", user01);
	   modelAndView.setViewName("/view/user/getUser.jsp");
	   
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
	public ModelAndView updateAccount(@RequestParam("snsNo") String snsNo, @ModelAttribute("user") User user, HttpSession session) throws Exception {
		
		System.out.println("/mypage/updateAccount : POST");
		
		mypageService.addAccount(user);

		User user01 = (User) session.getAttribute("user");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(user);
		 modelAndView.addObject("user", user01);
		modelAndView.setViewName("/view/user/getUser.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping( value="listComment")
	public ModelAndView listComment(@ModelAttribute("SearchMypage") SearchMypage searchMypage, HttpSession session, HttpServletRequest request)throws Exception {
		
		System.out.println("/mypage/listComment : GET/POST");
		
		
		if(searchMypage.getCurrentPage() ==0 ){
			searchMypage.setCurrentPage(1);
		}
		
		User user = (User) session.getAttribute("user");
		user.getUserNo();
		user = userService.getUser2(user.getUserNo());
		
		System.out.println("getUser 값 :"+user);
		
		 searchMypage.setMyUser(user);
		searchMypage.setPageSize(pageSize);

			
		
		
		Map<String, Object> map = mypageService.listComment(searchMypage);
		
		System.out.println(pageUnit);
		System.out.println(pageSize);
		System.out.println(map);
		
		System.out.println(map.get("totalCount"));
		
		Page resultPage = new Page( searchMypage.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	    System.out.println(resultPage);
		
		ArrayList list = (ArrayList) map.get("list");
		System.out.println(list);
		System.out.println(list.size());
		List<Board> bdList = new ArrayList<Board>();
	
		
		
		for (int i = 0; i < list.size(); i++) {
		
			Mypage mp = (Mypage)list.get(i);
			String bdNo = mp.getBoard().getBoardNo();
			
			Board bd = boardService.getBoard(bdNo);
			
			String userNo = bd.getUser().getUserNo();
			


			User user01 = userService.getUser2(userNo);
			
			bd.setUser(user01);
			
			bdList.add(bd);
	
		}
	
		

		
	
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("Cboard", bdList);
		
		modelAndView.addObject(" searchMypage",  searchMypage);
		modelAndView.setViewName("forward:/view/mypage/listComment.jsp");
	
	
		return modelAndView;
	
	}
	@RequestMapping( value="listMyBoard")
	public ModelAndView listMyBoard(@ModelAttribute("SearchMypage") SearchMypage searchMypage, HttpServletRequest request, HttpSession session)throws Exception {
		
		System.out.println("/mypage/listMyboard : GET/POST");
	

		if(searchMypage.getCurrentPage() ==0 ){
			searchMypage.setCurrentPage(1);
		}
		
		User user = (User) session.getAttribute("user");
		
		searchMypage.setMyUser(user);
		searchMypage.setPageSize(pageSize);

		
		System.out.println();

		
		Map<String, Object> map = mypageService.listMyBoard(searchMypage);

		System.out.println(map);
		
		Page resultPage = new Page( searchMypage.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	    System.out.println(resultPage);
		
		ArrayList list = (ArrayList) map.get("list");
		System.out.println(list);
		List<Board> bdList = new ArrayList<Board>();
		
		
		
		for (int i = 0; i < list.size(); i++) {
		
			Mypage mp = (Mypage)list.get(i);
			String bdNo = mp.getBoard().getBoardNo();
			
		
			
			
			

			
		
			
			
			Board bd = boardService.getBoard(bdNo);
			String userNo = bd.getUser().getUserNo();
			User user01 = userService.getUser2(userNo);
			
			
			
			bd.setUser(user01);
			bdList.add(bd);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("listBoard", bdList);
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("searchMypage", searchMypage);
		modelAndView.addObject("user", user);
		modelAndView.setViewName("forward:/view/mypage/listMyBoard.jsp");
	
	
		return modelAndView;
	}
	@RequestMapping(value="listScrap")
	public ModelAndView listScrap(@ModelAttribute("SearchMypage") SearchMypage searchMypage, HttpSession session, HttpServletRequest request) throws Exception {
		
		System.out.println(searchMypage.getCurrentPage());
	
		System.out.println("/mypage/listScrap : GET/POST");
		User user = (User) session.getAttribute("user");
		
		
		System.out.println("user 확인 :"+user);
		
		if(searchMypage.getCurrentPage() ==0 ){
			searchMypage.setCurrentPage(1);
		}
		
		searchMypage.setMyUser(user);
		searchMypage.setPageSize(pageSize);

		
		Map<String, Object> map = mypageService.listScrap(searchMypage);
	
		System.out.println(searchMypage.getCurrentPage());
		System.out.println(pageUnit);
		System.out.println(pageSize);
		
		System.out.println(map.get("totalCount"));
		
		Page resultPage = new Page( searchMypage.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	    System.out.println(resultPage);
		
		ArrayList list = (ArrayList) map.get("list");
		System.out.println(list);
		List<Board> bdList = new ArrayList<Board>();
		for (int i = 0; i < list.size(); i++) {
		
			Mypage mp = (Mypage)list.get(i);
			String bdNo = mp.getBoard().getBoardNo();

			
			Board bd = boardService.getBoard(bdNo);
			String userNo = bd.getUser().getUserNo();
			User user01 = userService.getUser2(userNo);
			
			bd.setUser(user01);
			bdList.add(bd);
		}
				
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("listBoard", bdList);
		modelAndView.addObject("count", list.size());
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("searchMypage", searchMypage);
		modelAndView.setViewName("forward:/view/mypage/listScrap.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="mypageMainView")
	public ModelAndView mypageMainView() throws Exception {
		
		System.out.println("/mypage/mypageMainView");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/view/mypage/mypageMain.jsp");
		
		return modelAndView;
		
	}
	
	
	
	@RequestMapping(value="listLike")
	public ModelAndView listLike(@ModelAttribute("SearchMypage") SearchMypage search, HttpSession session) throws Exception {
		
		System.out.println("/mypage/listLike : GET/POST");
		User user = (User) session.getAttribute("user");
		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		search.setMyUser(user);
		search.setPageSize(pageSize);
		
		Map<String, Object> map = mypageService.listLike(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	    System.out.println(resultPage);
		
		ArrayList list = (ArrayList) map.get("list");
		System.out.println(list);
		List<Board> bdList = new ArrayList<Board>();
		for (int i = 0; i < list.size(); i++) {
		
			Mypage mp = (Mypage)list.get(i);
			String bdNo = mp.getBoard().getBoardNo();
			
			
			
			Board bd = boardService.getBoard(bdNo);
			String userNo = bd.getUser().getUserNo();
			User user01 = userService.getUser2(userNo);
			
			bd.setUser(user01);
			
			bdList.add(bd);
		}
				
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("user", user);
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("listBoard", bdList);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("forward:/view/mypage/listLike.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value="checkAccount", method=RequestMethod.POST)
	public ModelAndView checkAccount(HttpServletRequest req, HttpSession session) throws Exception {
		
		System.out.println("=============계좌 실명 인증 마지막 단계===================");
		
		String userName = (String) req.getParameter("userName");
		String account = (String) req.getAttribute("account");
		
		System.out.println("리얼 이름 :"+userName);
		System.out.println("계좌 넘어 온거 확인"+account);
		
		User user = (User) session.getAttribute("user");
		
		///DB에 이름 중복된거 있으면 문제나는거 해결 해야함.
		
		String userNo = user.getUserNo();
		
		System.out.println("user 확인 :"+user);
		
		boolean result = mypageService.checkAccount(userName, userNo);
		
		System.out.println("result 콜백 확인"+result);
		
		int nameBank = (int) req.getAttribute("bankName");	
		
		String testBank="";
		
		if(nameBank==97) {
			
			testBank ="신한은행";
			
		}else if(nameBank == 3) {
			
			testBank ="기업은행";
		}else if(nameBank == 4) {
			
			testBank ="국민은행";
		}else if(nameBank == 20) {
			
			testBank ="우리은행";
		}else if(nameBank == 7) {
			
			testBank ="수협";
		}
		
		System.out.println(testBank);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("account", account);
		modelAndView.addObject("BankName", testBank);
		modelAndView.addObject("result", new Boolean(result));
		modelAndView.setViewName("forward:/view/mypage/nameCheck.jsp");
		
		return modelAndView;
		
	}
		
	
	
}
