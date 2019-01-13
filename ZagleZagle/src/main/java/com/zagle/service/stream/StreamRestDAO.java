package com.zagle.service.stream;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import com.zagle.common.Search;
import com.zagle.service.domain.SearchStream;
import com.zagle.service.domain.Stream;
import com.zagle.service.domain.User;

public interface StreamRestDAO {

	public List<JSONObject> listMongo(SearchStream search)throws Exception;
	
	public void addMongo(Stream stream)throws Exception;
	
	public void joinMongo(Map<String,Object> map)throws Exception;
	
	public long getTotalCount(SearchStream search)throws Exception;
	
	public Map<String,Object>kakaopayStream(Map<String,Object>map)throws Exception;
	
	public Map<String,Object>naverpayStream(Map<String,Object>map)throws Exception;
	
	public Map<String,Object>inicispayStream(Map<String,Object>map)throws Exception;
	
	public Map<String,Object>kakaopayOkStream(Map<String,Object>map)throws Exception;
	
	public Map<String,Object>naverpayOkStream(Map<String,Object>map)throws Exception;
	
	public Map<String,Object>inicispayOkStream(Map<String,Object>map)throws Exception;
	
	
	
}
