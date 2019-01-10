package com.zagle.service.board.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zagle.service.board.BoardDAO;
import com.zagle.service.board.BoardService;
import com.zagle.service.board.Report;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Like;
import com.zagle.service.domain.Link;
import com.zagle.service.domain.SearchBoard;

@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	@Qualifier("boardDAOImpl")
	private BoardDAO boardDAO;
	public void setBoardDAO(BoardDAO boardDAO) {
		this.boardDAO=boardDAO;
	}

	@Override
	public void addBoard(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addLink(Link link) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBoard(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> listBoard(SearchBoard searhBoard) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board getBoard(String boardNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComment(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addLike(Like like) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void cancelLike(Like like) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void shareBoard(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addBoardVisionTag(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addBoardDaumMap(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> listMap(Board board) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
