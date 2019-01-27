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

import com.zagle.service.admin.AdminService;
import com.zagle.service.board.BoardService;
import com.zagle.service.chat.ChatService;
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
	
	/*@Autowired
	@Qualifier("chatServiceImpl")
	private ChatService chatService;
	
	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminService;*/
	
	public BoardController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	
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
		
        
        User user=userService.getUser2(userNo);//getUser2
        
		board.setUser(user);
		board.setBoardStatus("1");//정상 게시물
		
		System.out.println(board);
		
		boardService.addBoard(board);
		
		int value = user.getTotalActiveScore();
		user.setTotalActiveScore(value+10);//게시물 등록 10점	
		
		userService.addActiveScore(user);
        
		ModelAndView modelAndView=new ModelAndView();
	
		modelAndView.setViewName("redirect:http://192.168.0.36:8080/board/listBoard?view=all");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addComment", method=RequestMethod.POST)
	public ModelAndView addComment(@ModelAttribute("comment") Comment comment) throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="addLike", method=RequestMethod.GET)
	public ModelAndView addLike() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="addLink", method=RequestMethod.GET)
	public ModelAndView addLink() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="addReport", method=RequestMethod.GET)
	public ModelAndView addReport() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="addReport", method=RequestMethod.POST)
	public ModelAndView addReport(@ModelAttribute("report") Report report) throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="addScrap", method=RequestMethod.GET)
	public ModelAndView addScrap() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="cancelLike", method=RequestMethod.GET)
	public ModelAndView cancelLike() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="deleteBoard", method=RequestMethod.GET)
	public ModelAndView deleteBoard(@ModelAttribute("board") Board board) throws Exception{
		
		
		System.out.println("/deleteBoard");
		
		board.setBoardStatus("2");//게시물 삭제
		
		System.out.println(board);
		
		boardService.deleteBoard(board);
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("redirect:/board/listBoard?view=all");
		
		return modelAndView;
	}
	
	@RequestMapping(value="deleteComment", method=RequestMethod.GET)
	public ModelAndView deleteComment() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
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
	
	@RequestMapping(value="getHotTag", method=RequestMethod.GET)
	public ModelAndView getHotTag() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="listBoard", method=RequestMethod.GET)
	public ModelAndView listBoard(HttpSession session) throws Exception{
		
		System.out.println("/listBoard GET");
		
		SearchBoard searchBoard=new SearchBoard();
		
		if(session.getAttribute("user")!=null) {
		
			User user=(User)session.getAttribute("user");
				
			String loginUserNo=user.getUserNo();
		
			searchBoard.setLoginUserNo(loginUserNo);
		}
		
		Map<String , Object> map=boardService.listBoard(searchBoard);		
		
		List<Local> list = boardService.getState();//추가
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("boardList", map.get("boardList"));//게시물 리스트
		modelAndView.addObject("searchBoard", searchBoard);
		modelAndView.addObject("list",list);//동네  리스트
		modelAndView.setViewName("forward:/view/board/listBoard.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="listBoard", method=RequestMethod.POST)
	public ModelAndView listBoard(@ModelAttribute("searchBoard") SearchBoard searchBoard, HttpSession session) throws Exception{
		
		System.out.println("/listBoard POST");
		
		System.out.println("**********searchBoard : "+searchBoard);
		
		System.out.println("=====local : "+searchBoard.getLocal());
		
		if(searchBoard.getLocal()=="") {
			searchBoard.setLocal(null);
		}
		
		if(searchBoard.getCurrentPage()==0) {
			searchBoard.setCurrentPage(1);
		}
		
		if(session.getAttribute("user")!=null) {
			
			User user=(User)session.getAttribute("user");
				
			String loginUserNo=user.getUserNo();
		
			searchBoard.setLoginUserNo(loginUserNo);
		}
		
		searchBoard.setPageSize(pageSize);
		
		Map<String , Object> map=boardService.listBoard(searchBoard);
		
		//System.out.println("컨트롤러 map : "+map);
		
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
		modelAndView.setViewName("redirect:/board/listBoard?view=all");
		
		return modelAndView;
	}
	
	@RequestMapping( value="listMap", method=RequestMethod.GET)
	public ModelAndView listMap (HttpSession session) throws Exception{
		
		List<Local> list = boardService.getState();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list",list);
		modelAndView.setViewName("forward:/view/board/listMap.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="testUser")
	public String testUser(HttpSession session) {
		
		User testUser = new User();
		
		/*testUser.setUserNo("US10003");
		testUser.setUserName("최상아");
		testUser.setUserNickname("Ivory");
		testUser.setUserAddr("서울 용산구 이태원동 123-123");
		testUser.setProfile("aaa.jpg");*/
		
//		testUser.setUserNo("US10023");
//		testUser.setUserNickname("이노인호");
//		testUser.setUserName("이인호");
//		testUser.setUserAddr("서울 용산구 이태원동 123-123");
//		testUser.setProfile("dlsgh.jpg");
		
		testUser.setUserNo("US10027");
		testUser.setUserNickname("주그린");
		testUser.setUserName("김주현");
		testUser.setProfile("default.png");
		
		
		session.setAttribute("user", testUser);
		
		return "redirect:/board/listBoard?view=town";
	}

}
