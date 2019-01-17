package com.zagle.service.user;

import com.zagle.service.domain.User;

public interface UserService {
	

	public void addUser(User user) throws Exception;
	
	
	public User getUser(String snsNo) throws Exception;
	

	public User getUser2(String userNo) throws Exception;
	
	

	public void updateUser(User user) throws Exception;


	public boolean checkDuplication(String snsNo) throws Exception;
	

	//public User addActiveScore(int totalActiveScore) throws Exception;
	public void addActiveScore(User user) throws Exception;
	
}
