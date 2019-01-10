package com.zagle.service.mypage;

import java.util.List;

import com.zagle.common.Search;
import com.zagle.service.domain.User;

public interface MypageDao {
	
	///INSERT
	public void addAccount(User user) throws Exception;
	
	///UPDATE
	public void updateAccount(User user) throws Exception;
	
	///SELECT LIST
	public List<Comment> commentList(Search search) throws Exception;
	
	///SELECT LIST
	public List<Like> likeList(Search search) throws Exception;
	
	///SELECTE LIST
	public List<Scrap> ScrapList(Search search) throws Exception;
	
	public User getAccountCheck(User user) throws Exception;
	
	public int getTotalCount(Search search) throws Exception ;
}
