package com.zagle.service.domain;

import java.util.Date;

public class Refund {

	private String refundNo;
	private String userNo;
	private String userNickname;
	private String account;
	private int streamTotalPrice;
	private String bankname;
	private String checkRefund;
	private Date refundDate;
	public String getRefundNo() {
		return refundNo;
	}
	public void setRefundNo(String refundNo) {
		this.refundNo = refundNo;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public int getStreamTotalPrice() {
		return streamTotalPrice;
	}
	public void setStreamTotalPrice(int streamTotalPrice) {
		this.streamTotalPrice = streamTotalPrice;
	}
	public String getBankname() {
		return bankname;
	}
	public void setBankname(String bankname) {
		this.bankname = bankname;
	}
	public String getCheckRefund() {
		return checkRefund;
	}
	public void setCheckRefund(String checkRefund) {
		this.checkRefund = checkRefund;
	}
	public Date getRefundDate() {
		return refundDate;
	}
	public void setRefundDate(Date refundDate) {
		this.refundDate = refundDate;
	}
	@Override
	public String toString() {
		return "Refund [refundNo=" + refundNo + ", userNo=" + userNo + ", userNickname=" + userNickname + ", account="
				+ account + ", streamTotalPrice=" + streamTotalPrice + ", bankname=" + bankname + ", checkRefund="
				+ checkRefund + ", refundDate=" + refundDate + "]";
	}
	
	
}
