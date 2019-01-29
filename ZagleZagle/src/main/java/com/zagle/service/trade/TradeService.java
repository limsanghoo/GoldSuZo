package com.zagle.service.trade;

import java.util.Map;

import com.zagle.common.Search;
import com.zagle.service.domain.Buy;
import com.zagle.service.domain.Sell;
import com.zagle.service.domain.User;

public interface TradeService {

	public void addSell(Sell sell)  throws Exception;

	public Map<String, Object> listTrade(Search search) throws Exception;

	public Sell getSell(String sellNo) throws Exception;

	public Map<String, Object> listSell(Search search, String userNo) throws Exception;

	public void updateSell(Sell sell) throws Exception;

	public void updateSellState(Sell sell) throws Exception;

	public Map<String, Object> listBuy(Search search, String userNo) throws Exception;

	public void addBuy(Buy buy) throws Exception;

}
