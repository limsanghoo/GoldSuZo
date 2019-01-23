package com.zagle.service.trade.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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

}
