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
import com.zagle.service.domain.Scrap;
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

	
/////////보드	
	@Override
	public void addBoard(Board board) throws Exception {
		sqlSession.insert("BoardMapper.addBoard", board);
	}
	
	@Override
	public void updateBoard(Board board) throws Exception {
		sqlSession.update("BoardMapper.updateBoard", board);
	}

	@Override
	public void updateBoardStatus(Board board) throws Exception {
		sqlSession.update("BoardMapper.updateBoardStatus", board);
	}

	@Override
	public List<Board> listBoard(SearchBoard searchBoard) throws Exception {
	
		return sqlSession.selectList("BoardMapper.listBoard", searchBoard);
	}

	@Override
	public Board getBoard(String boardNo) throws Exception {
	int result = sqlSession.selectOne("MypageMapper.likeCount", boardNo);
	Board board = new Board();
	board = sqlSession.selectOne("BoardMapper.getBoard", boardNo);
	board.setLikeCount(result);
	
		return board;
	}
	
	
///////////링크	
	@Override
	public void addLink(Link link) throws Exception {
		sqlSession.insert("BoardMapper.addLink", link);
	}

	@Override
	public List<Link> listLink(String photo1) throws Exception {
		return sqlSession.selectList("BoardMapper.listLink", photo1);
	}
		
	@Override
	public void deleteLink(String linkNo) throws Exception {
		sqlSession.delete("BoardMapper.deleteLink", linkNo);
	}

	
////////////신고
	@Override
	public void addReport(Report report) throws Exception {
		sqlSession.insert("ReportMapper.addReport", report);
	}


///////////댓글
	@Override
	public void addComment(Comment comment) throws Exception {
		sqlSession.insert("BoardMapper.addComment", comment);
	}
	
	@Override
	public List<Comment> listComment(String boardNo) throws Exception {
		return sqlSession.selectList("BoardMapper.listComment", boardNo);
	}

	
	@Override
	public void updateCommentStatus(Comment comment) throws Exception {
		sqlSession.update("BoardMapper.updateCommentStatus", comment);
	}

	@Override
	public void deleteComment(String commentNo) throws Exception {
		sqlSession.delete("BoardMapper.deleteComment", commentNo);
	}

	
///////////좋아요	
	@Override
	public void addLike(Like like) throws Exception {
		sqlSession.insert("BoardMapper.addLike", like);
	}

	@Override
	public void updateLike(Like like) throws Exception {
		sqlSession.update("BoardMapper.updateLike", like);
	}

	
////////////스크랩	
	@Override
	public void addScrap(Scrap scrap) throws Exception {
		sqlSession.insert("BoardMapper.addScrap", scrap);
	}

	@Override
	public void updateScrap(Scrap scrap) throws Exception {
		sqlSession.update("BoardMapper.updateScrap", scrap);
	}

	
////////////맵	
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
