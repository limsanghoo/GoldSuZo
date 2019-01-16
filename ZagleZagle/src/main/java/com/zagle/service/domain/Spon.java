package com.zagle.service.domain;

public class Spon {

	private String userNo;
	private String streamerNo;
	private String price;
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getStreamerNo() {
		return streamerNo;
	}
	public void setStreamerNo(String streamerNo) {
		this.streamerNo = streamerNo;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Spon [userNo=" + userNo + ", streamerNo=" + streamerNo + ", price=" + price + "]";
	}
	
	
}
