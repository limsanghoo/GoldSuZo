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
	
	@Autowired
	@Qualifier("daumRestDAOImpl")
	private RestBoardDAO daumRestDAOImpl;
	public void setDaumRestDAOImpl(RestBoardDAO daumRestDAOImpl) {
		this.daumRestDAOImpl=daumRestDAOImpl;
	}

	@Override
	public void addBoard(Board board) throws Exception {
		boardDAO.addBoard(board);	
	}

	@Override
	public void addLink(Link link) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBoard(Board board) throws Exception {
		boardDAO.updateBoard(board);
	}

	@Override
	public void deleteBoard(Board board) throws Exception {
		boardDAO.deleteBoard(board);
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
		boardDAO.addComment(comment);
	}
	
	@Override
	public List<Comment> listComment(String boardNo) throws Exception {		
		List<Comment> list=boardDAO.listComment(boardNo);
		
		return list;
	}

	@Override
	public void deleteComment(String commentNo) throws Exception {
		boardDAO.deleteComment(commentNo);
	}

	@Override
	public void addLike(Like like) throws Exception {
		boardDAO.addLike(like);
	}

	@Override
	public void cancelLike(Like like) throws Exception {
		boardDAO.cancelLike(like);
	}

	@Override
	public void shareBoard(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String addBoardVisionTag(String link) throws Exception {		
		return kakaoRestDAOImpl.addBoardVisionTag(link);
	}

	@Override
	public void addBoardDaumMap(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> listMap(SearchBoard searchBoard) throws Exception {
		
		return null;
	}

	@Override
	public void deleteLink(Link link) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addScrap(Scrap scrap) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void cancelScrap(Scrap scrap) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
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

	

}
