package com.zagle.service.domain;

public class CompanyList {
	
	private String companyName;
	private int companyCode;

	public CompanyList() {
		
	}
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public int getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(int companyCode) {
		this.companyCode = companyCode;
	}

	@Override
	public String toString() {
		return "CompanyList [companyName=" + companyName + ", companyCode=" + companyCode + "]";
	}
	

}
