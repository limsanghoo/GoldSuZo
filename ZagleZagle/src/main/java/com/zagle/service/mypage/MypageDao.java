package com.zagle.service.mypage;

import java.util.List;
import java.util.Map;

import com.zagle.common.Search;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Like;
import com.zagle.service.domain.Scrap;
import com.zagle.service.domain.SearchBoard;
import com.zagle.service.domain.SearchMypage;
import com.zagle.service.domain.User;

public interface MypageDao {
	
	///INSERT
	public void addAccount(User user) throws Exception;
	
	///UPDATE
	public void updateAccount(User user) throws Exception;
	
	///SELECT LIST
	public List<Comment> commentList(SearchMypage search) throws Exception;
	
	///SELECT LIST
	public List<Like> likeList(SearchMypage search) throws Exception;
	

	
	///SELECTE LIST
	public List<Scrap> ScrapList(SearchMypage search) throws Exception;
	
	public List<Board> MyBoardList(SearchMypage search) throws Exception;
	
	public User checkAccount(User user) throws Exception;
	
	public int getTotalScrapList(SearchMypage search) throws Exception ;
	
	public int getTotalBoardList(SearchMypage search) throws Exception;
	
	public int getTotalCommentList(SearchMypage search) throws Exception;
	
	public int getTotalLikeList(SearchMypage search) throws Exception;
	
	public boolean getCheckLike(Map<String,String> map) throws Exception;
}
