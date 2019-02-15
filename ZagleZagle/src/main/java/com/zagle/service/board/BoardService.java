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

public interface BoardService {
	
	//보드
	public void addBoard(Board board) throws Exception;
	
	public void updateBoard(Board board) throws Exception;
	
	public void updateBoardStatus(Board board) throws Exception;
	
	public Map<String, Object> listBoard(SearchBoard searchBoard) throws Exception;
	
	public Board getBoard(String boardNo) throws Exception;
	
	
	//링크
	public void addLink(Link link) throws Exception;

	public void deleteLink(String linkNo) throws Exception;
	
	public List<Link> listLink(String photo1) throws Exception;

	
	//신고
	public void addReport(Report report) throws Exception;
	
	
	//댓글
	public void addComment(Comment comment) throws Exception;
	
	public List<Comment> listComment(String boardNo) throws Exception;	
	
	public void updateCommentStatus(Comment comment) throws Exception;
	
	public void deleteComment(String commentNo) throws Exception;
	
	
	//좋아요
	public void addLike(Like like) throws Exception;
	
	public void updateLike(Like like) throws Exception;
	
	
	//스크랩
	public void addScrap(Scrap scrap) throws Exception;
	
	public void updateScrap(Scrap scrap) throws Exception;

	
	//맵
	public List<Local> getState() throws Exception;

	public List<Local> getCity(Local local) throws Exception;

	public List<Local> getTown(Local local) throws Exception;

	public List<Board> getMapList(Search search);
	
	
	
	/////////카카오비전	
	public String addBoardVisionTag(String link) throws Exception;

	
	
}
