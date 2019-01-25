package com.zagle.web.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.zagle.service.admin.AdminService;
import com.zagle.service.domain.Report;

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
	
	@RequestMapping( value="json/getReport/{userNo}" , method=RequestMethod.GET)
	public Report getReport(@PathVariable String userNo) throws Exception {
		
		System.out.println("/admin/json/getReport : GET ");
		
		return adminService.getReport(userNo);
	}
}

