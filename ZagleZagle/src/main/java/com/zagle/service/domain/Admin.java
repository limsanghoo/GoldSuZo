package com.zagle.service.domain;

public class Admin {
		
	
	///Field
	private BlackList blacklist;
	private Report report;
	private Board board;
	private Comment comment;
	private Like like;
	private User user;
	
	
	
	///getter, setter
	
	public BlackList getBlacklist() {
		return blacklist;
	}
	public void setBlacklist(BlackList blacklist) {
		this.blacklist = blacklist;
	}
	public Report getReport() {
		return report;
	}
	public void setReport(Report report) {
		this.report = report;
	}
	public Board getBoard() {
		return board;
	}
	public void setBoard(Board board) {
		this.board = board;
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public Like getLike() {
		return like;
	}
	public void setLike(Like like) {
		this.like = like;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Admin [blacklist=" + blacklist + ", report=" + report + ", board=" + board + ", comment=" + comment
				+ ", like=" + like + ", user=" + user + "]";
	}
	
	
}
