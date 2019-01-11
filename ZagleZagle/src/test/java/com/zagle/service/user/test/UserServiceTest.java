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
	
	@Test
	public void testAddUser() throws Exception {
		
		User user = new User();
		user.setUserNo("US10003");
		user.setUserName("임상후");
		user.setPhone("01012345678");
		user.setUserNickname("Joey");
		user.setUserBirth(20001231);
		user.setUserSex("남");
		user.setUserAddr("서울시 성동구 상원길38-1");
		user.setSnsNo("00100");
		user.setSnsName("Google");
		
		userService.addUser(user);
		
		user = userService.getUser("US10003");
		
		
		Assert.assertEquals("US10005", user.getUserNo());
		Assert.assertEquals("임상후", user.getUserName());
		Assert.assertEquals("01012345678", user.getPhone());
		
		
	}


}
