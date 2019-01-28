package com.zagle.service.trade.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zagle.common.Search;
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
	public int getTotalCount(String userNo) {
		return sqlSession.selectOne("SellMapper.getTotalCount",userNo);
	}
}
