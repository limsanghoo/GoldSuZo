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
	
	@Override
	public List<Report> getReportList(SearchAdmin search) throws Exception {
		
		return sqlSession.selectList("ReportMapper.getReportList", search);
	}
	
	public void addReport(Report report) throws Exception {
		
		sqlSession.insert("ReportMapper.addReport", report);
	}
	public Blind getBlind(String blindNo) throws Exception {
		return sqlSession.selectOne("BlindMapper.getBlind", blindNo);
	}
	
	public List<Blind> getBlindList(SearchAdmin search) throws Exception {
		
		return sqlSession.selectList("BlindMapper.getBlindList", search);
	}
	
	@Override
	public void updateReport(Report report) throws Exception {
		
		
		sqlSession.update("ReportMapper.updateReport", report);
	}

	@Override
	public void addBlind(Blind blind) throws Exception {
		
		
		sqlSession.insert("BlindMapper.addBlind", blind);
	}

	//@Override
	//public void addBlind2(Blind blind) throws Exception {
		// TODO Auto-generated method stub
		
	//}
	
	public void updateBlind(Blind blind) throws Exception {
		
		sqlSession.update("BlindMapper.updateBlind", blind);
	}
	
//	@Override
//	public void cancelBlind(Blind blind) throws Exception {
//		// TODO Auto-generated method stub
//		sqlSession.update("AdminMapper.cancelBlind", blind);
//	}

//	@Override
//	public void cancelBlind2(Comment comment) throws Exception {
//		// TODO Auto-generated method stub
//		
//	}

//	@Override
//	public void deleteBlind(Blind blind) throws Exception {
//		
//		sqlSession.update("AdminMapper.deleteBlind", blind);
//	}

//	@Override
//	public void deleteBlind2(Comment commnet) throws Exception {
//		// TODO Auto-generated method stub
//		
//	}


	public int getTotalCount(SearchAdmin search) throws Exception {
		
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}
	public int getTotalCount2(SearchAdmin search) throws Exception {
		
		return sqlSession.selectOne("UserMapper.getTotalCount2", search);
	}
	public int getTotalCount3(SearchAdmin search) throws Exception {
		
		return sqlSession.selectOne("BlackListMapper.getTotalCount3", search);
	}
	
	public void addBlackList(BlackList blackList) throws Exception {
		
		sqlSession.insert("BlackListMapper.addBlackList", blackList);
	}
	public Report getReport(SearchAdmin search) throws Exception {
		
		return sqlSession.selectOne("ReportMapper.getReportList", search);
	}

	@Override
	public int getTotalCount4(SearchAdmin search) throws Exception {
		
		return sqlSession.selectOne("ReportMapper.getTotalCount4", search);
	}
	
	public int getTotalCountBlind(SearchAdmin search) throws Exception {
		
		return sqlSession.selectOne("BlindMapper.getTotalCountBlind", search);

	}
	
	
	
}
