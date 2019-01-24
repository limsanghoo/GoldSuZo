package com.zagle.web.board;

import java.net.URI;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.zagle.common.Search;
import com.zagle.service.board.BoardService;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Local;
import com.zagle.service.user.UserService;

@RestController
@RequestMapping("/board/*")
public class BoardRestController {
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public BoardRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="json/shareBoard", method=RequestMethod.GET)
	public ModelAndView shareBoard() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="json/addBoardDaumMap", method=RequestMethod.GET)
	public ModelAndView addBoardDaumMap() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="json/addBoardVisionTag", method=RequestMethod.GET)
	@ResponseBody
	public String addBoardVisionTag(@RequestParam("link")String link, HttpSession session) throws Exception{
		
		System.out.println(link);
		
		String resultTag=boardService.addBoardVisionTag(link);
		
		return resultTag;
	}

	@RequestMapping(value="json/listMap", method=RequestMethod.GET)
	public ModelAndView listMap() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="json/listMap/getCity/{stateCode}",method=RequestMethod.GET)
	public List<Local> getCity(@PathVariable int stateCode) throws Exception{
		Local local = new Local();
		local.setStateCode(stateCode);
		List<Local> list = boardService.getCity(local);
		System.out.println(list);
		
		return list;
	}
	
	@RequestMapping(value="json/listMap/getTown/{cityCode}/{stateCode}",method=RequestMethod.GET)
	public List<Local> getTown(@PathVariable int cityCode, @PathVariable int stateCode) throws Exception{
		Local local = new Local();
		local.setCityCode(cityCode);
		local.setStateCode(stateCode);
		
		List<Local> list = boardService.getTown(local);
		System.out.println(list);
		
		return list;
	}
	
	@RequestMapping(value="json/listMap/getMaplist/{local}",method=RequestMethod.GET)
	public List<Board> getMaplist(@PathVariable String local) throws Exception{

		Search search = new Search();
		search.setSearchKeyword(local);
		
		List<Board> board = boardService.getMapList(search);
		
		
		return board;
	}
	
	
	@RequestMapping(value="json/addComment", method=RequestMethod.POST)
	public int addComment(@RequestBody Map<String, String> map) throws Exception{
		  
	      System.out.println("addComment POST");
	      
	      System.out.println(map);
	      
	      //map에서 꺼내오기
	      String userNo=map.get("userNo");	      
	      String boardNo=map.get("boardNo");	      
	      String commentDetailText=map.get("commentDetailText");
	      
	      //Comment 도메인에 set
	      Comment comment=new Comment();
	      
	      comment.setUser(userService.getUser2(userNo));
	      comment.setBoard(boardService.getBoard(boardNo));
	      comment.setCommentDetailText(commentDetailText);
	      
	      boardService.addComment(comment);
	      
	      return 1;
	   }

	   

	   @RequestMapping(value="json/listComment/{boardNo}", method=RequestMethod.GET)
	   public List<Comment> getCommentList(@PathVariable String boardNo) throws Exception{
	      System.out.println("/listComment GET");
	      System.out.println("boardNo : "+boardNo);
	      
	      List<Comment> list = boardService.listComment(boardNo);

	      System.out.println("list : "+list);
	      
	      return list;
	   }

	   
	   /*댓글 수정 : start
	   @RequestMapping(value="/rest/updateComment", method=RequestMethod.POST)
	   public int updateComment(@ModelAttribute("comment") Comment comment) throws Exception{
	      
	      System.out.println("/rest/updateComment : POST");
	      System.out.println("comment : "+comment);
	      
	      commentService.updateComment(comment);
	      
	      return 1;
	   }
	   댓글 수정 : start*/
	   

	   @RequestMapping(value="json/deleteComment/{commentNo}", method=RequestMethod.GET)
	   public int deleteComment(@PathVariable String commentNo) throws Exception{
		   
	      System.out.println("deleteComment GET");
	      
	      System.out.println("commentNo : "+commentNo);
	      
	      boardService.deleteComment(commentNo);
	      
	      return 1;
	   }

	   /*대댓글 등록
	   @RequestMapping(value="/rest/addReComment/{targetNo}", method=RequestMethod.POST)
	   public int addReComment(@PathVariable("targetNo") int targetNo, @RequestBody Comment comment ) throws Exception{
	      System.out.println("/rest/addReComment : POST");
	      
	      System.out.println("comment : "+comment);
	      
	      comment.setViewCondition("DEF");
	      comment.setCommentComuNo(comment.getCommentComuNo());
	      comment.setCommentWriterId(comment.getCommentWriterId());
	      comment.setCommentDetail(comment.getCommentDetail());
	      comment.setTargetNo(targetNo);
	      
	      System.out.println("comment : "+comment);
	      commentService.addReComment(comment);
	      System.out.println("comment11 : " + comment);

	      return 1;
	   }*/


	
	

}
