package com.zagle.service.domain;

import java.sql.Date;

public class BlackList {

	private String blackNo;
	private User blackUser;
	private String banReason;
	private String blackCheckCode;
	private Date banStartDay;
	private Date banExpireDay;
	
	public String getBlackNo() {
		return blackNo;
	}
	public void setBlackNo(String blackNo) {
		this.blackNo = blackNo;
	}
	public User getBlackUser() {
		return blackUser;
	}
	public void setBlackUser(User blackUser) {
		this.blackUser = blackUser;
	}
	public String getBanReason() {
		return banReason;
	}
	public void setBanReason(String banReason) {
		this.banReason = banReason;
	}
	public String getBlackCheckCode() {
		return blackCheckCode;
	}
	public void setBlackCheckCode(String blackCheckCode) {
		this.blackCheckCode = blackCheckCode;
	}
	public Date getBanStartDay() {
		return banStartDay;
	}
	public void setBanStartDay(Date banStartDay) {
		this.banStartDay = banStartDay;
	}
	public Date getBanExpireDay() {
		return banExpireDay;
	}
	public void setBanExpireDay(Date banExpireDay) {
		this.banExpireDay = banExpireDay;
	}
	@Override
	public String toString() {
		return "BlackList [blackNo=" + blackNo + ", blackUser=" + blackUser + ", banReason=" + banReason
				+ ", blackCheckCode=" + blackCheckCode + ", banStartDay=" + banStartDay + ", banExpireDay="
				+ banExpireDay + "]";
	}
	
}
