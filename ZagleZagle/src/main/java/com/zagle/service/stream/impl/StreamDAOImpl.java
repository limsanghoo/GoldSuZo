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
	public List<Stream> listRefund(SearchStream search, String grade) throws Exception {
		// TODO Auto-generated method stub
		
		return null;
	}

	@Override
	public int getTotalCount(SearchStream search) throws Exception {
		// TODO Auto-generated method stub
		return 0;
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

	
}
