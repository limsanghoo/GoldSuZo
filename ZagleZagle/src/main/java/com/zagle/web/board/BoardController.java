package com.zagle.web.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.zagle.service.board.BoardService;
import com.zagle.service.domain.Board;

import spring.domain.User;

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
	@Qualifier("chatServiceImpl")
	private ChatService chatService;
	
	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminService;
	
	public BoardController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="addBoard", method=RequestMethod.GET)
	public ModelAndView addBoard() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="addBoard", method=RequestMethod.POST)
	public ModelAndView addBoard(@ModelAttribute("board") Board board) throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	
	

}
