package com.zagle.service.board;

public interface RestBoardDAO {
	
	public void shareBoard(String boardNo) throws Exception;
	
	public String addBoardVisionTag(String link) throws Exception;
	
	public void addBoardDaumMap() throws Exception;
	
	public void listMap() throws Exception;

}
