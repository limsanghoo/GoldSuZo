package com.zagle.service.admin;

import java.util.Map;

import com.zagle.common.Search;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Report;
import com.zagle.service.domain.User;

public interface AdminService {

	public Map <String, Object> listBlackObject(Search search) throws Exception;
	
	public Map <String, Object> listBlackList(Search search) throws Exception;
	
	public void updateReport(Report report) throws Exception;
	
	public Map<String, Object> listUser(Search search) throws Exception;
	
	public void addBlind(Board board) throws Exception;
	
	public void addBlind2(Comment comment) throws Exception;
	
	public void cancelBlind(Board board) throws Exception;
	
	public void cancelComment(Comment comment) throws Exception;
	
	public void deleteBlind(Board board) throws Exception;
	
	public void delteBlind2(Comment comment) throws Exception;
	
	public void checkBlack(User BlackCode) throws Exception;
	
	
	
	
	
	
	
}
