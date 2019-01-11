package com.zagle.service.board.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zagle.service.board.RestBoardDAO;

@Repository("daumRestDAOImpl")
public class DaumRestDAOImpl implements RestBoardDAO{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void shareBoard(String boardNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Object addBoardVisionTag(String url) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addBoardDaumMap() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void listMap() throws Exception {
		// TODO Auto-generated method stub
		
	}

}
