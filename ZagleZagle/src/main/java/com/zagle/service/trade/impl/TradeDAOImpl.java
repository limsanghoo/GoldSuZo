package com.zagle.service.trade.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zagle.common.Search;
import com.zagle.service.domain.Buy;
import com.zagle.service.domain.CompanyList;
import com.zagle.service.domain.Sell;
import com.zagle.service.trade.TradeDAO;

@Repository("tradeDAOImpl")
public class TradeDAOImpl implements TradeDAO{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public TradeDAOImpl() {
	}
	
	@Override
	public void addSell(Sell sell) throws Exception {
		sqlSession.insert("SellMapper.addSell",sell);
	}
	@Override
	public List<Sell> listTrade(Search search) throws Exception {
		return sqlSession.selectList("SellMapper.listTrade",search);
	}
	@Override
	public Sell getSell(String sellNo) throws Exception {
		return sqlSession.selectOne("SellMapper.getSell",sellNo);
	}
	@Override
	public List<Sell> listSell(Search search, String userNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userNo", userNo);
		
		return sqlSession.selectList("SellMapper.listSell", map);
	}
	@Override
	public int getSellCount(String userNo) {
		return sqlSession.selectOne("SellMapper.getSellCount",userNo);
	}
	@Override
	public void updateSell(Sell sell) throws Exception {
		sqlSession.update("SellMapper.updateSell",sell);
	}

	@Override
	public void updateSellState(Sell sell) throws Exception {
		sqlSession.update("SellMapper.updateSellState",sell);		
	}
	@Override
	public List<Buy> listBuy(Search search, String userNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userNo", userNo);
		
		return sqlSession.selectList("BuyMapper.listBuy", map);
	}
	@Override
	public void addBuy(Buy buy) throws Exception {
		sqlSession.insert("BuyMapper.addBuy",buy);
	}
	@Override
	public int getBuyCount(String userNo) throws Exception {
		return sqlSession.selectOne("BuyMapper.getBuyCount",userNo);
	}
	@Override
	public Buy getBuy(String buyNo) throws Exception {
		return sqlSession.selectOne("BuyMapper.getBuy",buyNo);
	}
	@Override
	public void payBuy(Buy buy) throws Exception {
		sqlSession.update("BuyMapper.payBuy",buy);
	}
	@Override
	public Buy getBuyNo(String sellNo) throws Exception {
		return sqlSession.selectOne("BuyMapper.getBuyNo",sellNo);
	}
	@Override
	public List<CompanyList> getCompany() throws Exception {
		return sqlSession.selectList("BuyMapper.getCompany");
	}
	@Override
	public void addTracking(Buy buy) throws Exception {
		sqlSession.update("BuyMapper.addTracking",buy);
	}
}
