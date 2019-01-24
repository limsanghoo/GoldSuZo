package com.zagle.service.admin.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


import com.zagle.service.admin.AdminDao;
import com.zagle.service.domain.BlackList;
import com.zagle.service.domain.Blind;
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
	
		return sqlSession.selectList("UserMapper.listBlackObject", search);
	}

	@Override
	public List<BlackList> listBlackList(SearchAdmin search) throws Exception {
	
		return sqlSession.selectList("BlackListMapper.listBlackList", search);
	}
	@Override
	public List<User> listUser(SearchAdmin search) throws Exception {
		
		return sqlSession.selectList("UserMapper.listUser", search);
	}
	
	public void addReport(Report report) throws Exception {
		
		sqlSession.insert("AdminMapper.addReport", report);
	}
	
	@Override
	public void updateReport(Report report) throws Exception {
		
		
		sqlSession.update("AdminMapper.updateReport", report);
	}

	@Override
	public void addBlind(Blind blind) throws Exception {
		
		
		sqlSession.insert("AdminMapper.addBlind", blind);
	}

	//@Override
	//public void addBlind2(Blind blind) throws Exception {
		// TODO Auto-generated method stub
		
	//}

	@Override
	public void cancelBlind(Blind blind) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("AdminMapper.cancelBlind", blind);
	}

//	@Override
//	public void cancelBlind2(Comment comment) throws Exception {
//		// TODO Auto-generated method stub
//		
//	}

	@Override
	public void deleteBlind(Blind blind) throws Exception {
		
		sqlSession.update("AdminMapper.deleteBlind", blind);
	}

//	@Override
//	public void deleteBlind2(Comment commnet) throws Exception {
//		// TODO Auto-generated method stub
//		
//	}

	@Override
	public void checkBlack(User blackCode) throws Exception {
		sqlSession.selectOne("AdminMapper.checkBlack", blackCode);
		
	}
	
	public int getTotalCount(SearchAdmin search) throws Exception {
		
		return sqlSession.selectOne("AdminMapper.getTotalCount", search);
	}
	
}
