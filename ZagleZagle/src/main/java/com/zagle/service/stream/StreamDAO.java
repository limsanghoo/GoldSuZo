package com.zagle.service.stream;

import java.util.List;
import java.util.Map;

import com.zagle.service.domain.Refund;
import com.zagle.service.domain.SearchStream;
import com.zagle.service.domain.Spon;
import com.zagle.service.domain.Stream;

public interface StreamDAO {

	public void addStream(Stream stream)throws Exception;
	
	public void addSpon(Spon spon)throws Exception;
	
	public void updateSpon(String userNo)throws Exception;
	
	public List<Refund> listRefund(SearchStream search)throws Exception;
	
	public int getTotalCount(SearchStream search)throws Exception;
	
	public void refundStream(Refund refund)throws Exception;
	
	public List<String> listSpon(String userNo)throws Exception;

	public void addRefund(Refund refund)throws Exception; 
	
	
}
