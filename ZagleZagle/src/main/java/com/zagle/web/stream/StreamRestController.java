package com.zagle.web.stream;

import java.net.URI;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.sun.istack.internal.logging.Logger;
import com.zagle.service.domain.Stream;
import com.zagle.service.domain.User;
import com.zagle.service.stream.StreamService;
import com.zagle.service.user.UserService;

@Controller
@RequestMapping("/stream/json/") 
public class StreamRestController {

	private static final String HOST = "https://kapi.kakao.com";
	@Autowired
	@Qualifier("streamServiceImpl")
	private StreamService streamService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public StreamRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value = "start", method = RequestMethod.POST, consumes="application/json")
	public String  startStream(@RequestBody String body) throws Exception{
		String result = "흑흑";
		  System.out.println(body);
	        return result;
	}
	 
	
	
	@RequestMapping(value="addStream",method=RequestMethod.GET)
	public ModelAndView addStream(@RequestParam("userNo")String userNo) throws Exception{
		
	User user = userService.getUser(userNo);
	Stream stream = new Stream();
	stream.setUser(user);
	System.out.println("addStream[stream]="+stream);
	streamService.addStream(stream);
	
	ModelAndView view = new ModelAndView("redirect:localhost:3000/streamer="+user.getUserNo()+"&userName="+user.getUserNickname());
	return view;	
	}
	
	@RequestMapping(value="kakaoStream",method=RequestMethod.POST)
	@ResponseBody
	public String payStream(@RequestParam("price")String price,@RequestParam("userNo")String userNo,@RequestParam("streamerNo")String streamerNo,HttpSession session ) throws Exception{
		System.out.println("payStream====");
		 ModelAndView modelandview = new ModelAndView();
		//System.out.println(httpParam);
		 System.out.println(price+userNo+streamerNo);
		JSONParser jsonParser = new JSONParser();
		User user = userService.getUser2(userNo);
		User streamer = userService.getUser2(streamerNo);
		Map<String,Object>spon = new HashMap<String,Object>();
		spon.put("user",user);
		spon.put("streamer",streamer);
		spon.put("price",price);
     //   JSONArray insertParam = (JSONArray) jsonParser.parse(httpParam);

      //  for(int i=0; i<insertParam.size(); i++){

            //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
           // JSONObject insertData = (JSONObject) insertParam.get(i);
            	//System.out.println(insertData);
               // modelandview.addObject("result", insertData);
	RestTemplate restTemplate = new RestTemplate();

	    // 서버로 요청할 Body
	    MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	    params.add("cid","TC0ONETIME");
	    params.add("partner_order_id",user.getUserNo());
	    params.add("partner_user_id",user.getUserName());
	    params.add("item_name","스트리밍후원");
	    params.add("quantity","1");
	    params.add("total_amount",price);
	    params.add("tax_free_amount","0");
	    params.add("approval_url","http://192.168.0.26:8080/stream/json/kakaoOkstream");
	    params.add("cancel_url","http://192.168.0.26:8080");
	    params.add("fail_url","http://192.168.0.26:8080");

	    // 서버로 요청할 Header 
	    HttpHeaders headers = new HttpHeaders();
	    headers.add("Authorization","KakaoAK "+"afd426e1a2275871414bee8f57f4f304");
	    headers.add("Content-Type",MediaType.APPLICATION_FORM_URLENCODED_VALUE +";charset=UTF-8");

	    HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
	    Map response = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), request, Map.class);
	    System.out.println(response.get("next_redirect_pc_url"));
	    System.out.println(response);
	    session.setAttribute("tid", response.get("tid"));
	    session.setAttribute("spon",spon);
	    ModelAndView modelAndView = new ModelAndView();
	    modelAndView.setViewName("jsonView");
	    String url =(String) response.get("next_redirect_pc_url");
	  //  modelAndView.addObject("purchase",purchase);
	    modelAndView.addObject("url", response.get("next_redirect_pc_url"));
		return url;
        
	}
}
	
	
	