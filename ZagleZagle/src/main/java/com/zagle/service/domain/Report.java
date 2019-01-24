package com.zagle.service.domain;

import java.sql.Date;

public class Report {
	
	///Field
	
	private String reportNo;
	private User reportingUserNo;
	private User reportedUserNo;
	private String reportReason;
	
	private Board reportedBoard;
	private Comment reportedComment;
	
	private int handleCode;
	private Date reportDate;
	
	///Constructor
	public Report() {
	}

	public String getReportNo() {
		return reportNo;
	}

	public void setReportNo(String reportNo) {
		this.reportNo = reportNo;
	}

	public User getReportingUserNo() {
		return reportingUserNo;
	}

	public void setReportingUserNo(User reportingUserNo) {
		this.reportingUserNo = reportingUserNo;
	}

	public User getReportedUserNo() {
		return reportedUserNo;
	}

	public void setReportedUserNo(User reportedUserNo) {
		this.reportedUserNo = reportedUserNo;
	}

	public String getReportReason() {
		return reportReason;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

	public Board getReportedBoard() {
		return reportedBoard;
	}

	public void setReportedBoard(Board reportedBoard) {
		this.reportedBoard = reportedBoard;
	}

	public Comment getReportedComment() {
		return reportedComment;
	}

	public void setReportedComment(Comment reportedComment) {
		this.reportedComment = reportedComment;
	}

	public int getHandleCode() {
		return handleCode;
	}

	public void setHandleCode(int handleCode) {
		this.handleCode = handleCode;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportingUserNo=" + reportingUserNo + ", reprotedUserNo="
				+ reportedUserNo + ", reportReason=" + reportReason + ", handleCode=" + handleCode + ", reportDate="
				+ reportDate + "]";
	}
	
	

}
