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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateReport(Report report) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> listUser(SearchAdmin search) throws Exception {
		
		List<User> list = adminDao.listUser(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}

	@Override
	public void addBlind(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addBlind2(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void cancelBlind(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void cancelComment(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBlind(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delteBlind2(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void checkBlack(User BlackCode) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
