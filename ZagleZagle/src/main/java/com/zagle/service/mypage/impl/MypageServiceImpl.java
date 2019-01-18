package com.zagle.service.mypage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zagle.common.Search;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Like;
import com.zagle.service.domain.Scrap;
import com.zagle.service.domain.SearchMypage;
import com.zagle.service.domain.User;
import com.zagle.service.mypage.MypageDao;
import com.zagle.service.mypage.MypageService;

@Service("mypageServiceImpl")
public class MypageServiceImpl implements MypageService {
	
	///Field
	@Autowired
	@Qualifier("mypageDAOImpl")
	private MypageDao mypageDao;
	public void setMypageDao(MypageDao mypageDao) {
		this.mypageDao = mypageDao;
	}
	
	public MypageServiceImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	public void addAccount(User user) throws Exception {
		mypageDao.addAccount(user);
	}


	public void updateAccount(User user) throws Exception {
		mypageDao.updateAccount(user);	
	}

	
	public Map<String, Object> listComment(SearchMypage search) throws Exception {
		List<Comment> list = mypageDao.commentList(search);
		//int totalCount = mypageDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		//map.put("totalCount", new Integer(totalCount));
		
		return map;
	}


	public Map<String, Object> listLike(SearchMypage search) throws Exception {
		List<Like> list = mypageDao.likeList(search);
		//int totalCount = mypageDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		//map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	public Map<String, Object> listScrap(SearchMypage search) throws Exception {
		List<Scrap> list = mypageDao.ScrapList(search);
		//int totalCount = mypageDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		//map.put("totalCount", new Integer(totalCount));
		
		return map;
		
	}
	public Map<String, Object> listMyBoard(SearchMypage search) throws Exception {
		
		List<Board> list = mypageDao.MyBoardList(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}

//	public User getAccountCheck(User user) throws Exception {
//		
//		return mypageDao.getAccountCheck(user);
//	}

	

}
