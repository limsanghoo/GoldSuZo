package com.zagle.service.user;

import com.zagle.service.domain.User;

public interface UserService {
	
	///ȸ������
	public void addUser(User user) throws Exception;
	
	///������ Ȯ��
	public User getUser(String userNo) throws Exception;
	
	
	///������ ����
	public void updateUser(User user) throws Exception;

	///ȸ�� ID �ߺ� Ȯ��
	public boolean checkDuplication(String snsNo) throws Exception;
	
	///Ȱ�� ���� �߰�
	//public User addActiveScore(int totalActiveScore) throws Exception;
	public void addActiveScore(User user) throws Exception;
	
}
