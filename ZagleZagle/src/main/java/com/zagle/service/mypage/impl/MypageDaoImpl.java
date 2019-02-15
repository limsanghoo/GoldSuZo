package com.zagle.service.mypage.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zagle.common.Search;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Like;
import com.zagle.service.domain.Scrap;
import com.zagle.service.domain.SearchBoard;
import com.zagle.service.domain.SearchMypage;
import com.zagle.service.domain.User;
import com.zagle.service.mypage.MypageDao;

@Repository("mypageDAOImpl")
public class MypageDaoImpl implements MypageDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
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
	
	public User checkAccount(User user) throws Exception {
		
		return sqlSession.selectOne("MypageMapper.checkAccount",  user);
	}
	
	
	public List<Comment> commentList(SearchMypage search) throws Exception {
		return sqlSession.selectList("MypageMapper.commentList", search);
	}
	
	public List<Like> likeList(SearchMypage search) throws Exception {
		return sqlSession.selectList("MypageMapper.listLike", search);
	}
	
	public List<Scrap> ScrapList(SearchMypage search) throws Exception {
		return sqlSession.selectList("MypageMapper.listScrap", search);
	}
	
	public List<Board> MyBoardList(SearchMypage search) throws Exception {
		
		return sqlSession.selectList("MypageMapper.listMyBoard", search);
	}
	public int getTotalScrapList(SearchMypage search) throws Exception {
		
		return sqlSession.selectOne("MypageMapper.getTotalScrapList", search);
	}
	
	public int getTotalBoardList(SearchMypage search) throws Exception {
		
		return sqlSession.selectOne("MypageMapper.getTotalBoardList", search);
	}
	
	public int getTotalCommentList(SearchMypage search) throws Exception {
		
		return sqlSession.selectOne("MypageMapper.getTotalCommentList", search);
	}
	
	
	public int getTotalLikeList(SearchMypage search) throws Exception {
		
		return sqlSession.selectOne("MypageMapper.getTotalLikeList", search);
	}



	
	

}
