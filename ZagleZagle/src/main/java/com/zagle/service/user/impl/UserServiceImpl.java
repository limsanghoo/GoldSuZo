package com.zagle.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zagle.service.domain.User;
import com.zagle.service.user.UserDao;
import com.zagle.service.user.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
	
	///Field
	@Autowired
	@Qualifier("userDAOImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	public void addUser(User user) throws Exception {
		userDao.addUser(user);
	}
	
	public User getUser(String snsNo) throws Exception {
		return userDao.getUser(snsNo);
	}
	public User getUser2(String userNo) throws Exception {
		return userDao.getUser2(userNo);
	}
	public User getUser3(String userName) throws Exception {
		return userDao.getUser3(userName);
	}
	
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}
	
	public boolean checkDuplication(String snsNo) throws Exception {
		System.out.println("ServiceImpl에서 snsNo 확인 "+snsNo);
		
		boolean result = true;
		User user=userDao.getUser(snsNo);
		System.out.println("getUser 확인 "+user);
		
		if(user==null) {
			
			
			return false;
		}
	
		return  result;
	}
	
	/*
	public User addActiveScore(int totalActiveScore) throws Exception {
		userDao.addActiveScore(totalActiveSocre);
	}
	*/
	
	public void addActiveScore(User user) throws Exception {
		userDao.addActiveScore(user);
	}

}
