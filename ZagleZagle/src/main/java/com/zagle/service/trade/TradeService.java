package com.zagle.service.trade;

import java.util.Map;

import com.zagle.common.Search;
import com.zagle.service.domain.Sell;

public interface TradeService {

	public void addSell(Sell sell)  throws Exception;

	public Map<String, Object> listTrade(Search search) throws Exception;

}
