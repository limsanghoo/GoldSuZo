package com.zagle.service.stream;

import com.zagle.service.domain.Stream;

import java.util.Map;

import com.zagle.common.*;
public interface StreamService {
	

	public void addStream(Stream stream)throws Exception;
	
	public Map<String,Object> listStream(Search search)throws Exception;
	
	public Map<String,Object> listStream(Search search,String grade)throws Exception;
	
	public String kakaopayStream(Map<String,Object> map)throws Exception;
	
	public String naverpayStream(Map<String,Object> map)throws Exception;
	
	public String inicispayStream(Map<String,Object> map)throws Exception;
	
	public String kakaopayOkStream(Map<String,Object> map)throws Exception;
	
	public String naverpayOkStream(Map<String,Object> map)throws Exception;
	
	public String inicispayOkStream(Map<String,Object> map)throws Exception;
	
	
	
	

}
