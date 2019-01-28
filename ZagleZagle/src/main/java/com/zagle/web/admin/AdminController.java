package com.zagle.web.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.zagle.common.Page;
import com.zagle.service.admin.AdminService;
import com.zagle.service.domain.SearchAdmin;

//===>Admin Controller
@Controller
@RequestMapping("/admin/*")
public class AdminController {

	///Field
	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminService;
	
	public AdminController() {
		
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="listUser")
	public ModelAndView listUser(@ModelAttribute("SearchAdmin") SearchAdmin search, HttpServletRequest request) throws Exception {
		
		System.out.println("/admin/listUser : GET/POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = adminService.listUser(search);
		
		System.out.println(search.getCurrentPage());
		System.out.println(pageUnit);
		System.out.println(pageSize);
		
		System.out.println(map.get("totalCount"));
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	    System.out.println(resultPage);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search",search);
		modelAndView.setViewName("/view/admin/listUser.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="listBlackObject")
	public ModelAndView listBlackObject(@ModelAttribute("SearchAdmin") SearchAdmin search, HttpServletRequest request) throws Exception {
		
		System.out.println("/admin/listBlackObject : GET/POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = adminService.listBlackObject(search);
		
		System.out.println(search.getCurrentPage());
		System.out.println(pageUnit);
		System.out.println(pageSize);
		
		System.out.println(map.get("totalCount"));
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	    System.out.println(resultPage);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search",search);
		modelAndView.setViewName("/view/admin/listBlackObject.jsp");
		
		return modelAndView;
		
		
	}
	@RequestMapping(value="listBlackList")
	public ModelAndView listBlackList(@ModelAttribute("SearchAdmin") SearchAdmin search, HttpServletRequest request) throws Exception {
		
		System.out.println("============================listBlackList START============================");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = adminService.listBlackList(search);
		
		System.out.println(search.getCurrentPage());
		System.out.println(pageUnit);
		System.out.println(pageSize);
		
System.out.println(map.get("totalCount"));
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	    System.out.println(resultPage);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search",search);
		modelAndView.setViewName("/view/admin/listBlackList.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value="handleReport")
	public ModelAndView handelReport(@ModelAttribute("SearchAdmin") SearchAdmin search, HttpServletRequest request) throws Exception {
		
		System.out.println("/admin/handelReport : GET, POST ");

		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		
		Map<String, Object> map = adminService.getBlindList(search);
		
		
		
		System.out.println(search.getCurrentPage());
		System.out.println(pageUnit);
		System.out.println(pageSize);
		
		System.out.println(map.get("totalCount"));
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	    System.out.println(resultPage);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search",search);
		modelAndView.setViewName("/view/admin/handleReport.jsp");
		
		return modelAndView;
	}
	
}

