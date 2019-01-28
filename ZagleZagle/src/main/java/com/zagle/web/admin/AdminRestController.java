package com.zagle.web.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.zagle.service.admin.AdminService;
import com.zagle.service.domain.Report;
import com.zagle.service.domain.SearchAdmin;
import com.zagle.service.domain.User;

@RestController
@RequestMapping("/admin/*")

public class AdminRestController {

	///Field
	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminService;
	
	
	public AdminRestController() {
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping( value="json/getReportList/{userNo}" , method=RequestMethod.GET)
	public List getReport(@PathVariable String userNo) throws Exception {
		
		System.out.println("/admin/json/getReporList : GET ");
		
		System.out.println(userNo);
		
		
		SearchAdmin search = new SearchAdmin();
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		
		User user = new User();
		user.setUserNo(userNo);
		
		Report checkReport = new Report();
		checkReport.setReportedUserNo(user);
		
		System.out.println(checkReport);
		
		search.setCheckReport(checkReport);
		
	
		
		Map<String, Object> map = adminService.getReportList(search);

		List<Object> list = (List<Object>) map.get("list");
		
		
		
		System.out.println("리스트 값 :"+list);
		
		return list;
	}

}

