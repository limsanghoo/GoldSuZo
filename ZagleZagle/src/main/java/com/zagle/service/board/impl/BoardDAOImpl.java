package com.zagle.service.board.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zagle.common.Search;
import com.zagle.service.board.BoardDAO;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Like;
import com.zagle.service.domain.Link;
import com.zagle.service.domain.Local;
import com.zagle.service.domain.Report;
import com.zagle.service.domain.SearchBoard;

@Repository("boardDAOImpl")
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public BoardDAOImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addBoard(Board board) throws Exception {
		sqlSession.insert("BoardMapper.addBoard", board);
	}

	@Override
	public void addLink(Link link) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBoard(Board board) throws Exception {
		sqlSession.update("BoardMapper.updateBoard", board);
	}

	@Override
	public void deleteBoard(Board board) throws Exception {
		sqlSession.update("BoardMapper.deleteBoard", board);
	}

	@Override
	public List<Board> listBoard(SearchBoard searchBoard) throws Exception {
	
		return sqlSession.selectList("BoardMapper.listBoard", searchBoard);
	}

	@Override
	public Board getBoard(String boardNo) throws Exception {
	
		return sqlSession.selectOne("BoardMapper.getBoard", boardNo);
	}

	@Override
	public void addReport(Report report) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getHotTag(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addComment(Comment comment) throws Exception {
		sqlSession.insert("BoardMapper.addComment", comment);
	}
	
	@Override
	public List<Comment> listComment(String boardNo) throws Exception {
		return sqlSession.selectList("BoardMapper.listComment", boardNo);
	}

	@Override
	public void deleteComment(String commentNo) throws Exception {
		sqlSession.delete("BoardMapper.deleteComment", commentNo);
	}

	@Override
	public void addLike(Like like) throws Exception {
		sqlSession.insert("BoardMapper.addLike", like);
	}

	@Override
	public void cancelLike(Like like) throws Exception {
		
	}
	
	@Override
	public List<Local> getState() throws Exception {
		return sqlSession.selectList("MapMapper.getState");
	}

	@Override
	public int getStateCount() throws Exception {
		return sqlSession.selectOne("MapMapper.getStateCount");
	}

	@Override
	public List<Local> getCity(Local local) throws Exception {
		return sqlSession.selectList("MapMapper.getCity",local);
	}

	@Override
	public List<Local> getTown(Local local) throws Exception {
		return sqlSession.selectList("MapMapper.getTown",local);
	}

	@Override
	public List<Board> getMapList(Search search) {
		return sqlSession.selectList("BoardMapper.getMapList",search);
	}

	

}
