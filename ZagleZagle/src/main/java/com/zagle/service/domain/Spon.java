package com.zagle.service.domain;

public class Spon {

	private String userNo;
	private String streamerNo;
	private int price;
	private String paymentNo;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}
	@Override
	public String toString() {
		return "Spon [userNo=" + userNo + ", streamerNo=" + streamerNo + ", price=" + price + ", paymentNo=" + paymentNo
				+ "]";
	}

	
	
	
	
}
