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
import com.zagle.service.domain.SearchAdmin;

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
	
	

	@Test
	public void testListUser() throws Exception {
		
		SearchAdmin search = new SearchAdmin();
		search.setCurrentPage(1);
		search.setPageSize(3);
		
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



}
