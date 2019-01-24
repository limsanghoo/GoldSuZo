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
import com.zagle.service.domain.BlackList;
import com.zagle.service.domain.Blind;
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
		search.setPageSize(5);
		
		
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
	//@Test
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
		User reportingUserNo = new User();
		reportingUserNo.setUserNo("US10004");
		
		User reportedUserNo = new User();
		reportedUserNo.setUserNo("US10027");
		
		Board reportedBoard = new Board();
		reportedBoard.setBoardNo("BD10038");
		
		
		report.setReportNo("RP10002");
		report.setReportingUserNo(reportingUserNo);
		report.setReportedUserNo(reportedUserNo);
		report.setReportedBoard(reportedBoard);
		report.setReportReason("테스트용");
	
		

		adminService.addReport(report);
		
		
		Assert.assertEquals("RP10000", report.getReportNo());;
	}
	//@Test
	public void testAddBlackList() throws Exception {
		
		System.out.println("==================AddBlackList=====================");
		
		BlackList bl = new BlackList();
		
		User blackUser = new User();
		blackUser.setUserNo("US10004");
		
		bl.setBlackNo("BK10002");
	
		bl.setBlackUser(blackUser);
		bl.setBanReason("욕설");
		
		adminService.addBlackList(bl);
		
		Assert.assertEquals("BK10002", bl.getBlackNo());;
		
	}
	//@Test
	public void testUpdateReport() throws Exception {
		
		System.out.println("====================UpdateReport==================");
		
		Report report = new Report();
		report.setReportNo("RP10001");
		report.setHardleNo(1);
		
		System.out.println("report :"+report);
		
		adminService.updateReport(report);
		
		System.out.println("update 후 report : "+report);
		
		System.out.println(report.getHardleNo());

		Assert.assertNotNull(report);
		
	}
	//@Test
	public void testAddBlind() throws Exception {
		
		System.out.println("===================testAddBlind===================");
		
		Blind blind = new Blind();
		Board blindBoardNo = new Board();
		blindBoardNo.setBoardNo("BD10040");
		
		blind.setBlindNo("BL10000");
		blind.setBlindBoardNo(blindBoardNo);
		blind.setBlindCode("1");
		
		adminService.addBlind(blind);
		
	
		Assert.assertEquals("BL10000", blind.getBlindNo());
	}
	//@Test
	public void testUpdateBlind() throws Exception {
		
		System.out.println("===============updateBlindCode============");
		
		Blind blind = new Blind();
		blind.setBlindNo("BL10000");
		blind.setBlindCode("1");
		
		adminService.updateBlind(blind);
		
		System.out.println(blind);
		
		Assert.assertEquals("1", blind.getBlindCode());
		
	}
}
