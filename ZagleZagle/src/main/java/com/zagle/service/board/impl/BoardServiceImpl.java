package com.zagle.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zagle.common.Search;
import com.zagle.service.board.BoardDAO;
import com.zagle.service.board.BoardService;
import com.zagle.service.board.RestBoardDAO;
import com.zagle.service.domain.Report;
import com.zagle.service.domain.Scrap;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Like;
import com.zagle.service.domain.Link;
import com.zagle.service.domain.Local;
import com.zagle.service.domain.SearchBoard;

@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	@Qualifier("boardDAOImpl")
	private BoardDAO boardDAO;
	public void setBoardDAO(BoardDAO boardDAO) {
		this.boardDAO=boardDAO;
	}
	
	@Autowired
	@Qualifier("kakaoRestDAOImpl")
	private RestBoardDAO kakaoRestDAOImpl;
	public void setKaKaoRestDAOImpl(RestBoardDAO kakaoRestDAOImpl) {
		this.kakaoRestDAOImpl=kakaoRestDAOImpl;
	}
	
////////////보드
	@Override
	public void addBoard(Board board) throws Exception {
		boardDAO.addBoard(board);	
	}
	
	@Override
	public void updateBoard(Board board) throws Exception {
		boardDAO.updateBoard(board);
	}

	@Override
	public void updateBoardStatus(Board board) throws Exception {
		boardDAO.updateBoardStatus(board);
	}

	@Override
	public Map<String, Object> listBoard(SearchBoard searchBoard) throws Exception {
		List<Board> list=boardDAO.listBoard(searchBoard);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("boardList", list);
		
		return map;
	}

	@Override
	public Board getBoard(String boardNo) throws Exception {	
		return boardDAO.getBoard(boardNo);
	}
	
	
	
	
//////////////링크
	@Override
	public void addLink(Link link) throws Exception {
		boardDAO.addLink(link);
	}
	
	@Override
	public void deleteLink(String linkNo) throws Exception {
		boardDAO.deleteLink(linkNo);
	}
	
	@Override
	public List<Link> listLink(String photo1) throws Exception {
		List<Link> list=boardDAO.listLink(photo1);
		return list;
	}


	
////////////////신고
	@Override
	public void addReport(Report report) throws Exception {
		boardDAO.addReport(report);	
	}

	
//////////////댓글
	@Override
	public void addComment(Comment comment) throws Exception {
		boardDAO.addComment(comment);
	}
	
	@Override
	public List<Comment> listComment(String boardNo) throws Exception {		
		List<Comment> list=boardDAO.listComment(boardNo);
		
		return list;
	}

	
	@Override
	public void updateCommentStatus(Comment comment) throws Exception {
		boardDAO.updateCommentStatus(comment);
	}

	
	@Override
	public void deleteComment(String commentNo) throws Exception {
		boardDAO.deleteComment(commentNo);
	}

	
//////////좋아요	
	@Override
	public void addLike(Like like) throws Exception {
		boardDAO.addLike(like);
	}

	@Override
	public void updateLike(Like like) throws Exception {
		boardDAO.updateLike(like);
	}
	
	
//////////스크랩
	@Override
	public void addScrap(Scrap scrap) throws Exception {
		boardDAO.addScrap(scrap);
	}

	@Override
	public void updateScrap(Scrap scrap) throws Exception {
		boardDAO.updateScrap(scrap);
	}	

	
///////////////맵
	
	@Override
	public List<Local> getState() throws Exception {
		List<Local> list = boardDAO.getState();
		
		return list;
	}

	@Override
	public List<Local> getCity(Local local) throws Exception {
		List<Local> list = boardDAO.getCity(local);
		
		return list;
	}

	@Override
	public List<Local> getTown(Local local) throws Exception {
		List<Local> list = boardDAO.getTown(local);
		return list;
	}

	@Override
	public List<Board> getMapList(Search search) {
		List<Board> board = boardDAO.getMapList(search);
		return board;
	}


//////////////카카오비전
	@Override
	public String addBoardVisionTag(String link) throws Exception {		
		return kakaoRestDAOImpl.addBoardVisionTag(link);
	}
	

}
