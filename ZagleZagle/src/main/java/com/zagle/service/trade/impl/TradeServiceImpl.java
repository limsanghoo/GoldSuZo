package com.zagle.service.trade.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zagle.common.Search;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Buy;
import com.zagle.service.domain.Sell;
import com.zagle.service.domain.User;
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

	@Override
	public Sell getSell(String sellNo) throws Exception {
		return tradeDAO.getSell(sellNo);
	}

	@Override
	public Map<String, Object> listSell(Search search, String userNo) throws Exception {
		List<Sell> list = tradeDAO.listSell(search, userNo);
		int totalCount = tradeDAO.getSellCount(userNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void updateSell(Sell sell) throws Exception {
		tradeDAO.updateSell(sell);
	}

	@Override
	public void updateSellState(Sell sell) throws Exception {
		tradeDAO.updateSellState(sell);		
	}

	@Override
	public Map<String, Object> listBuy(Search search, String userNo) throws Exception {
		List<Buy> list = tradeDAO.listBuy(search, userNo);
		int totalCount = tradeDAO.getBuyCount(userNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void addBuy(Buy buy) throws Exception {
		tradeDAO.addBuy(buy);
	}

	@Override
	public Buy getBuy(String buyNo) throws Exception {
		return tradeDAO.getBuy(buyNo);
	}



}
