package com.zagle.service.domain;

import java.sql.Date;

public class User {
	
	///Field
	private String userNo;
	private String snsNo;
	private String userName;
	private String userNickname;


	private String userAddr;
	private String profile;
	private String grade;

	private String bankName;
	private String account;
	
	private Date regDate;
	
	private int blackCode;
	private int userBirth;
	private int deleteCount;
	private int totalActiveScore;
	
	///////////////////EL ���� ���� �߰��� Field////////////////////////

	
	
	
	
	///Constructor
	public User() {
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getSnsNo() {
		return snsNo;
	}

	public void setSnsNo(String snsNo) {
		this.snsNo = snsNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}



	public String getUserAddr() {
		return userAddr;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getBlackCode() {
		return blackCode;
	}

	public void setBlackCode(int blackCode) {
		this.blackCode = blackCode;
	}

	
	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public int getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(int userBirth) {
		this.userBirth = userBirth;
	}

	public int getDeleteCount() {
		return deleteCount;
	}

	public void setDeleteCount(int deleteCount) {
		this.deleteCount = deleteCount;
	}

	public int getTotalActiveScore() {
		return totalActiveScore;
	}

	public void setTotalActiveScore(int totalActiveScore) {
		this.totalActiveScore = totalActiveScore;
	}

	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", snsNo=" + snsNo + ", userName=" + userName + ", userNickname="
				+ userNickname + ",userAddr=" + userAddr + ", profile="	+ profile + ", grade=" + grade + ", blackCode=" + blackCode + ", bankName="
				+ bankName + ", regDate=" + regDate + ", account=" + account + ", userBirth=" + userBirth
				+ ", deleteCount=" + deleteCount + ", totalActiveScore=" + totalActiveScore + "]";
	}

	

	
}
