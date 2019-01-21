package com.zagle.service.domain;

public class SearchStream {
	private int currentPage;
	private int pageSize;
	private int endRowNum;
	private int startRowNum;
	private String searchUserNo;
	
	
	public String getSearchUserNo() {
		return searchUserNo;
	}
	public void setSearchUserNo(String searchUserNo) {
		this.searchUserNo = searchUserNo;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}
	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}
	@Override
	public String toString() {
		return "SearchStream [currentPage=" + currentPage + ", pageSize=" + pageSize + ", endRowNum=" + endRowNum
				+ ", startRowNum=" + startRowNum + ", searchUserNo=" + searchUserNo + "]";
	}
	
	
	
}
