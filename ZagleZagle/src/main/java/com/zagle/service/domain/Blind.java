package com.zagle.service.domain;

public class Blind {

	
	///Field
	
	private String blindNo;
	private Board blindBoardNo;
	private String blindCode;
	private Comment blindCommentNo;
	public String getBlindNo() {
		return blindNo;
	}
	public void setBlindNo(String blindNo) {
		this.blindNo = blindNo;
	}
	public Board getBlindBoardNo() {
		return blindBoardNo;
	}
	public void setBlindBoardNo(Board blindBoardNo) {
		this.blindBoardNo = blindBoardNo;
	}
	public String getBlindCode() {
		return blindCode;
	}
	public void setBlindCode(String blindCode) {
		this.blindCode = blindCode;
	}
	public Comment getBlindCommentNo() {
		return blindCommentNo;
	}
	public void setBlindCommentNo(Comment blindCommentNo) {
		this.blindCommentNo = blindCommentNo;
	}
	@Override
	public String toString() {
		return "Blind [blindNo=" + blindNo + ", blindBoardNo=" + blindBoardNo + ", blindCode=" + blindCode
				+ ", blindCommentNo=" + blindCommentNo + "]";
	}
	
	
}
