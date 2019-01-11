package com.zagle.service.stream.impl;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Repository;

import com.zagle.common.Search;
import com.zagle.service.domain.Stream;
import com.zagle.service.stream.StreamRestDao;

@Repository("streamRestDAOImpl")
public class StreamRestDaoImpl implements StreamRestDao {

	public StreamRestDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<JSONObject> listMongo(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addMongo(Stream stream) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public long getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Object> kakaopayStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> naverpayStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> inicispayStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> kakaopayOkStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> naverpayOkStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> inicispayOkStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
