package com.zagle.service.mypage;

import java.util.Map;

import com.zagle.common.Search;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.SearchMypage;
import com.zagle.service.domain.User;

public interface MypageService {
	
	public void addAccount(User user) throws Exception;
	
	public void updateAccount(User user) throws Exception;
	
	public Map<String, Object> listComment(SearchMypage search) throws Exception;
	
	public Map<String, Object> listLike(SearchMypage search) throws Exception;
	
	public Map<String, Object> listScrap(SearchMypage search) throws Exception;
	
	public Map<String, Object> listMyBoard(SearchMypage search) throws Exception;
	
	public Boolean checkAccount(String realName, String userNo) throws Exception;
	
	public Boolean checkLike(Map<String,String>map) throws Exception;
	
	


}
