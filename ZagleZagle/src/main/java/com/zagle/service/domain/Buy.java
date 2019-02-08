package com.zagle.service.domain;

import java.sql.Date;

public class Buy {
	
	private String buyNo;
	private Sell sellProd;
	private User buyer;
	private String buyPhone;
	private String buyAddress;
	private String payment;
	private Date buyDate;
	private String trackingNo;
	private String companyCode;
	
	public Buy() {
		super();
	}

	public String getBuyNo() {
		return buyNo;
	}

	public void setBuyNo(String buyNo) {
		this.buyNo = buyNo;
	}

	public Sell getSellProd() {
		return sellProd;
	}

	public void setSellProd(Sell sellProd) {
		this.sellProd = sellProd;
	}

	public User getBuyer() {
		return buyer;
	}

	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}

	public String getBuyPhone() {
		return buyPhone;
	}

	public void setBuyPhone(String buyPhone) {
		this.buyPhone = buyPhone;
	}

	public String getBuyAddress() {
		return buyAddress;
	}

	public void setBuyAddress(String buyAddress) {
		this.buyAddress = buyAddress;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public String getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}

	public String getTrackingNo() {
		return trackingNo;
	}

	public void setTrackingNo(String trackingNo) {
		this.trackingNo = trackingNo;
	}

	@Override
	public String toString() {
		return "Buy [buyNo=" + buyNo + ", sellProd=" + sellProd + ", buyer=" + buyer + ", buyPhone=" + buyPhone
				+ ", buyAddress=" + buyAddress + ", payment=" + payment + ", buyDate=" + buyDate + ", trackingNo="
				+ trackingNo + ", companyCode=" + companyCode + "]";
	}


}
