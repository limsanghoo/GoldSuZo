package com.zagle.web.board;

import java.net.URI;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.zagle.common.Search;
import com.zagle.service.board.BoardService;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Local;
import com.zagle.service.user.UserService;

@RestController
@RequestMapping("/board/*")
public class BoardRestController {
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public BoardRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="json/shareBoard", method=RequestMethod.GET)
	public ModelAndView shareBoard() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="json/addBoardDaumMap", method=RequestMethod.GET)
	public ModelAndView addBoardDaumMap() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="json/addBoardVisionTag", method=RequestMethod.GET)
	@ResponseBody
	public String addBoardVisionTag(@RequestParam("link")String link) throws Exception{
		
		System.out.println(link);
		
		RestTemplate restTemplate = new RestTemplate();

        //Body
        MultiValueMap<String,String> params = new LinkedMultiValueMap<String,String>();
        params.add("image_url",link);
        
        //Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization","KakaoAK "+"ad82a4d95c664fc2c5f0355fc6a70df7");
       
        HttpEntity<MultiValueMap<String,String>> request = new HttpEntity<MultiValueMap<String,String>>(params, headers);
        Map response = restTemplate.postForObject(new URI("https://kapi.kakao.com/v1/vision/multitag/generate"), request, Map.class);
       
        System.out.println(response);
        
        System.out.println(response.get("result"));
        
        /*String tag="{label=[food, sushi], label_kr=[음식, 초밥]}";

		String[] split=tag.split("\\[");
		
		String aaa=split[2];
		
		String bbb=aaa.replace("]", "").replace("}", "").replace(", ", "#");
		
		String ccc="#";
		
		String ddd=ccc+bbb;
		
		System.out.println(ddd);*/
        

        
        String result=response.get("result").toString();
        
        
        String[] split=result.split("\\[");
		
		String aaa=split[2];
		
		String bbb=aaa.replace("]", "").replace("}", "").replace(", ", "#");
		
		String ccc="#";
		
		String ddd=ccc+bbb;
		
		String eee=URLEncoder.encode(ddd, "utf-8");
		
		System.out.println(ddd);
        
        /*JSONObject obj=new JSONObject();
        obj.put("result", URLEncoder.encode(ddd, "utf-8"));*/

		
		return eee;
	}
	
	
	
	
	
	@RequestMapping(value="json/listMap", method=RequestMethod.GET)
	public ModelAndView listMap() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		
		return modelAndView;
	}
	
	@RequestMapping(value="json/listMap/getCity/{stateCode}",method=RequestMethod.GET)
	public List<Local> getCity(@PathVariable int stateCode) throws Exception{
		Local local = new Local();
		local.setStateCode(stateCode);
		List<Local> list = boardService.getCity(local);
		System.out.println(list);
		
		return list;
	}
	
	@RequestMapping(value="json/listMap/getTown/{cityCode}/{stateCode}",method=RequestMethod.GET)
	public List<Local> getTown(@PathVariable int cityCode, @PathVariable int stateCode) throws Exception{
		Local local = new Local();
		local.setCityCode(cityCode);
		local.setStateCode(stateCode);
		
		List<Local> list = boardService.getTown(local);
		System.out.println(list);
		
		return list;
	}
	
	@RequestMapping(value="json/listMap/getMaplist/{local}",method=RequestMethod.GET)
	public List<Board> getMaplist(@PathVariable String local) throws Exception{

		Search search = new Search();
		search.setSearchKeyword(local);
		
		List<Board> board = boardService.getMapList(search);
		
		
		return board;
	}
	

}
