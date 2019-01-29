package com.zagle.service.stream.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


import com.zagle.service.domain.Refund;
import com.zagle.service.domain.SearchStream;
import com.zagle.service.domain.Spon;
import com.zagle.service.domain.Stream;
import com.zagle.service.stream.StreamDAO;


@Repository("streamDAOImpl")
public class StreamDAOImpl  implements StreamDAO{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public StreamDAOImpl() {
		System.out.println(this.getClass());
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void addStream(Stream stream) throws Exception {
	
		Map<String,Object>map = new HashMap<String,Object>();
		
		map.put("userNo",stream.getUser().getUserNo());
		map.put("streamTitle",stream.getStreamTitle());
		map.put("streamContent",stream.getStreamContent());
		System.out.println("streamdaoimpl=="+map);
		sqlSession.insert("StreamMapper.addStream", map);
		
	}

	@Override
	public List<Refund> listRefund(SearchStream search) throws Exception {
		// TODO Auto-generated method stub
	
		return sqlSession.selectList("RefundMapper.listRefund", search);
	}

	@Override
	public int getTotalCount(SearchStream search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("RefundMapper.getTotalCount", search);
	}

	@Override
	public void refundStream(Refund refund) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addSpon(Spon spon) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("SponMapper.addSpon",spon);
	}

	@Override
	public List<String> listSpon(String userNo) throws Exception {
		// TODO Auto-generated method stub
		//Map map =(Map) 
		return sqlSession.selectList("SponMapper.listSpon", userNo);
	}

	@Override
	public void updateSpon(String userNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("SponMapper.updateSpon",userNo);
	}

	@Override
	public void addRefund(Refund refund) {
		// TODO Auto-generated method stub 
		System.out.println("addRefundDAOIMPL");
		sqlSession.insert("RefundMapper.addRefund", refund);
		sqlSession.update("SponMapper.updateSpon", refund.getStreamerNo());
	}
	@Override
	public void updateRefund(Map<String,Object>map) throws Exception {
		// TODO Auto-generated method stub
		String check = (String) map.get("check");
		if(check.equals("0")) {
			map.put("check","1");
		}else {
			map.put("check","0");
		}
		
		System.out.println("환불업데이트~~~~"+map);
		sqlSession.update("RefundMapper.updateRefund",map);
		
	}
	
}
