package com.zagle.service.mypage.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zagle.common.Search;
import com.zagle.service.domain.User;
import com.zagle.service.mypage.MypageDao;

@Repository("mypageDaoImpl")
public class MypageDaoImpl implements MypageDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessonTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public MypageDaoImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	public void addAccount(User user) throws Exception {
		sqlSession.update("MypageMapper.addAccount", user);
	}
	
	public void updateAccount(User user) throws Exception {
		sqlSession.update("MypageMapper.updateAccount", user);
	}
	
	public User getAccountCheck(String userNo) throws Exception {
		
		return sqlSession.selectOne("MypageMapper.getAccountCheck",  userNo);
	}
	
	public List<Comment> commentList(Search search) throws Exception {
		return sqlSession.selectList("MypageMapper.commentList", search);
	}
	
	public List<Like> likeList(Search search) throws Exception {
		return sqlSession.selectList("MypageMapper.listLike", search);
	}
	
	public List<Scrap> ScrapList(Search search) throws Exception {
		return sqlSession.selectList("MypageMapper.listScrap", search);
	}
	

	public int getTotalCount(Search search) throws Exception {
		
		return sqlSession.selectOne("MypageMapper.getTotalCount", search);
	}
	

}
