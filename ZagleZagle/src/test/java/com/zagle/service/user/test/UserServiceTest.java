package com.zagle.service.user.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zagle.service.domain.User;
import com.zagle.service.user.UserService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)


@ContextConfiguration (locations = {	"classpath:config/context-common.xml",
																"classpath:config/context-aspect.xml",
																"classpath:config/context-mybatis.xml",
																"classpath:config/context-transaction.xml" })
														
public class UserServiceTest {
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	//@Test
	public void testAddUser() throws Exception {
		
		User user = new User();
		user.setUserNo("US10007");
		user.setSnsNo("G10001");
		user.setUserName("임상후2");
		user.setUserNickname("Joey");
	
		user.setUserAddr("서울시 성동구 상원길38-1");
		//user.setProfile("cat.jpg");
		user.setGrade("0");
	
		//user.setBankName("신한은행");
		user.setUserBirth(20001231);
		//user.setAccount("110406555105");
		
		
		
		
		
		userService.addUser(user);
		
		user = userService.getUser("US10007");
		
		
		Assert.assertEquals("US10007", user.getUserNo());
		Assert.assertEquals("임상후2", user.getUserName());

		
		
	}
	
	//@Test
	public void testGetUser() throws Exception {
		
		User user = new User();
		
		user = userService.getUser("K@983695032");
		
		Assert.assertEquals("나", user.getUserName());
	}
	
	//@Test
	public void testUpdateUser() throws Exception {
		
		User user = userService.getUser(" K@983695032");
		
		Assert.assertNotNull(user);
		
		Assert.assertEquals("Joey", user.getUserNickname());
		
		user.setUserName("림상후");
		
	
		user.setUserNickname("LimStrop");
		user.setUserBirth(19900101);

		user.setUserAddr("서울시 서초구 비트캠프");
		user.setProfile("ssibal.jpg");
		
		
		userService.updateUser(user);
		
		user = userService.getUser("US10005");
		Assert.assertNotNull(user);
	}
	@Test
	public void testGetUser2() throws Exception {
		User user = new User();
		
		user = userService.getUser2("US10004");
		
		System.out.println(user);
		
		//Assert.assertEquals("림상후", user.getUserName());
	}
	
	

}
