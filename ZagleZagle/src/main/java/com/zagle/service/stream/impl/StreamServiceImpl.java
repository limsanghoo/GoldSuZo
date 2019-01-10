package com.zagle.service.stream.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


import com.zagle.common.Search;
import com.zagle.service.domain.Stream;
import com.zagle.service.stream.StreamDao;
import com.zagle.service.stream.StreamRestDao;
import com.zagle.service.stream.StreamService;

@Service("streamServiceImpl")
public class StreamServiceImpl implements StreamService{

	@Autowired
	@Qualifier("streamDaoImpl")
	private StreamDao streamDao;
	private StreamRestDao streamRestDao;
	
	@Override
	public void addStream(Stream stream) throws Exception {
		// TODO Auto-generated method stub

		
	}

	@Override
	public Map<String, Object> listStream(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listStream(Search search, String grade) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String kakaopayStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String naverpayStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String inicispayStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String kakaopayOkStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String naverpayOkStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String inicispayOkStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
