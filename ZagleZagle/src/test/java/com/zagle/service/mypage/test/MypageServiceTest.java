package com.zagle.service.mypage.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zagle.service.board.BoardService;
import com.zagle.service.domain.User;
import com.zagle.service.mypage.MypageService;
import com.zagle.service.user.UserService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)


@ContextConfiguration (locations = {	"classpath:config/context-common.xml",
																"classpath:config/context-aspect.xml",
																"classpath:config/context-mybatis.xml",
																"classpath:config/context-transaction.xml" })



public class MypageServiceTest {
	@Autowired
	@Qualifier("mypageServiceImpl")
	private MypageService mypageService;
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	

	@Test
	public void addAccount() throws Exception {
		
		User user = userService.getUser2("US10004");
		
		System.out.println(user);
		
		Assert.assertNotNull(user);
		Assert.assertEquals("Kakao", user.getUserNickname());
		
		user.setAccount("110406555105");
		user.setBankName("신한은행");
		
		mypageService.addAccount(user);
		Assert.assertNotNull(user);
		
		user = userService.getUser2("US10004");
		
		Assert.assertEquals("110406555105", user.getAccount());
		Assert.assertEquals("신한은행", user.getBankName());
		
	}
	
}
	

