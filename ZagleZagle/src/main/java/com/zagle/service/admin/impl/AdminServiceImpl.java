package com.zagle.service.admin.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zagle.common.Search;
import com.zagle.service.admin.AdminDao;
import com.zagle.service.admin.AdminService;
import com.zagle.service.domain.Admin;
import com.zagle.service.domain.BlackList;
import com.zagle.service.domain.Blind;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
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
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}

	@Override
	public Map<String, Object> listBlackList(SearchAdmin search) throws Exception {
		
		List<BlackList> list = adminDao.listBlackList(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}

	public void addReport(Report report) throws Exception {
		
		adminDao.addReport(report);
	}
	
	@Override
	public void updateReport(Report report) throws Exception {
		
		
		adminDao.updateReport(report);
	}

	@Override
	public Map<String, Object> listUser(SearchAdmin search) throws Exception {
		
		List<User> list = adminDao.listUser(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}
	
	public void addBlind(Blind blind) throws Exception {
		
		adminDao.addBlind(blind);
	}
	
//	@Override
//	public void addBlind2(Comment comment) throws Exception {
//		// TODO Auto-generated method stub
//		
//	}

	@Override
	public void cancelBlind(Blind blind) throws Exception {
		
		adminDao.cancelBlind(blind);
	}

//	@Override
//	public void cancelComment(Comment comment) throws Exception {
//		// TODO Auto-generated method stub
//		
//	}

	@Override
	public void deleteBlind(Blind blind) throws Exception {
		
		adminDao.deleteBlind(blind);
	}

//	@Override
//	public void delteBlind2(Comment comment) throws Exception {
//
//		adminDao.deleteBlind2(comment);
//	}

	@Override
	public void checkBlack(User BlackCode) throws Exception {
		// TODO Auto-generated method stub
		
		adminDao.checkBlack(BlackCode);
	}

}
