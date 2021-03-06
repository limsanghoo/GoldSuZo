package com.zagle.service.trade;

import java.util.List;

import com.zagle.common.Search;
import com.zagle.service.domain.Buy;
import com.zagle.service.domain.CompanyList;
import com.zagle.service.domain.Sell;

public interface TradeDAO {

	public void addSell(Sell sell) throws Exception;

	public List<Sell> listTrade(Search search) throws Exception;

	public Sell getSell(String sellNo) throws Exception;

	public List<Sell> listSell(Search search, String userNo) throws Exception;

	public void updateSell(Sell sell) throws Exception;
	
	public void updateSellState(Sell sell) throws Exception;

	public List<Buy> listBuy(Search search, String userNo) throws Exception;

	public void addBuy(Buy buy) throws Exception;

	public int getSellCount(String userNo) throws Exception;

	public int getBuyCount(String userNo) throws Exception;

	public Buy getBuy(String buyNo) throws Exception;

	public void payBuy(Buy buy) throws Exception;

	public Buy getBuyNo(String sellNo) throws Exception;
	
	public List<CompanyList> getCompany() throws Exception;

	public void addTracking(Buy buy) throws Exception;
	
//	addSell 판매상품올리기
//	addBuy 구매요청했을때
//	listTrade 중고상품전체보기
//	listSell 내가판매하는상품리스트
//	listBuy 내가구매요청한리스트
//	getSell 중고상품상세보기
//	getBuy 구매요청상세보기
//	updateSell 상품수정
//	updateBuy 구매요청수정
//	deleteSell 상품삭제
}
