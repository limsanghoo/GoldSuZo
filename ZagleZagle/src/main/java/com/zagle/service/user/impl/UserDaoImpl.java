package com.zagle.service.user.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


import com.zagle.service.domain.User;
import com.zagle.service.user.UserDao;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessonTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	public void addUser(User user) throws Exception {
	sqlSession.insert("UserMapper.addUser", user);	
	}

	public User getUser(String userNo) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", userNo);
	}
	
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
	}
	
	public void addActiveScore(User user) throws Exception {
	sqlSession.update("UserMapper.updateAddActiveScore", user);
	}
	
	// 게시판 Page 처리를 위한 전체 Row(totalCount)  return
	//public int getTotalCount(Search search) throws Exception {
	//	return sqlSession.selectOne("UserMapper.getTotalCount", search);
	//}
}
