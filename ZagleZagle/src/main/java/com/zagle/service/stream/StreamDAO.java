package com.zagle.service.stream;

import java.util.List;


import com.zagle.service.domain.Refund;
import com.zagle.service.domain.SearchStream;
import com.zagle.service.domain.Stream;

public interface StreamDAO {

	public void addStream(Stream stream)throws Exception;
	
	public List<Stream> listRefund(SearchStream search,String grade)throws Exception;
	
	public int getTotalCount(SearchStream search)throws Exception;
	
	public void refundStream(Refund refund)throws Exception;
	
	
}
