package com.zagle.service.stream;

import java.util.List;

import com.zagle.common.Search;
import com.zagle.service.domain.Refund;
import com.zagle.service.domain.Stream;

public interface StreamDao {

	public void addStream(Stream stream)throws Exception;
	
	public List<Stream> listRefund(Search search,String grade)throws Exception;
	
	public int getTotalCount(Search search)throws Exception;
	
	public void refundStream(Refund refund)throws Exception;
	
	
}
