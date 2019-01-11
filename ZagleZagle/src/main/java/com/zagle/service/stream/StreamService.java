package com.zagle.service.stream;

import com.zagle.service.domain.SearchStream;
import com.zagle.service.domain.Stream;

import java.util.Map;

public interface StreamService {
	

	public void addStream(Stream stream)throws Exception;
	
	public Map<String,Object> listStream(SearchStream search)throws Exception;
	
	public Map<String,Object> listRefund(SearchStream search,String grade)throws Exception; 
	
	public String kakaopayStream(Map<String,Object> map)throws Exception;
	
	public String naverpayStream(Map<String,Object> map)throws Exception;
	
	public String inicispayStream(Map<String,Object> map)throws Exception;
	
	public String kakaopayOkStream(Map<String,Object> map)throws Exception;
	
	public String naverpayOkStream(Map<String,Object> map)throws Exception;
	
	public String inicispayOkStream(Map<String,Object> map)throws Exception;
	
	
	
	

}
