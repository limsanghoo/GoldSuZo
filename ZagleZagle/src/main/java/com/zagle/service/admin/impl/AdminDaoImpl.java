package com.zagle.service.admin.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


import com.zagle.service.admin.AdminDao;
import com.zagle.service.domain.BlackList;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Report;
import com.zagle.service.domain.SearchAdmin;
import com.zagle.service.domain.User;

@Repository("adminDAOImpl")
public class AdminDaoImpl implements AdminDao {

	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public AdminDaoImpl() {
		
		System.out.println(this.getClass());
	}
	
	
	@Override
	public List<User> listBlackObject(SearchAdmin search) throws Exception {
	
		return null;
	}

	@Override
	public List<BlackList> listBlackList(SearchAdmin search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<User> listUser(SearchAdmin search) throws Exception {
		
		return sqlSession.selectList("AdminMapper.listUser", search);
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
