package com.zagle.service.mypage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.zagle.service.user.UserDao;

@Service("mypageServiceImpl")
public class MypageServiceImpl implements MypageService {
	
	///Field
	@Autowired
	@Qualifier("mypageDAOImpl")
	private MypageDao mypageDao;
	@Autowired
	@Qualifier("userDAOImpl")
	private UserDao userDao;
	
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
		int totalCount = mypageDao.getTotalCommentList(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}


	public Map<String, Object> listLike(SearchMypage search) throws Exception {
		List<Like> list = mypageDao.likeList(search);
		int totalCount = mypageDao.getTotalLikeList(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	public Map<String, Object> listScrap(SearchMypage search) throws Exception {
		List<Scrap> list = mypageDao.ScrapList(search);
		
		int totalCount = mypageDao.getTotalScrapList(search);
		
		System.out.println("토탈 카운트는? :"+totalCount);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
		
	}
	public Map<String, Object> listMyBoard(SearchMypage search) throws Exception {
		
		List<Board> list = mypageDao.MyBoardList(search);
		
		int totalCount = mypageDao.getTotalBoardList(search);
		
		System.out.println("토탈 카운트는? :"+totalCount);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}

	public Boolean checkAccount(String userName, String userNo) throws Exception {
		
		System.out.println("checkAccount Service 실행 확인하고");
		System.out.println("리얼 네임 값 확인"+userName);
		System.out.println("유저 넘 확인"+userNo);
		
		///////////////////////////////////////////////////////////////////////////////////////
		
		
		
		//User user = userDao.getUser3(userName);
		User user = userDao.getUser2(userNo);
		
		
		System.out.println("user 누구냐 :"+user);
		
		boolean result = false;
		
		
		if(user.getUserName().equals(userName)) {
			result = true;
		}
		return result;

	
		
	}

	

}
