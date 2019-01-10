package com.zagle.service.board.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zagle.service.board.BoardService;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })

public class BoardServiceTest {
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Test
	public void testAddBoard() throws Exception{
		
		User user=new User();
		user.setUserNo("US10001");
		
		Board board=new Board();
		board.setUser(user);
		board.setBoardDetailText("JUnit 테스트");
		board.setHashTag("#해시태그#테스트");
		board.setUserTheme("themeTest.jpg");
		board.setPhoto1("1111.jpg");
		board.setPhoto2("222.jpg");
		board.setPhoto3("333.jpg");
		board.setAddress("서울시 동작구 사당동 1111-222");
		board.setCoord("33.45046098229819,126.57697044204765");
		board.setBoardStatus("1");
		
		boardService.addBoard(board);
	}

}
