package com.zagle.service.admin.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zagle.service.admin.AdminService;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Report;
import com.zagle.service.domain.SearchAdmin;
import com.zagle.service.domain.User;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)


@ContextConfiguration (locations = {	"classpath:config/context-common.xml",
																"classpath:config/context-aspect.xml",
																"classpath:config/context-mybatis.xml",
																"classpath:config/context-transaction.xml" })




	public class AdminServiceTest {
	
	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminService;
	
	
	//@Test
	public void testListUser() throws Exception {
		
		SearchAdmin search = new SearchAdmin();
		search.setCurrentPage(1);
		search.setPageSize(10);
		
		System.out.println("====================listUser====================");
		
		Map<String, Object> map = adminService.listUser(search);
		
		List<Object> list = (List<Object>) map.get("list");
		
		Assert.assertEquals(3, list.size());
		
		System.out.println("List 확인 :"+list);
		System.out.println("사이즈 확인 :"+list.size());
		
		System.out.println("==============================================");
		
		Integer totalCount = (Integer) map.get("totalCount");
		
		System.out.println(totalCount);
		
		System.out.println("==============================================");
		
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("0");
		search.setSearchKeyword("");
		map = adminService.listUser(search);
		
		list = (List<Object>)map.get("list");
		Assert.assertEquals(3, list.size());
		
		totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);
		
	}
	//@Test
	public void testListBlackObject() throws Exception {
		
		SearchAdmin search = new SearchAdmin();
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		
		System.out.println("====================listBlackObject====================");
		
		Map<String, Object> map = adminService.listBlackObject(search);
		
		List<Object> list = (List<Object>) map.get("list");
		
		Assert.assertEquals(3, list.size());
		
		System.out.println("List 확인 :"+list);
		System.out.println("사이즈 확인 :"+list.size());
		
		System.out.println("==============================================");
		
		/*
		Integer totalCount = (Integer) map.get("totalCount");
		
		System.out.println(totalCount);
		
		System.out.println("==============================================");
		
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("0");
		search.setSearchKeyword("");
		map = adminService.listBlackObject(search);
		
		list = (List<Object>)map.get("list");
		Assert.assertEquals(3, list.size());
		
		totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);
		*/
	}
	@Test
	public void testlistBlackList() throws Exception {
		
		SearchAdmin search = new SearchAdmin();
		//search.setCurrentPage(1);
		//search.setPageSize(3);
		
		
		System.out.println("====================listBlackList====================");
		
		Map<String, Object> map = adminService.listBlackList(search);
		
		List<Object> list = (List<Object>) map.get("list");
		
		//Assert.assertEquals(3, list.size());
		
		System.out.println("List 확인 :"+list);
		System.out.println("사이즈 확인 :"+list.size());
		
		System.out.println("==============================================");

	}

	//@Test
	public void testAddReport() throws Exception {
		
		System.out.println("=======================addRport========================");
		
		Report report = new Report();

		Board board = new Board();
		
		board.setBoardNo("BD10040");
		
		User user = new User();
		user.setUserNo("US10004");
		
		User user01 = new User();
		user01.setUserNo("US10003");
		
		report.setHandleCode('0');
		report.setReportedBoard(board);
		report.setReportingUserNo(user);
		report.setReportedUserNo(user01);
		report.setReportReason("욕설");
		report.setReportNo("RP10000");
		
		adminService.addReport(report);
		
		report.getReportNo();
		
		Assert.assertEquals("RP10000", report.getReportNo());;
	}


}
