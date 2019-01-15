package com.zagle.service.user;

import com.zagle.service.domain.User;

public interface UserDao {

	
	///INSERT
	public void addUser(User user) throws Exception;
	
	///SELECT ONE
	public User getUser(String snsNo) throws Exception;
	
	////
	public User getUser2(String userNo) throws Exception;
	
	//USER INFO UPDATE
	public void updateUser(User user) throws Exception;
	
	//USER SCORE UPDATE
	//public User addActiveScore(int totalActiveScore) throws Exception;
	public void addActiveScore(User user) throws Exception;

	
	
	// �Խ��� Page ó���� ���� ��ü Row(totalCount) return
	//public int getTotalCount(Search search) throws Exception;
	
}
