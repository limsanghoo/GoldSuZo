package com.zagle.service.trade.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zagle.common.Search;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Sell;
import com.zagle.service.trade.TradeDAO;
import com.zagle.service.trade.TradeService;

@Service("tradeServiceImpl")
public class TradeServiceImpl implements TradeService{

	@Autowired
	@Qualifier("tradeDAOImpl")
	private TradeDAO tradeDAO;
	public void setTradeDAO(TradeDAO tradeDAO) {
		this.tradeDAO=tradeDAO;
	}
	
	@Override
	public void addSell(Sell sell) throws Exception {
		tradeDAO.addSell(sell);
	}

	@Override
	public Map<String, Object> listTrade(Search search) throws Exception {
		List<Sell> list=tradeDAO.listTrade(search);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("tradeList", list);
		
		return map;
	}

}
