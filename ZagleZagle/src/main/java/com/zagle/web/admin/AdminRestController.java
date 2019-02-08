package com.zagle.web.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;
import com.zagle.service.admin.AdminService;
import com.zagle.service.board.BoardService;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Mypage;
import com.zagle.service.domain.Report;
import com.zagle.service.domain.SearchAdmin;
import com.zagle.service.domain.SearchMypage;
import com.zagle.service.domain.User;
import com.zagle.service.mypage.MypageService;
import com.zagle.service.user.UserService;

@RestController
@RequestMapping("/admin/*")

public class AdminRestController {

	///Field
	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminService;
	@Autowired
	@Qualifier("mypageServiceImpl")
	private MypageService mypageService;
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	
	public AdminRestController() {
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping( value="json/getReportList/{userNo}" , method=RequestMethod.GET)
	public List getReport(@PathVariable String userNo) throws Exception {
		
		System.out.println("/admin/json/getReporList : GET ");
		
		System.out.println(userNo);
		
		
		SearchAdmin search = new SearchAdmin();
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		
		User user = new User();
		user.setUserNo(userNo);
		
		Report checkReport = new Report();
		checkReport.setReportedUserNo(user);
		
		System.out.println(checkReport);
		
		search.setCheckReport(checkReport);
		
	
		
		Map<String, Object> map = adminService.getReportList(search);

		List<Object> list = (List<Object>) map.get("list");
		
		
		
		System.out.println("리스트 값 :"+list);
		
		return list;
	}
	@RequestMapping(value="json/userBlindList/{userNo}" ,method=RequestMethod.GET)
	public List userBlindList(@PathVariable String userNo) throws Exception {
		
		System.out.println("=========json/userBlindList/{userNo}=========");
		
		System.out.println(userNo);
		
		////User 본인이 작성한 게시물, 댓글을 가져와서.
		///블라인드 테이블에 등록되어있는지 확인한후
		///화면단에 표시 하기.
		
		
		
		SearchMypage mySearch = new SearchMypage();
		User user = userService.getUser2(userNo);
		
		
		mySearch.setMyUser(user);

	
		Map<String, Object> Mymap = mypageService.listMyBoard(mySearch);
		List<Object> list = (List<Object>) Mymap.get("list");
		
		System.out.println("작성한 게시물 확인 :"+list);
		
		

		ArrayList list1 = (ArrayList) Mymap.get("list");
		System.out.println("일단 확인"+list);
		
		List<Board> bdList = new ArrayList<Board>();
		
		for (int i = 0; i < list.size(); i++) {
		
			Mypage mp = (Mypage)list.get(i);
			String bdNo = mp.getBoard().getBoardNo();
			Board bd = boardService.getBoard(bdNo);
			bdList.add(bd);
		    
			System.out.println(bdList);
			
	
	}
	 
		return null;
}
	@RequestMapping(value="json/getComment/{commentNo}", method=RequestMethod.GET )
	public Comment getComment(@PathVariable String commentNo) throws Exception {
		
		System.out.println("/admin/json/getComment : GET");
		
		System.out.println("코멘트 넘버 확인 "+commentNo);
		
		return adminService.getComment(commentNo);
	}

}
