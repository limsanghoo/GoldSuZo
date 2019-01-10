package com.zagle.service.user;

import com.zagle.service.domain.User;

public interface UserDao {

	
	///INSERT
	public void addUser(User user) throws Exception;
	
	///SELECT ONE
	public User getUser(String userNo) throws Exception;
	
	//USER INFO UPDATE
	public void updateUser(User user) throws Exception;
	
	//USER SCORE UPDATE
	//public User addActiveScore(int totalActiveScore) throws Exception;
	public void addActiveScore(User user) throws Exception;
	
	// 게시판 Page 처리를 위한 전체 Row(totalCount) return
	//public int getTotalCount(Search search) throws Exception;
	
}
