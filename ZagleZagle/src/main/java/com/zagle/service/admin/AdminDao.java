package com.zagle.service.admin;

import java.util.List;

import com.zagle.common.Search;
import com.zagle.service.domain.Admin;
import com.zagle.service.domain.BlackList;
import com.zagle.service.domain.Blind;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Report;
import com.zagle.service.domain.SearchAdmin;
import com.zagle.service.domain.User;

public interface AdminDao {
	
	///SELECT BLACK OBJECT LIST
	public List<User> listBlackObject(SearchAdmin search) throws Exception;
	
	///SELECT BLACKLIST
	public List<BlackList> listBlackList(SearchAdmin search) throws Exception;
	
	///SELECT USERLIST
	public List<User> listUser(SearchAdmin search) throws Exception;
	
	public List<Report> getReportList(SearchAdmin search) throws Exception;
	
	public Blind getBlind(String blindNo) throws Exception;
	
	public List<Blind> getBlindList(SearchAdmin search) throws Exception;
	///ADD
	public void addReport(Report report) throws Exception;
	
	///UPDATE 
	public void updateReport(Report report) throws Exception;
	
	///보드 블라인드 처리
	public void addBlind(Blind blind) throws Exception;
	
	///블라인드 코드 업데이트
	public void updateBlind(Blind blind) throws Exception;
	
	///코맨트 블라인드 처리
	//public void addBlind2(Comment comment) throws Exception;
	
	///보드 블라인드 해지
	//public void cancelBlind(Blind blind) throws Exception;
	
	///코맨트 블라인드 해지
	//public void cancelBlind2(Comment comment) throws Exception;
	
	///블라인드 보드 삭제
	//public void deleteBlind(Blind blind) throws Exception;
	
	///블라인드 코맨트 삭제
	///public void deleteBlind2(Comment commnet) throws Exception;
	

	
	///////
	public int getTotalCount(SearchAdmin search) throws Exception ;
	
	//////
	public int getTotalCount2(SearchAdmin search) throws Exception;
	
	public int getTotalCount3(SearchAdmin search) throws Exception;
	
	public int getTotalCount4(SearchAdmin search) throws Exception;
	
	public int getTotalCountBlind(SearchAdmin search) throws Exception;
	
	////블랙리스트 추가
	
	public void addBlackList(BlackList blackList) throws Exception;
	
	public void updateBlackCheckCode(BlackList blackList) throws Exception;
	
	///// 신고 카운팅 체크
	public int checkReportCount(Report report) throws Exception;
}
