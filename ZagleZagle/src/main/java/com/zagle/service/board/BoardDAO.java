package com.zagle.service.board;

import java.util.List;
import java.util.Map;

import com.zagle.common.Search;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Like;
import com.zagle.service.domain.Link;
import com.zagle.service.domain.Local;
import com.zagle.service.domain.Report;
import com.zagle.service.domain.Scrap;
import com.zagle.service.domain.SearchBoard;

public interface BoardDAO {
	
public void addBoard(Board board) throws Exception;
	
	public void addLink(Link link) throws Exception;
	
	public void updateBoard(Board board) throws Exception;
	
	public void updateBoardStatus(Board board) throws Exception;
	
	public List<Board> listBoard(SearchBoard searchBoard) throws Exception;

	public Board getBoard(String boardNo) throws Exception;
	
	public void addReport(Report report) throws Exception;
	
	public void getHotTag(Board board) throws Exception;
	
	public void addComment(Comment comment) throws Exception;
	
	public List<Comment> listComment(String boardNo) throws Exception;
	
	public void deleteComment(String commentNo) throws Exception;
	
	public void addLike(Like like) throws Exception;
	
	public void updateLike(Like like) throws Exception;
	
	public void addScrap(Scrap scrap) throws Exception;
	
	public void updateScrap(Scrap scrap) throws Exception;
	
	public List<Local> getState() throws Exception;

	public int getStateCount() throws Exception;

	public List<Local> getCity(Local local) throws Exception;

	public List<Local> getTown(Local local) throws Exception;

	public List<Board> getMapList(Search search);
	

}
