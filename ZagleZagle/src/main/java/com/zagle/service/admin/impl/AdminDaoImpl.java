package com.zagle.service.admin.impl;

import java.util.List;

import com.zagle.common.Search;
import com.zagle.service.admin.AdminDao;
import com.zagle.service.domain.BlackList;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Report;
import com.zagle.service.domain.User;

public class AdminDaoImpl implements AdminDao {

	@Override
	public List<User> listBlackObject(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BlackList> listBlackList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateReport(Report report) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addBlind(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addBlind(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void cancelBlind(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void cancelBlind2(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBlind(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBlind2(Comment commnet) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void checkBlack(User BlackCode) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
}
