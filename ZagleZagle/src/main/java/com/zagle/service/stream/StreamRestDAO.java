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
	
	public long  checkBan(Map<String,Object> map) throws Exception;
	
	public long getTotalCount(SearchStream search)throws Exception;
	
	
	
}
