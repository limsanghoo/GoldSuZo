package com.zagle.service.user.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zagle.service.domain.SearchAdmin;
import com.zagle.service.domain.User;
import com.zagle.service.user.UserDao;

@Repository("userDAOImpl")
public class UserDaoImpl implements UserDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
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

	public User getUser(String snsNo) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", snsNo);
	}
	public User getUser2(String userNo) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser2", userNo);
	}
	public User getUser3(String userName) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser3", userName);
	}
	
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
	}
	
	public void addActiveScore(User user) throws Exception {
	sqlSession.update("UserMapper.updateAddActiveScore", user);
	}
	public void updateDeleteCount(User user) throws Exception {
		sqlSession.update("UserMapper.updateDeleteCount", user);
	}
	public void updateGrade(User user) throws Exception {
		sqlSession.update("UserMapper.updateGrade", user);
	}
	
	// �Խ��� Page ó���� ���� ��ü Row(totalCount)  return
	public int getTotalCount(SearchAdmin search) throws Exception {
	return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}
	public int checkNickname(User user) throws Exception {
		return sqlSession.selectOne("UserMapper.checkNickname", user);
	}
}
