package com.zagle.web.stream;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.zagle.service.domain.SearchStream;
import com.zagle.service.domain.Stream;
import com.zagle.service.domain.User;
import com.zagle.service.stream.StreamService;
import com.zagle.service.user.UserService;

@Controller
@RequestMapping("/stream/*")
public class StreamController {

	@Autowired
	@Qualifier("streamServiceImpl")
	private StreamService streamService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public StreamController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="addStream",method=RequestMethod.POST)
	public ModelAndView addStream(@ModelAttribute("stream")Stream stream,MultipartHttpServletRequest mtfRequest) throws Exception{
		System.out.println("Add controlloer");
		System.out.println("stream모델 받은거"+stream);
		
			String finalFileName="";
		
		List<MultipartFile> fileList = mtfRequest.getFiles("file");

        String path = "C:\\Users\\Bit\\git\\GoldSuZo\\ZagleZagle\\WebContent\\common\\images\\stream";

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
    		stream.setStreamSum(originFileName);
            System.out.println("fileSize : " + fileSize);

            //String safeFile = path+ originFileName;
            try {
                mf.transferTo(new File(path, originFileName));
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        
		String stringdate = "2018-01-11";
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(stringdate);
		System.out.println(date);
		User user = userService.getUser2("US10001");
		System.out.println(user);
		stream.setUser(user);  
		stream.setStreamDate(date);

		System.out.println("addStream[stream]="+stream);
		streamService.addStream(stream);
	
	ModelAndView modelAndView = new ModelAndView();
	modelAndView.addObject("streamer",stream.getUser().getUserNo());
	modelAndView.addObject("userNo",stream.getUser().getUserNo());
	modelAndView.setViewName("redirect:http://localhost:3000/stream/add");
	return modelAndView;
	}
	  
	
	
	
	@RequestMapping(value="listStream",method=RequestMethod.GET)
	public ModelAndView listStream() throws Exception{
		
	 	SearchStream search = new SearchStream();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = streamService.listStream(search);	 	
	 	List<Object> list = (List<Object>)map.get("list");

     	System.out.println(list.toString());
     	
     	for(int i=0; i<list.size(); i++) {
     		System.out.println(list.get(i));
     	}
     	ModelAndView modelandview = new ModelAndView();
     	modelandview.addObject("list", map.get("list"));
     	modelandview.setViewName("/view/stream/listStream.jsp");
     	
	return modelandview;
	}
	
	
	@RequestMapping(value="spon",method=RequestMethod.GET)
	public ModelAndView sponStream(@RequestParam("userNo")String userNo,@RequestParam("streamerNo")String streamerNo,HttpSession session) throws Exception{
		
	 session.setAttribute("뭐야","대체");
     	ModelAndView modelandview = new ModelAndView();
     	modelandview.setViewName("/view/stream/sponStream.jsp");
     	
	return modelandview;
	}
	
	
	
	
}