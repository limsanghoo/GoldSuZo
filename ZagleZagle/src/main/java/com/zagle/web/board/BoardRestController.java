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
	
	 /*댓글등록 : start*/
	  /*@RequestMapping(value="/rest/addComment/{communityNo}", method=RequestMethod.POST)
	   public int addComment(@PathVariable("boardNo") int communityNo, @RequestBody Comment comment) throws Exception{
	      System.out.println("CommentRestController/addComment():POST 실행==========================");
	      
	      comment.setViewCondition("DEF");
	      comment.setCommentComuNo(communityNo);
	      comment.setCommentWriterId(comment.getCommentWriterId());
	      comment.setCommentDetail(comment.getCommentDetail());
	      
	      commentService.addComment(comment);
	      
	      System.out.println("comment : "+comment);
	      
	      return 1;
	   }*/
	   //댓글등록 : end
	   
	  /* 댓글 리스트 : start
	   @RequestMapping(value="/rest/getCommentList/{communityNo}", method=RequestMethod.GET)
	   public List<Comment> getCommentList(@PathVariable int communityNo) throws Exception{
	      System.out.println("/rest/listComment/ : GET");
	      System.out.println("communityNo : "+communityNo);
	      
	      List<Comment> list = commentService.getCommentList(communityNo);
	      System.out.println("list : "+list);
	      return list;
	   }
	   댓글 리스트 : end
	   
	   댓글 수정 : start
	   @RequestMapping(value="/rest/updateComment", method=RequestMethod.POST)
	   public int updateComment(@ModelAttribute("comment") Comment comment) throws Exception{
	      
	      System.out.println("/rest/updateComment : POST");
	      System.out.println("comment : "+comment);
	      
	      commentService.updateComment(comment);
	      
	      return 1;
	   }
	   댓글 수정 : start
	   
	   댓글 삭제 : start
	   @RequestMapping(value="/rest/deleteComment/{commentNo}", method=RequestMethod.GET)
	   public int deleteReply(@PathVariable int commentNo) throws Exception{
	      System.out.println("/rest/deleteComment : GET");
	      Comment comment = new Comment();
	      commentService.getComment(commentNo);
	      commentService.updateViewCondition(commentNo);
	      System.out.println("comment : "+comment);
	      
	      return 1;
	   }
	   댓글 삭제 : end
	   
	   대댓글 등록 : start
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
	   }
	   대댓글 등록 : end*/

	
	

}
