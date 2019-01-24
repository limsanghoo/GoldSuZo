package com.zagle.service.admin;

import java.util.Map;

import com.zagle.common.Search;
import com.zagle.service.domain.BlackList;
import com.zagle.service.domain.Blind;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Report;
import com.zagle.service.domain.SearchAdmin;
import com.zagle.service.domain.User;

public interface AdminService {

	public Map <String, Object> listBlackObject(SearchAdmin search) throws Exception;
	
	public Map <String, Object> listBlackList(SearchAdmin search) throws Exception;
	
	public void addReport(Report report) throws Exception;
	
	public void addBlackList(BlackList blackList) throws Exception;
	
	public void updateReport(Report report) throws Exception;
	
	public Map<String, Object> listUser(SearchAdmin search) throws Exception;
	
	public void addBlind(Blind blind) throws Exception;
	
	public void updateBlind(Blind blind) throws Exception;
	
	//public void addBlind2(Comment comment) throws Exception;
	
	//public void cancelBlind(Blind blind) throws Exception;
	
	//public void cancelComment(Comment comment) throws Exception;
	
	//public void deleteBlind(Blind blind) throws Exception;
	
	//public void delteBlind2(Comment comment) throws Exception;
	


	
		
	
	
	
	
	
	
}
