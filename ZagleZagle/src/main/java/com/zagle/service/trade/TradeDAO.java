package com.zagle.service.trade;

import java.util.List;

import com.zagle.common.Search;
import com.zagle.service.domain.Sell;

public interface TradeDAO {

	public void addSell(Sell sell) throws Exception;

	public List<Sell> listTrade(Search search) throws Exception;
	
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
