package com.zagle.service.board;

import java.util.Map;

import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Like;
import com.zagle.service.domain.Link;
import com.zagle.service.domain.SearchBoard;

public interface BoardService {
	
	public void addBoard(Board board) throws Exception;
	
	public void addLink(Link link) throws Exception;
	
	public void updateBoard(Board board) throws Exception;
	
	public void deleteBoard(Board board) throws Exception;
	
	public Map<String, Object> listBoard(SearchBoard searhBoard) throws Exception;

	public Board getBoard(String boardNo) throws Exception;
	
	public void addReport(Report report) throws Exception;
	
	public void getHotTag(Board board) throws Exception;
	
	public void addComment(Comment comment) throws Exception;
	
	public void deleteComment(Comment comment) throws Exception;
	
	public void addLike(Like like) throws Exception;
	
	public void cancelLike(Like like) throws Exception;
	
	public void shareBoard(Board board) throws Exception;
	
	public void addBoardVisionTag(Board board) throws Exception;
	
	public void addBoardDaumMap(Board board) throws Exception;
	
	public Map<String, Object> listMap(Board board) throws Exception;
	
	
	
}
