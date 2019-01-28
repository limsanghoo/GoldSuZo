package com.zagle.service.stream.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


import com.zagle.common.Search;
import com.zagle.service.domain.Refund;
import com.zagle.service.domain.SearchStream;
import com.zagle.service.domain.Spon;
import com.zagle.service.domain.Stream;
import com.zagle.service.stream.StreamDAO;
import com.zagle.service.stream.StreamRestDAO;
import com.zagle.service.stream.StreamService;

@Service("streamServiceImpl")
public class StreamServiceImpl implements StreamService{

	@Autowired
	@Qualifier("streamDAOImpl")
	private StreamDAO streamDAO;
	
	@Autowired
	@Qualifier("mongoRestDAOImpl")
	private StreamRestDAO mongoRestDAOImpl;

	public void setStreamDAO(StreamDAO streamDAO) {
		this.streamDAO=streamDAO;
	}
	
	public StreamServiceImpl() {
		System.out.println(this.getClass());
	}
//	
//	@Autowired
//	@Qualifier("KakaoRestDAOImpl")
//	private KakaoRestDaoImpl kakaoRestDaoImpl;
//	
//	@Autowired
//	@Qualifier("NaverRestDAOImpl")
//	private NaverRestDaoImpl naverRestDaoImpl;
//	
//	@Autowired
//	@Qualifier("InicisRestDAOImpl")
//	private InicisRestDaoImpl inicisRestDaoImpl;
	
	
	@Override
	public void addStream(Stream stream) throws Exception {
		// TODO Auto-generated method stub
		streamDAO.addStream(stream);
		mongoRestDAOImpl.addMongo(stream);
	}

	@Override
	public Map<String, Object> listStream(SearchStream search) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		List<JSONObject> list = mongoRestDAOImpl.listMongo(search);
		int count = (int)mongoRestDAOImpl.getTotalCount(search);
		
		System.out.println("count::"+ count );
		map.put("list", list);
		map.put("totalCount",count);
		return map;
	}

	@Override
	public Map<String, Object> listRefund(SearchStream search) throws Exception {
		// TODO Auto-generated method stub
		List<Refund> list = streamDAO.listRefund(search);
		int count = streamDAO.getTotalCount(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		return map;
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

	@Override
	public void joinStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		mongoRestDAOImpl.joinMongo(map);
	}

	@Override
	public void addSpon(Spon spon) throws Exception {
		streamDAO.addSpon(spon);
		
	}

	@Override
	public List<String> listSpon(String userNo) throws Exception {
		// TODO Auto-generated method stub
		List<String> map = streamDAO.listSpon(userNo);
		return map;
	}

	@Override
	public void addRefund(Refund refund) throws Exception {
		streamDAO.updateSpon(refund.getStreamerNo());
		streamDAO.addRefund(refund);
	}

	@Override
	public void updateRefund(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		streamDAO.updateRefund(map);
	}
	
	
}
