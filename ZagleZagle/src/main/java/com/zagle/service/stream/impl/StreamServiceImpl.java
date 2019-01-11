package com.zagle.service.stream.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
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
	
	@Autowired
	@Qualifier("streamRestDaoImpl")
	private StreamRestDao streamRestDao;
	
	
	
	@Autowired
	@Qualifier("MongoRestDaoImpl")
	private MongoRestDaoImpl mongoRestDaoImpl;
	
	@Autowired
	@Qualifier("KakaoRestDaoImpl")
	private KakaoRestDaoImpl kakaoRestDaoImpl;
	
	@Autowired
	@Qualifier("NaverRestDaoImpl")
	private NaverRestDaoImpl naverRestDaoImpl;
	
	@Autowired
	@Qualifier("InicisRestDaoImpl")
	private InicisRestDaoImpl inicisRestDaoImpl;
	
	
	@Override
	public void addStream(Stream stream) throws Exception {
		// TODO Auto-generated method stub
		streamDao.addStream(stream);
		streamRestDao.addMongo(stream);
	}

	@Override
	public Map<String, Object> listStream(Search search) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		List<JSONObject> list = streamRestDao.listMongo(search);
		int count = (int)streamRestDao.getTotalCount(search);
		
		System.out.println("count::"+ count );
		map.put("list", list);
		map.put("totalCount",count);
		return map;
	}

	@Override
	public Map<String, Object> listRefund(Search search, String grade) throws Exception {
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
