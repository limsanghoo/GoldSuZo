package com.zagle.service.admin;

import java.util.List;

import com.zagle.common.Search;
import com.zagle.service.domain.BlackList;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Report;
import com.zagle.service.domain.User;

public interface AdminDao {
	
	///SELECT BLACK OBJECT LIST
	public List<User> listBlackObject(Search search) throws Exception;
	
	///SELECT BLACKLIST
	public List<BlackList> listBlackList(Search search) throws Exception;
	
	///UPDATE 
	public void updateReport(Report report) throws Exception;
	
	///보드 블라인드 처리
	public void addBlind(Board board) throws Exception;
	
	///코맨트 블라인드 처리
	public void addBlind(Comment comment) throws Exception;
	
	///보드 블라인드 해지
	public void cancelBlind(Board board) throws Exception;
	
	///코맨트 블라인드 해지
	public void cancelBlind2(Comment comment) throws Exception;
	
	///블라인드 보드 삭제
	public void deleteBlind(Board board) throws Exception;
	
	///블라인드 코맨트 삭제
	public void deleteBlind2(Comment commnet) throws Exception;
	
	///블랙리스트 코드 체크
	public void checkBlack(User BlackCode) throws Exception;
	
	
	

}
