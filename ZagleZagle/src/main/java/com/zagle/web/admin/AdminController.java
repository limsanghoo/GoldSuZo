package com.zagle.web.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zagle.common.Page;
import com.zagle.service.admin.AdminService;
import com.zagle.service.board.BoardService;
import com.zagle.service.domain.BlackList;
import com.zagle.service.domain.Blind;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Report;
import com.zagle.service.domain.SearchAdmin;
import com.zagle.service.domain.User;
import com.zagle.service.user.UserService;

//===>Admin Controller
@Controller
@RequestMapping("/admin/*")
public class AdminController {

	///Field
	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminService;
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	
	
	
	public AdminController() {
		
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	
	@RequestMapping(value="siteManage")
	public ModelAndView siteManage() throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/view/admin/siteManage.jsp");
		
		return modelAndView;
		
	}
	
	
	
	@RequestMapping(value="listUser")
	public ModelAndView listUser(@ModelAttribute("SearchAdmin") SearchAdmin search, HttpServletRequest request) throws Exception {
		
		System.out.println("/admin/listUser : GET/POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = adminService.listUser(search);
		
		System.out.println(search.getCurrentPage());
		System.out.println(pageUnit);
		System.out.println(pageSize);
		
		System.out.println(map.get("totalCount"));
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	    System.out.println(resultPage);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search",search);
		modelAndView.setViewName("/view/admin/listUser.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="listBlackObject")
	public ModelAndView listBlackObject(@ModelAttribute("SearchAdmin") SearchAdmin search, HttpServletRequest request) throws Exception {
		
		System.out.println("/admin/listBlackObject : GET/POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = adminService.listBlackObject(search);
		
		System.out.println(search.getCurrentPage());
		System.out.println(pageUnit);
		System.out.println(pageSize);
		
		System.out.println(map.get("totalCount"));
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	    System.out.println(resultPage);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search",search);
		modelAndView.setViewName("/view/admin/listBlackObject.jsp");
		
		return modelAndView;
		
		
	}
	@RequestMapping(value="listBlackList")
	public ModelAndView listBlackList(@ModelAttribute("SearchAdmin") SearchAdmin search, HttpServletRequest request) throws Exception {
		
		System.out.println("============================listBlackList START============================");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = adminService.listBlackList(search);
		
		System.out.println(search.getCurrentPage());
		System.out.println(pageUnit);
		System.out.println(pageSize);
		
		System.out.println(map.get("totalCount"));
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	    System.out.println(resultPage);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search",search);
		modelAndView.setViewName("/view/admin/listBlackList.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value="handleReport")
	public ModelAndView handelReport(@ModelAttribute("SearchAdmin") SearchAdmin search, HttpServletRequest request) throws Exception {
		
		System.out.println("/admin/handelReport : GET, POST ");

		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		
		Map<String, Object> map = adminService.getBlindList(search);
		
		
		
		System.out.println(search.getCurrentPage());
		System.out.println(pageUnit);
		System.out.println(pageSize);
		
		System.out.println(map.get("totalCount"));
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	    System.out.println(resultPage);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search",search);
		modelAndView.setViewName("/view/admin/handleReport.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value="updateBlind" , method=RequestMethod.GET)
	public ModelAndView updateBlind(@RequestParam("blindNo") String blindNo,
																	@RequestParam("blindCode") String blindCode,
																		@RequestParam("boardNo") String boardNo,
																	 HttpServletRequest request) throws Exception {
		
		System.out.println("===============updateBlind(blindCode)=======================");
		
		
		
		
		System.out.println("blindNo"+blindNo);
		System.out.println("blindCode"+blindCode);
		System.out.println("boardNo"+boardNo);
		
	
		
		Blind blind = adminService.getBlind(blindNo);
		
		String boardNo1 = blind.getBlindBoardNo().getBoardNo();
		
		Board board = boardService.getBoard(boardNo1);
		
		System.out.println("boardNo 확인"+board);
		
		User user = board.getUser();
		String userNo = user.getUserNo();
		System.out.println("userNo"+userNo);
		
		User user01 = userService.getUser2(userNo);
		
		int deleteCount = user01.getDeleteCount();
	
		System.out.println(deleteCount);
		
		
		blind.setBlindNo(blindNo);
		blind.setBlindCode(blindCode);
		
		if(blindCode.equals("1")) {
			
		board.setBoardStatus("2");
		
		user01.setDeleteCount(deleteCount+1);
		
		}else {
		board.setBoardStatus("4");	
		}
		
		adminService.updateBlind(blind);
		
		//Report report = new Report();
		
		//report.setHardleNo(1);
		
		boardService.updateBoard(board);
		userService.updateDeleteCount(user01);
		
		Board ReBoard = boardService.getBoard(boardNo);
		Report report = new Report();
		report.setReportedBoardNo(ReBoard);
		report.setHardleNo(1);
		
		adminService.updateReport(report);
		
		

	

		
		
		System.out.println("딜리트 카운트"+deleteCount);
		
		if(deleteCount == 2) {
			user01.setBlackCode(1);
			userService.updateUser(user01);
		}

		
		System.out.println("blind 확인 :"+blind);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("redirect:/admin/handleReport");
		
		return modelAndView;
		
		
	}
	
	
	@RequestMapping(value="updateBlind2" , method=RequestMethod.POST)
	public ModelAndView updateBlind2(@RequestParam("blindNo") String blindNo,
																	@RequestParam("blindCode") String blindCode,
																		@RequestParam("commentNo") String commentNo,
																	 HttpServletRequest request) throws Exception {
		
		System.out.println("===============updateBlind2(blindCode)=======================");
		
		
		
		
		System.out.println("blindNo"+blindNo);
		System.out.println("blindCode"+blindCode);
		System.out.println("commentNo"+commentNo);
		
		Comment comment = adminService.getComment(commentNo);
		User user = comment.getUser();
		String userNo = user.getUserNo();
		
		Blind blind = adminService.getBlind(blindNo);
		
		
		System.out.println("userNo"+userNo);
		
		User user01 = userService.getUser2(userNo);
		
		int deleteCount = user01.getDeleteCount();
	
		System.out.println(deleteCount);
		
		
		blind.setBlindNo(blindNo);
		blind.setBlindCode(blindCode);
		
		if(blindCode.equals("1")) {
			
		comment.setCommentStatus("2");	
		
		user01.setDeleteCount(deleteCount+1);
		
		}else {
			
		comment.setCommentStatus("3");
		}
		
		adminService.updateBlind(blind);
		
		//Report report = new Report();
		
		//report.setHardleNo(1);
		
		adminService.updateComment(comment);
		userService.updateDeleteCount(user01);
		
		Comment reComment = adminService.getComment(commentNo);
		Report report = new Report();
		report.setReportedCommentNo(reComment);
		report.setHardleNo(1);
		
		adminService.updateReport(report);
		
		

	

		
		
		System.out.println("딜리트 카운트"+deleteCount);
		
		if(deleteCount == 2) {
			user01.setBlackCode(1);
			userService.updateUser(user01);
		}

		
		System.out.println("blind 확인 :"+blind);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("redirect:/admin/handleReport");
		
		return modelAndView;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="updateUser2", method=RequestMethod.POST)
	public ModelAndView updateUser(@RequestParam("userNo") String userNo, @RequestParam("blackCode") int blackCode,
																@ModelAttribute("blackList") BlackList blackList) throws Exception {
		
		
		System.out.println("updateUser2 Start");
		
		System.out.println(userNo);
		System.out.println(blackCode);
		System.out.println(blackList);
		
		
		
		User user = userService.getUser2(userNo);
		user.setBlackCode(blackCode);
		
		

		userService.updateUser(user);
		
		user.setDeleteCount(0);
		userService.updateDeleteCount(user);
		
		blackList.setBlackUser(user);
		
		
		
		System.out.println("업데이트 확인용 :"+user);
		adminService.addBlackList(blackList);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(user);
		modelAndView.setViewName("redirect:/admin/listBlackObject");
		
		return modelAndView;
	}
	@RequestMapping(value="updateBlackCheckCode", method=RequestMethod.GET)
	public ModelAndView updateBlackCheckCode(@RequestParam("userNo") String userNo,
																						@RequestParam("blackNo") String blackNo) throws Exception {
		
		
		System.out.println("업데이트 블랙체크 코드 시작!!!!!!!!!!!!!!!!!!");
		
		System.out.println(userNo);
		System.out.println(blackNo);
		
		String blackCheckCode = "1";
		BlackList black = new BlackList();
		
		black.setBlackCheckCode(blackCheckCode);
		black.setBlackNo(blackNo);
		
		adminService.updateBlackCheckCode(black);
	
		User user = userService.getUser2(userNo);
		user.setBlackCode(4);
		
		userService.updateUser(user);
		
		System.out.println("user 업데이트 확인"+user);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/admin/listBlackList");
		
		return modelAndView;
				
	}
	@RequestMapping(value="expireBanDate", method=RequestMethod.GET)
	public ModelAndView expireBanDate(@ModelAttribute("SearchAdmin") SearchAdmin search) throws Exception {
		
		
		System.out.println("expireBanDate 시작!!!!!!!!!!!!!!!!!!");
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = adminService.listBlackList(search);
		
		System.out.println(search.getCurrentPage());
		System.out.println(pageUnit);
		System.out.println(pageSize);
		
		System.out.println(map.get("totalCount"));
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	    System.out.println(resultPage);
	
		
		String blackCheckCode = "1";
		

		ArrayList list = (ArrayList) map.get("list");
		
		System.out.println("리스트리스트"+list);
		
		List<BlackList> bkList = new ArrayList<BlackList> ();
		
		for(int i=0; i< list.size(); i++) {
			
			BlackList bk = (BlackList) list.get(i);
			String blackNo = bk.getBlackNo();
			
			System.out.println("블랙넘 확인"+blackNo);
			
			Date banDate = bk.getBanExpireDay();
			
			System.out.println("banDate 만료 확인 :"+banDate);
			
			Date currentDate;
			String oTime ="";
			String compareVal = "N";
				
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
			Date currentTime = new Date();
			oTime = mSimpleDateFormat.format(currentTime);
			currentDate = mSimpleDateFormat.parse(oTime);
			
			System.out.println("현재 날짜 확인 :"+currentDate);
			
			int compare = currentDate.compareTo(banDate);
			
			System.out.println("비교 확인"+compare);
			if(compare > 0) {
				
				bk.setBlackCheckCode(blackCheckCode);
				bk.setBlackNo(blackNo);
				
				adminService.updateBlackCheckCode(bk);
			
				compareVal = "N";
			}else if (compare <= 0) {
				
			
				
				
				
				compareVal = "Y";
			}
			
		}
		
		boolean result = true;
		
		ModelAndView model = new ModelAndView();
		model.setViewName("/index.jsp");
		model.addObject("result", result);
		
		return model;
				
	}
	
}

