package com.zagle.service.user;

import com.zagle.service.domain.SearchAdmin;
import com.zagle.service.domain.User;

public interface UserDao {

	
	///INSERT
	public void addUser(User user) throws Exception;
	
	///SELECT ONE
	public User getUser(String snsNo) throws Exception;
	
	////
	public User getUser2(String userNo) throws Exception;
	////
	
	public User getUser3(String userName) throws Exception;
	
	//USER INFO UPDATE
	public void updateUser(User user) throws Exception;
	
	//USER SCORE UPDATE
	//public User addActiveScore(int totalActiveScore) throws Exception;
	public void addActiveScore(User user) throws Exception;

	public void updateDeleteCount(User user) throws Exception;
	
	// �Խ��� Page ó���� ���� ��ü Row(totalCount) return
	public int getTotalCount(SearchAdmin search) throws Exception;
	
	public int checkNickname(User user) throws Exception;
	
}
