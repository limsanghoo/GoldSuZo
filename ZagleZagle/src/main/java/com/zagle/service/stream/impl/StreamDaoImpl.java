package com.zagle.service.stream.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zagle.common.Search;
import com.zagle.service.domain.Refund;
import com.zagle.service.domain.Stream;
import com.zagle.service.stream.StreamDao;


@Repository("streamDaoImpl")
public class StreamDaoImpl  implements StreamDao{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public StreamDaoImpl() {
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
	}

	@Override
	public List<Stream> listRefund(Search search, String grade) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void refundStream(Refund refund) throws Exception {
		// TODO Auto-generated method stub
		
	}

	
}
