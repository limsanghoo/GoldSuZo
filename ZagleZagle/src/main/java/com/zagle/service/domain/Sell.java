package com.zagle.service.domain;

import java.sql.Date;

public class Sell {

	private String sellNo;
	private User seller;
	private String sellName;
	private int sellPrice;
	private String sellText;
	private String sellPhoto1;
	private String sellPhoto2;
	private String sellPhoto3;
	private String sellPhone;
	private int sellStyle;
	private int sellState;
	private Date sellDate;

	public Sell() {
		super();
	}

	public String getSellNo() {
		return sellNo;
	}

	public void setSellNo(String sellNo) {
		this.sellNo = sellNo;
	}

	public User getSeller() {
		return seller;
	}

	public void setSeller(User seller) {
		this.seller = seller;
	}

	public String getSellName() {
		return sellName;
	}

	public void setSellName(String sellName) {
		this.sellName = sellName;
	}

	public int getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(int sellPrice) {
		this.sellPrice = sellPrice;
	}

	public String getSellText() {
		return sellText;
	}

	public void setSellText(String sellText) {
		this.sellText = sellText;
	}

	public String getSellPhoto1() {
		return sellPhoto1;
	}

	public void setSellPhoto1(String sellPhoto1) {
		this.sellPhoto1 = sellPhoto1;
	}

	public String getSellPhoto2() {
		return sellPhoto2;
	}

	public void setSellPhoto2(String sellPhoto2) {
		this.sellPhoto2 = sellPhoto2;
	}

	public String getSellPhoto3() {
		return sellPhoto3;
	}

	public void setSellPhoto3(String sellPhoto3) {
		this.sellPhoto3 = sellPhoto3;
	}

	public String getSellPhone() {
		return sellPhone;
	}

	public void setSellPhone(String sellPhone) {
		this.sellPhone = sellPhone;
	}

	public int getSellStyle() {
		return sellStyle;
	}

	public void setSellStyle(int sellStyle) {
		this.sellStyle = sellStyle;
	}

	public int getSellState() {
		return sellState;
	}

	public void setSellState(int sellState) {
		this.sellState = sellState;
	}

	public Date getSellDate() {
		return sellDate;
	}

	public void setSellDate(Date sellDate) {
		this.sellDate = sellDate;
	}

	@Override
	public String toString() {
		return "Sell [sellNo=" + sellNo + ", seller=" + seller + ", sellName=" + sellName + ", sellPrice=" + sellPrice
				+ ", sellText=" + sellText + ", sellPhoto1=" + sellPhoto1 + ", sellPhoto2=" + sellPhoto2
				+ ", sellPhoto3=" + sellPhoto3 + ", sellPhone=" + sellPhone + ", sellStyle=" + sellStyle
				+ ", sellState=" + sellState + ", sellDate=" + sellDate + "]";
	}


}
