package com.zagle.web.board;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.zagle.service.admin.AdminService;
import com.zagle.service.board.BoardService;
import com.zagle.service.chat.ChatService;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Comment;
import com.zagle.service.domain.Report;
import com.zagle.service.domain.SearchBoard;
import com.zagle.service.domain.User;
import com.zagle.service.user.UserService;


@Controller
@RequestMapping("/board/*")
public class BoardController {	
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	/*@Autowired
	@Qualifier("chatServiceImpl")
	private ChatService chatService;
	
	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminService;*/
	
	public BoardController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="addBoard", method=RequestMethod.GET)
	public ModelAndView addBoard() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="addBoard", method=RequestMethod.POST)
	public ModelAndView addBoard(@ModelAttribute("board") Board board, @RequestParam("userNo") String userNo, MultipartHttpServletRequest mtfRequest) throws Exception{
		
		System.out.println("/addBoard POST");
		
		String finalFileName="";
		
		List<MultipartFile> fileList = mtfRequest.getFiles("file");

        String path = "C:\\Users\\Bit\\git\\GoldSuZo\\ZagleZagle\\WebContent\\common\\images\\board";

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);

            //String safeFile = path+ originFileName;
            try {
                mf.transferTo(new File(path, originFileName));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
                     
        finalFileName+=originFileName+",";
    		
        }
        
        System.out.println("finalFileName : "+finalFileName);
  
        String[] photo=finalFileName.split(",");
        
        if(photo.length==1) {
        	board.setPhoto1(photo[0]);
        }else if(photo.length==2) {
        	board.setPhoto1(photo[0]);
        	board.setPhoto2(photo[1]);
        }else if(photo.length==3) {
        	board.setPhoto1(photo[0]);
        	board.setPhoto2(photo[1]);
        	board.setPhoto3(photo[2]);
        }

		board.setUser(userService.getUser(userNo));
		board.setBoardStatus("1");//정상 게시물
		
		System.out.println(board);
		
		boardService.addBoard(board);
        
		ModelAndView modelAndView=new ModelAndView();
	
		modelAndView.setViewName("forward:/view/board/getBoard.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addComment", method=RequestMethod.POST)
	public ModelAndView addComment(@ModelAttribute("comment") Comment comment) throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="addLike", method=RequestMethod.GET)
	public ModelAndView addLike() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="addLink", method=RequestMethod.GET)
	public ModelAndView addLink() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="addReport", method=RequestMethod.GET)
	public ModelAndView addReport() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="addReport", method=RequestMethod.POST)
	public ModelAndView addReport(@ModelAttribute("report") Report report) throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="addScrap", method=RequestMethod.GET)
	public ModelAndView addScrap() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="cancelLike", method=RequestMethod.GET)
	public ModelAndView cancelLike() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="deleteBoard", method=RequestMethod.GET)
	public ModelAndView deleteBoard(@ModelAttribute("board") Board board) throws Exception{
		
		System.out.println("/deleteBoard");
		
		board.setBoardStatus("2");//게시물 삭제
		
		System.out.println(board);
		
		boardService.deleteBoard(board);
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("redirect:/board/listBoard");
		
		return modelAndView;
	}
	
	@RequestMapping(value="deleteComment", method=RequestMethod.GET)
	public ModelAndView deleteComment() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="getBoard", method=RequestMethod.GET)
	public ModelAndView getBoard(@RequestParam("boardNo") String boardNo) throws Exception{
		
		System.out.println("/getBoard");		
		
		Board board=boardService.getBoard(boardNo);
		
		User user=userService.getUser(board.getUser().getUserNo());
		
		board.setUser(user);
		
		System.out.println(board);
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("board", board);
		modelAndView.setViewName("forward:/view/board/getBoard.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="getHotTag", method=RequestMethod.GET)
	public ModelAndView getHotTag() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="listBoard", method=RequestMethod.GET)
	public ModelAndView listBoard(@ModelAttribute("searchBoard") SearchBoard searchBoard, HttpServletRequest request) throws Exception{
		
		System.out.println("/listBoard");
		
		System.out.println(searchBoard);
		
		if(searchBoard.getCurrentPage()==0) {
			searchBoard.setCurrentPage(1);
		}
		
		searchBoard.setPageSize(pageSize);
		
		Map<String , Object> map=boardService.listBoard(searchBoard);
		
		System.out.println("컨트롤러 map : "+map);
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		//modelAndView.addObject("searchBoard", searchBoard);//아직 사용 안함
		modelAndView.setViewName("forward:/view/board/listBoard.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="updateBoard", method=RequestMethod.GET)
	public ModelAndView updateBoard(@RequestParam("boardNo") String boardNo) throws Exception{
		
		System.out.println("updateBoard GET");
		
		System.out.println("boardNo : "+boardNo);
	
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("board", boardService.getBoard(boardNo));
		modelAndView.setViewName("forward:/view/board/updateBoard.jsp");

		
		return modelAndView;
	}
	
	@RequestMapping(value="updateBoard", method=RequestMethod.POST)
	public ModelAndView updateBoard(@ModelAttribute("board") Board board, @RequestParam("userNo") String userNo, MultipartHttpServletRequest mtfRequest) throws Exception{
		
		System.out.println("updateBoard POST");	
		
		String finalFileName="";
		
		List<MultipartFile> fileList = mtfRequest.getFiles("file");

        String path = "C:\\Users\\Bit\\git\\GoldSuZo\\ZagleZagle\\WebContent\\common\\images\\board";

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);

            //String safeFile = path+ originFileName;
            try {
                mf.transferTo(new File(path, originFileName));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }        
            
        finalFileName+=originFileName+",";
          		
        }
        
        System.out.println("finalFileName : "+finalFileName);
  
        String[] photo=finalFileName.split(",");
        
        if(photo.length==1) {
        	board.setPhoto1(photo[0]);
        }else if(photo.length==2) {
        	board.setPhoto1(photo[0]);
        	board.setPhoto2(photo[1]);
        }else if(photo.length==3) {
        	board.setPhoto1(photo[0]);
        	board.setPhoto2(photo[1]);
        	board.setPhoto3(photo[2]);
        }

		board.setUser(userService.getUser("4"));//userNo으로 바꿔야함
		board.setBoardStatus("1");//정상 게시물
		
		System.out.println(board);
		
		boardService.updateBoard(board);
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("forward:/view/board/getBoard.jsp");
		
		return modelAndView;
	}

}
