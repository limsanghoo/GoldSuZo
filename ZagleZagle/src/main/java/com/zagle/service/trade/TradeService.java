package com.zagle.service.trade;

import java.util.List;
import java.util.Map;

import com.zagle.common.Search;
import com.zagle.service.domain.Buy;
import com.zagle.service.domain.CompanyList;
import com.zagle.service.domain.Sell;

public interface TradeService {

	public void addSell(Sell sell)  throws Exception;

	public Map<String, Object> listTrade(Search search) throws Exception;

	public Sell getSell(String sellNo) throws Exception;

	public Map<String, Object> listSell(Search search, String userNo) throws Exception;

	public void updateSell(Sell sell) throws Exception;

	public void updateSellState(Sell sell) throws Exception;

	public Map<String, Object> listBuy(Search search, String userNo) throws Exception;

	public void addBuy(Buy buy) throws Exception;

	public Buy getBuy(String buyNo) throws Exception;

	public void payBuy(Buy buy) throws Exception;

	public Buy getBuyNo(String sellNo) throws Exception;

	public List<CompanyList> getCompany() throws Exception;

	public void addTracking(Buy buy) throws Exception;
}
