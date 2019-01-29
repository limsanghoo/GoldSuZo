package com.zagle.service.admin.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


import com.zagle.service.admin.AdminDao;
import com.zagle.service.admin.AdminService;

import com.zagle.service.domain.BlackList;
import com.zagle.service.domain.Blind;

import com.zagle.service.domain.Report;
import com.zagle.service.domain.SearchAdmin;
import com.zagle.service.domain.User;

@Service("adminServiceImpl")
public class AdminServiceImpl implements AdminService {
	
	///Field
	@Autowired
	@Qualifier("adminDAOImpl")
	private AdminDao adminDao;
	
	public AdminServiceImpl() {
		System.out.println(this.getClass());
	}
	
	
	
	
	@Override
	public Map<String, Object> listBlackObject(SearchAdmin search) throws Exception {
		
		List<User> list = adminDao.listBlackObject(search);
		int totalCount = adminDao.getTotalCount2(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public Map<String, Object> listBlackList(SearchAdmin search) throws Exception {
		
		List<BlackList> list = adminDao.listBlackList(search);
		int totalCount = adminDao.getTotalCount3(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount",  new Integer(totalCount));
		
		return map;
	}
	
	public Map<String, Object> getReportList(SearchAdmin search) throws Exception {
		
		List<Report> list = adminDao.getReportList(search);
		int totalCount = adminDao.getTotalCount4(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
		
	}
	
	public Map<String, Object> getBlindList(SearchAdmin search) throws Exception {
		
		
		List<Blind> list = adminDao.getBlindList(search);
		int totalCount = adminDao.getTotalCountBlind(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public void addReport(Report report) throws Exception {
		
		
		adminDao.addReport(report);
		
		//int reportCount = adminDao.checkReportCount(report);
		
		//System.out.println("ReportCount"+reportCount);
		
	}
	
	@Override
	public void updateReport(Report report) throws Exception {
		
		
		adminDao.updateReport(report);
	}

	@Override
	public Map<String, Object> listUser(SearchAdmin search) throws Exception {
		
		List<User> list = adminDao.listUser(search);
		int totalCount = adminDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	public Blind getBlind(String blindNo) throws Exception {
		return adminDao.getBlind(blindNo);
	}
	
	public void addBlind(Blind blind) throws Exception {
		
		adminDao.addBlind(blind);
	}
	
	public void updateBlind(Blind blind) throws Exception {
		
		adminDao.updateBlind(blind);
	}
	
	
	
//	@Override
//	public void addBlind2(Comment comment) throws Exception {
//		// TODO Auto-generated method stub
//		
//	}

//	@Override
//	public void cancelBlind(Blind blind) throws Exception {
//		
//		adminDao.cancelBlind(blind);
//	}

//	@Override
//	public void cancelComment(Comment comment) throws Exception {
//		// TODO Auto-generated method stub
//		
//	}

//	@Override
//	public void deleteBlind(Blind blind) throws Exception {
//		
//		adminDao.deleteBlind(blind);
//	}

//	@Override
//	public void delteBlind2(Comment comment) throws Exception {
//
//		adminDao.deleteBlind2(comment);
//	}

	public int checkReportCount(Report report) throws Exception {
		
		return adminDao.checkReportCount(report);
	}
	
	public void addBlackList(BlackList blackList) throws Exception {
		
		adminDao.addBlackList(blackList);
	}

	public void updateBlackCheckCode(BlackList blackList) throws Exception {
		
		adminDao.updateBlackCheckCode(blackList);
	}
}
