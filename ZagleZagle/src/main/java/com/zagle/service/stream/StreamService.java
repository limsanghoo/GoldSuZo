package com.zagle.service.stream;

import com.zagle.service.domain.Refund;
import com.zagle.service.domain.SearchStream;
import com.zagle.service.domain.Spon;
import com.zagle.service.domain.Stream;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface StreamService {
	

	public void addStream(Stream stream)throws Exception;
	
	public void addSpon(Spon spon)throws Exception;
	
	public long checkBan(Map<String,Object>map)throws Exception;
	
	public void addRefund(Refund refund)throws Exception; 
	
	public void joinStream(Map<String,Object> map)throws Exception;
	
	public Map<String,Object> listStream(SearchStream search)throws Exception;
	
	public List<String> listSpon(String userNo)throws Exception;
	
	public Map<String,Object> listRefund(SearchStream search)throws Exception; 
	
	public void updateRefund(Map<String,Object> map)throws Exception;
	
	public String kakaopayStream(Map<String,Object> map)throws Exception;
	
	public String naverpayStream(Map<String,Object> map)throws Exception;
	
	public String inicispayStream(Map<String,Object> map)throws Exception;
	
	public String kakaopayOkStream(Map<String,Object> map)throws Exception;
	
	public String naverpayOkStream(Map<String,Object> map)throws Exception;
	
	public String inicispayOkStream(Map<String,Object> map)throws Exception;
	
	
	
	

}
