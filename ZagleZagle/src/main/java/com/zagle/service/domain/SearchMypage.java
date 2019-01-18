package com.zagle.service.domain;


public class SearchMypage {
	
	private int currentPage;
	public User getMyUser() {
		return myUser;
	}

	public void setMyUser(User myUser) {
		this.myUser = myUser;
	}

	User myUser;
	private int pageSize;
	private int endRowNum;
	private int startRowNum;
	
	public SearchMypage() {
	}
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int paseSize) {
		this.pageSize = paseSize;
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

	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCondition="
			    + ", searchKeyword=" 
				+ ", pageSize=" + pageSize + ", endRowNum=" + endRowNum
				+ ", startRowNum=" + startRowNum + "]";
	}
}