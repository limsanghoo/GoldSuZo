package com.zagle.service.mypage.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zagle.common.Search;
import com.zagle.service.board.BoardService;
import com.zagle.service.domain.SearchBoard;
import com.zagle.service.domain.SearchMypage;
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
	
	

	//@Test
	public void testAddAccount() throws Exception {
		
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
	//@Test
	public void testUpdateAccount() throws Exception {
		
		User user = userService.getUser2("US10004");
		
		System.out.println(user);
		
		Assert.assertEquals("Kakao", user.getUserNickname());
		
		user.setAccount("1111111111111");
		user.setBankName("기업은행");
		
		mypageService.updateAccount(user);
		Assert.assertNotNull(user);
		
		user = userService.getUser2("US10004");
				
		Assert.assertEquals("1111111111111", user.getAccount());
		Assert.assertEquals("기업은행", user.getBankName());
		
	}
	//@Test
	public void testListCommnet() throws Exception {
		
		SearchMypage search = new SearchMypage();
		
		System.out.println("============listCommnet Test===============");
		
		User user = userService.getUser2("US10000");
		search.setMyUser(user);
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		Map<String, Object> map = mypageService.listComment(search);
		
		List<Object> list = (List<Object>)map.get("list");
				
		//Assert.assertEquals(2, list.size());
		
		System.out.println(list);
		System.out.println(list.size());
		
		//Integer totalCount = (Integer)map.get("totalCount");
		//System.out.println(totalCount);
		
	}
	@Test
	public void testLikeList() throws  Exception{
		
		SearchMypage search = new SearchMypage();
		
		System.out.println("=====================LikeList start===================");
		
		User user = userService.getUser2("US10004");
		
		search.setMyUser(user);
		
		Map<String, Object> map = mypageService.listLike(search);
		
		List<Object> list = (List<Object>)map.get("list");
		
		System.out.println(list);
		System.out.println(list.size());
	}
	//@Test
	public void testListScrap() throws Exception {
		
		SearchMypage search = new SearchMypage();
		
		System.out.println("=======testListScrap=======");
		
		User user = userService.getUser2("US10004");
		search.setMyUser(user);
		
		Map<String, Object> map = mypageService.listScrap(search);
		List<Object> list = (List<Object>)map.get("list");
		
		System.out.println(list);
		System.out.println(list.size());
	}
	//@Test
	public void testListMyBoard() throws Exception {
		
		SearchMypage search = new SearchMypage();
		
		System.out.println("===============MYBOARD============");
		
		User user  = userService.getUser2("US10003");
		search.setMyUser(user);
		
		Map<String, Object> map = mypageService.listMyBoard(search);
		List<Object> list = (List<Object>)map.get("list");
		
		System.out.println(list);
		System.out.println(list.size());
		
	}
	
}
	

