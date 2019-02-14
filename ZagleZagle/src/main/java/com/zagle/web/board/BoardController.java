package com.zagle.web.board;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.aop.ThrowsAdvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.zagle.common.Page;
import com.zagle.service.admin.AdminService;
import com.zagle.service.board.BoardService;
import com.zagle.service.chat.ChatService;
import com.zagle.service.domain.Blind;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Local;
import com.zagle.service.domain.Report;
import com.zagle.service.domain.SearchBoard;
import com.zagle.service.domain.User;
import com.zagle.service.user.UserService;


@Controller
@RequestMapping("/board/*")
public class BoardController {	
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminService;
	
	public BoardController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['boardPageSize']}")
	int boardPageSize;
	
	
/////////////게시물
	@RequestMapping(value="addBoard", method=RequestMethod.GET)
	public ModelAndView addBoard(@RequestParam("userNo") String userNo) throws Exception{
		
		System.out.println("/addBoard GET");
		System.out.println("userNo : "+userNo);
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("forward:/view/board/addBoard.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addBoard", method=RequestMethod.POST)
	public ModelAndView addBoard(@ModelAttribute("board") Board board, @RequestParam("userNo") String userNo, MultipartHttpServletRequest mtfRequest) throws Exception{
		
		System.out.println("/addBoard POST");
		
		//이미지 링크 파싱
		String[] photo=board.getPhoto1().split(",");
	
		if(photo.length==1) {
			board.setPhoto1(photo[0]);
	    }else if(photo.length==2) {
	    	board.setPhoto1(photo[0]);
	    	board.setPhoto2(photo[1]);
	    }else if(photo.length==3) {
	        board.setPhoto1(photo[0]);
	        board.setPhoto2(photo[1]);
	        board.setPhoto3(photo[2]);
	    }
		
        
        User user=userService.getUser2(userNo);//getUser2
        
		board.setUser(user);
		board.setBoardStatus("1");//정상 게시물
		
		System.out.println(board);
		
		boardService.addBoard(board);
		
		//게시물 등록 10점
		int value = user.getTotalActiveScore();
		user.setTotalActiveScore(value+10);	
		
		userService.addActiveScore(user);
		
		//등업	
		int value1 = user.getTotalActiveScore();
		
		System.out.println("활동점수 확인"+value1);		
		
		if(100<=value1 && value1<=199) {
			user.setGrade("1");
			userService.updateGrade(user);

		}else if(200<=value1 && value1<=299) {
			user.setGrade("2");
			userService.updateGrade(user);

		}else if(300<=value1 && value1<=99999) {
			user.setGrade("3");
			userService.updateGrade(user);
		}
		       
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("redirect:/board/listBoard?view=town");
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="deleteBoard", method=RequestMethod.GET)
	public ModelAndView deleteBoard(@ModelAttribute("board") Board board) throws Exception{
		
		
		System.out.println("/deleteBoard");
		
		board.setBoardStatus("2");//게시물 삭제
		
		System.out.println(board);
		
		boardService.updateBoardStatus(board);
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("redirect:/board/listBoard?view=town");
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="getBoard", method=RequestMethod.GET)
	public ModelAndView getBoard(@RequestParam("boardNo") String boardNo) throws Exception{
		
		System.out.println("/getBoard");		
		
		Board board=boardService.getBoard(boardNo);
		
		User user=userService.getUser2(board.getUser().getUserNo());//getUser2
		
		board.setUser(user);
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("board", board);
		modelAndView.setViewName("forward:/view/board/getBoard.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="listBoard", method=RequestMethod.GET)
	public ModelAndView listBoard(HttpSession session) throws Exception{
		
		System.out.println("/listBoard GET");
		
		SearchBoard searchBoard=new SearchBoard();
		
		if(searchBoard.getCurrentPage() ==0 ){
			searchBoard.setCurrentPage(1);
		}
		
		searchBoard.setPageSize(boardPageSize);		
		
		if(session.getAttribute("user")!=null) {
		
			User user=(User)session.getAttribute("user");
				
			String loginUserNo=user.getUserNo();
		
			searchBoard.setLoginUserNo(loginUserNo);
		}
		
		
		Map<String , Object> map=boardService.listBoard(searchBoard);
		
		List<Local> list = boardService.getState();//추가
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("boardList", map.get("boardList"));//게시물 리스트
		modelAndView.addObject("searchBoard", searchBoard);//검색 조건
		modelAndView.addObject("list",list);//동네  리스트		
		modelAndView.setViewName("forward:/view/board/listBoard.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="listBoard", method=RequestMethod.POST)
	public ModelAndView listBoard(@ModelAttribute("searchBoard") SearchBoard searchBoard, HttpSession session) throws Exception{
		
		System.out.println("/listBoard POST");
		
		if(searchBoard.getLocal()=="") {
			searchBoard.setLocal(null);
		}
		
		if(searchBoard.getSearchKeyword()=="") {
			searchBoard.setSearchKeyword(null);
		}
		
		if(searchBoard.getCurrentPage()==0) {
			searchBoard.setCurrentPage(1);
		}
		
		if(session.getAttribute("user")!=null) {
			
			User user=(User)session.getAttribute("user");
				
			String loginUserNo=user.getUserNo();
		
			searchBoard.setLoginUserNo(loginUserNo);
		}else if(session.getAttribute("user")==null) {
			searchBoard.setLoginUserNo(null);
		}
		
		searchBoard.setPageSize(boardPageSize);
		
		Map<String , Object> map=boardService.listBoard(searchBoard);
	
		List<Local> list = boardService.getState();//추가
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("boardList", map.get("boardList"));//게시물 리스트
		modelAndView.addObject("searchBoard", searchBoard);
		modelAndView.addObject("list",list);//동네  리스트
		modelAndView.setViewName("forward:/view/board/listBoard.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="updateBoard", method=RequestMethod.GET)
	public ModelAndView updateBoard(@RequestParam("boardNo") String boardNo) throws Exception{
		
		System.out.println("updateBoard GET");
		
		System.out.println("boardNo : "+boardNo);
	
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("board", boardService.getBoard(boardNo));
		modelAndView.setViewName("forward:/view/board/updateBoard.jsp");

		
		return modelAndView;
	}
	
	@RequestMapping(value="updateBoard", method=RequestMethod.POST)
	public ModelAndView updateBoard(@ModelAttribute("board") Board board, @RequestParam("userNo") String userNo, MultipartHttpServletRequest mtfRequest) throws Exception{
		
		System.out.println("updateBoard POST");
		
		String[] photo=board.getPhoto1().split(",");//이미지 링크 파싱
		
		if(photo.length==1) {
			board.setPhoto1(photo[0]);
	    }else if(photo.length==2) {
	    	board.setPhoto1(photo[0]);
	    	board.setPhoto2(photo[1]);
	    }else if(photo.length==3) {
	        board.setPhoto1(photo[0]);
	        board.setPhoto2(photo[1]);
	        board.setPhoto3(photo[2]);
	    }

		board.setUser(userService.getUser2("userNo"));//userNo으로 바꿔야함
		board.setBoardStatus("1");//정상 게시물
		
		System.out.println(board);
		
		boardService.updateBoard(board);
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("redirect:/board/listBoard?view=town");
		
		return modelAndView;
	}
	
	
	
////////////////링크
	@RequestMapping(value="addLink", method=RequestMethod.GET)
	public ModelAndView addLink(@RequestParam("boardNo")String boardNo) throws Exception{
		
		System.out.println("/addLink GET");
		
		System.out.println("boardNo : "+boardNo);
		
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("board", boardService.getBoard(boardNo));
		modelAndView.setViewName("forward:/view/board/addLink.jsp");
		
		return modelAndView;
	}

	
////////////////////신고
	@RequestMapping(value="addReport", method=RequestMethod.GET)
	public ModelAndView addReport(@RequestParam("reportReason") String reportReason, @RequestParam("reportingUserNo") String reportingUserNo, 
			@RequestParam("reportedBoardNo") String reportedBoardNo, @RequestParam("reportedUserNo") String reportedUserNo, @RequestParam("reportedCommentNo") String reportedCommentNo) throws Exception{
		
		System.out.println("/addReport");
		System.out.println("reportReason : "+reportReason);
		System.out.println("reportingUserNo : "+reportingUserNo);
		System.out.println("reportedUserNo : "+reportedUserNo);
		System.out.println("reportedBoardNo : "+reportedBoardNo);		
		System.out.println("reportedCommentNo : "+reportedCommentNo);
		
		User reportingUser=new User();
		reportingUser.setUserNo(reportingUserNo);
		
		User reportedUser=new User();
		reportedUser.setUserNo(reportedUserNo);
		
		Board board=new Board();
		board.setBoardNo(reportedBoardNo);
		
		Comment comment=new Comment();
		comment.setCommentNo(reportedCommentNo);
		
		Report report=new Report();
		report.setReportingUserNo(reportingUser);
		report.setReportedUserNo(reportedUser);
		report.setReportReason(reportReason);
		report.setReportedBoardNo(board);
		report.setReportedCommentNo(comment);
		
		boardService.addReport(report);
		
		//신고 횟수 카운트
		int reportCount=adminService.checkReportCount(report);
		
		System.out.println("reportCount : "+reportCount);
		
		if(reportCount==3) {
			
			if(report.getReportedCommentNo().getCommentNo().equals("")) {
			
				//해당 게시물 블라인드 등록 blind code 0으로
				Blind blind=new Blind();
				blind.setBlindBoardNo(report.getReportedBoardNo());
				adminService.addBlind(blind);
				
				//해당 게시물 boardStatus 3으로
				board.setBoardStatus("3");
				boardService.updateBoardStatus(board);		
							
			}else if(report.getReportedBoardNo().getBoardNo().equals("")) {
								
				//해당 댓글 블라인드 등록 blind code 0으로
				Blind blind=new Blind();
				blind.setBlindCommentNo(report.getReportedCommentNo());
				adminService.addBlind(blind);
				
				//해당 게시물 commentStatus 2로
				comment.setCommentStatus("2");
				boardService.updateCommentStatus(comment);							
			}
						
		}//신고 횟수 카운트 끝
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("forward:/view/board/close.jsp");
		
		return modelAndView;
	}
	
	
///////////////////맵	
	@RequestMapping( value="listMap", method=RequestMethod.GET)
	public ModelAndView listMap (HttpSession session) throws Exception{
		
		List<Local> list = boardService.getState();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list",list);
		modelAndView.setViewName("forward:/view/board/listMap.jsp");
		
		return modelAndView;
	}
	
	
///////////////////////////세션 테스트	
	@RequestMapping(value="testUser")
	public String testUser(HttpSession session) throws Exception{
		
		User testUser = new User();
	
		//상아
		//testUser=userService.getUser2("US10003");
		
		//인호
		//testUser=userService.getUser2("US10023");

		//testUser=userService.getUser3("김주현");

		testUser=userService.getUser3("박현서");

		//testUser=userService.getUser3("상후");
		
		//testUser=userService.getUser3("김보미");
		
		//testUser=userService.getUser3("김춘배");
		
		//testUser=userService.getUser3("페리오");
		
		//testUser=userService.getUser3("김주영");
		
		
		session.setAttribute("user", testUser);
		
		return "redirect:/board/listBoard?view=town";
	}
	
	@RequestMapping(value="testUser2")
	public String testUser2(HttpSession session) throws Exception{
		
		User testUser = new User();
		testUser=userService.getUser3("admin");
		session.setAttribute("user", testUser);
		
		return "redirect:/board/listBoard?view=town";
	}

}
