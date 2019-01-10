package com.zagle.service.user;

import com.zagle.service.domain.User;

public interface UserService {
	
	///회원가입
	public void addUser(User user) throws Exception;
	
	///내정보 확인
	public User getUser(String userNo) throws Exception;
	
	
	///내정보 수정
	public void updateUser(User user) throws Exception;

	///회원 ID 중복 확인
	public boolean checkDuplication(String snsNo) throws Exception;
	
	///활동 점수 추가
	//public User addActiveScore(int totalActiveScore) throws Exception;
	public void addActiveScore(User user) throws Exception;
	
}
