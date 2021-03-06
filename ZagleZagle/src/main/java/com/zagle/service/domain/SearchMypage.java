package com.zagle.service.domain;


public class SearchMypage {
	
	private int currentPage;
	

	Board myBoard;
	User myUser;
	private String myUserNo;
	public String getMyUserNo() {
		return myUserNo;
	}

	public void setMyUserNo(String myUserNo) {
		this.myUserNo = myUserNo;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	private int pageSize;
	private int endRowNum;
	private int startRowNum;
	
	public SearchMypage() {
	}
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	
	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}

	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}
	
	public User getMyUser() {
		return myUser;
	}

	public void setMyUser(User myUser) {
		this.myUser = myUser;
	}
	

	public Board getMyBoard() {
		return myBoard;
	}

	public void setMyBoard(Board myBoard) {
		this.myBoard = myBoard;
	}

	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCondition="
			    + ", searchKeyword=" 
				+ ", pageSize=" + pageSize + ", endRowNum=" + endRowNum
				+ ", startRowNum=" + startRowNum + "]";
	}
}