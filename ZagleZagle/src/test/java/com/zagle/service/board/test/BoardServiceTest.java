package com.zagle.service.board.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zagle.service.board.BoardService;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.User;
import com.zagle.service.user.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })

public class BoardServiceTest {
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	//@Test
	public void testAddBoard() throws Exception{
		
		User user=new User();
		user.setUserNo("US10020");
		
		Board board=new Board();
		
		String finalFileName="aaa.jpg,bbb.jpg,ccc.jpg";
		
		String[] photo=finalFileName.split(",");
        
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

		board.setUser(user);
		board.setBoardDetailText("JUnit 테스트");
		board.setHashTag("#해시태그#테스트");
		board.setUserTheme("themeTest.jpg");
		board.setAddress("서울시 동작구 사당동 1111-222");
		board.setCoord("33.45046098229819,126.57697044204765");
		board.setBoardStatus("1");
		
		boardService.addBoard(board);
	}
	
	@Test
	public void addComment() throws Exception{
		
		User user=new User();
		user.setUserNo("US10027");
		//user=userService.getUser2(user.getUserNo());
		
		Board board=new Board();
		board.setBoardNo("BD10049");
		
		Comment comment=new Comment();
		comment.setBoard(board);
		comment.setUser(user);
		comment.setCommentDetailText("댓글댓글댓글");
		
		boardService.addComment(comment);
			
	}

}
