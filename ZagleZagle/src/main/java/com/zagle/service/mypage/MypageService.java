package com.zagle.service.mypage;

import java.util.Map;

import com.zagle.common.Search;
import com.zagle.service.domain.User;

public interface MypageService {
	
	public void addAccount(User user) throws Exception;
	
	public void updateAccount(User user) throws Exception;
	
	public Map<String, Object> listComment(Search search) throws Exception;
	
	public Map<String, Object> listLike(Search search) throws Exception;
	
	public Map<String, Object> listScrap(Search search) throws Exception;
	
	public User getAccountCheck(User user) throws Exception;
	
	


}
