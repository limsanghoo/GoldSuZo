package com.zagle.service.trade.impl;

import java.util.List;

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

}
