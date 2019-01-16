package com.zagle.web.stream;

import java.net.URI;
import java.util.HashMap;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


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

import com.zagle.service.domain.Spon;
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
	
	@RequestMapping(value = "start2", method = RequestMethod.GET)
	public String  startStream2(@RequestParam("price")String price,@RequestParam("streamerNo")String streamerNo,@RequestParam("userNo")String userNo,HttpSession session) throws Exception{

		System.out.println("get startstream2");
		System.out.println("price가 찍히니..??"+price+streamerNo+userNo);
		// System.out.println(body);
		Spon spon = new Spon();
		spon.setPrice(price);
		spon.setStreamerNo(streamerNo);
		spon.setUserNo(userNo);
	      RestTemplate restTemplate = new RestTemplate();
	      
		    // 서버로 요청할 Body
		    MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		    params.add("cid","TC0ONETIME");
		    params.add("partner_order_id",userNo);
		    params.add("partner_user_id",userNo);
		    params.add("item_name","스트리밍후원");
		    params.add("quantity","1");
		    params.add("total_amount",price);
		    params.add("tax_free_amount","0");
		    params.add("approval_url","http://localhost:8080/stream/json/kakaoOkStream");
		    params.add("cancel_url","http://192.168.0.12:8080");
		    params.add("fail_url","http://192.168.0.12:8080");

		    // 서버로 요청할 Header 
		    HttpHeaders headers = new HttpHeaders();
		    headers.add("Authorization","KakaoAK "+"afd426e1a2275871414bee8f57f4f304");
		    headers.add("Content-Type",MediaType.APPLICATION_FORM_URLENCODED_VALUE +";charset=UTF-8");

		    HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		    Map response = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), request, Map.class);
		    System.out.println(response.get("next_redirect_pc_url"));
		    session.setAttribute("tid", response.get("tid"));
		    session.setAttribute("spon",spon);
			System.out.println("session저장확인"+session.getAttribute("tid")+session.getAttribute("spon"));
				 
				return "redirect:"+response.get("next_redirect_pc_url");
		
	}
	
	@RequestMapping(value = "start", method = RequestMethod.POST)
	public String startStream(@ModelAttribute("spon") Spon spon,HttpSession session) throws Exception{
			System.out.println(spon);
		// System.out.println(body);
	      RestTemplate restTemplate = new RestTemplate();
	      
		    // 서버로 요청할 Body
		    MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		    params.add("cid","TC0ONETIME");
		    params.add("partner_order_id",spon.getUserNo());
		    params.add("partner_user_id",spon.getUserNo());
		    params.add("item_name","스트리밍후원");
		    params.add("quantity","1");
		    params.add("total_amount",spon.getPrice());
		    params.add("tax_free_amount","0");
		    params.add("approval_url","http://localhost:8080/stream/json/kakaoOkStream?");
		    params.add("cancel_url","http://192.168.0.12:8080");
		    params.add("fail_url","http://192.168.0.12:8080");

		    // 서버로 요청할 Header 
		    HttpHeaders headers = new HttpHeaders();
		    headers.add("Authorization","KakaoAK "+"afd426e1a2275871414bee8f57f4f304");
		    headers.add("Content-Type",MediaType.APPLICATION_FORM_URLENCODED_VALUE +";charset=UTF-8");

		    HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		    Map response = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), request, Map.class);
		    System.out.println(response.get("next_redirect_pc_url"));
		    System.out.println(response);
		    session.setAttribute("tid",response.get("tid"));
		    session.setAttribute("spon",spon);
		    session.setAttribute("아니","왜");
		  //  ModelAndView modelAndView = new ModelAndView();
		   // modelAndView.setViewName("jsonView");
		  //  String url =(String) response.get("next_redirect_pc_url");
		  //  modelAndView.addObject("purchase",purchase);
		 //   modelAndView.addObject("url", response.get("next_redirect_pc_url"));
		    return "redirect:"+response.get("next_redirect_pc_url");
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
	
	
	@RequestMapping(value="kakaoOkStream")
	public ModelAndView kakaoOkStream(@RequestParam("pg_token") String pg_token,HttpSession session) throws Exception{
		System.out.println("add/kakao=================");
			Spon spon = (Spon) session.getAttribute("spon");
			String tid = String.valueOf(session.getAttribute("tid"));
			System.out.println("pg_token===="+pg_token);
			String aa = String.valueOf(session.getAttribute("아니"));
			System.out.println(aa);
			System.out.println(tid);
			//System.out.println(spon);
			RestTemplate restTemplate = new RestTemplate();

		    // 서버로 요청할 Body
		    MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		    params.add("cid","TC0ONETIME");
		    params.add("tid",tid);
		    params.add("partner_order_id",spon.getUserNo());
		    params.add("partner_user_id",spon.getUserNo());
		    params.add("pg_token",pg_token);
			
	    // 서버로 요청할 Header
		    HttpHeaders headers = new HttpHeaders();
		    headers.add("Authorization","KakaoAK "+"afd426e1a2275871414bee8f57f4f304");
		    headers.add("Content-Type",MediaType.APPLICATION_FORM_URLENCODED +";charset=UTF-8");

		    HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		    Map response = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), request, Map.class);
		  	ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("redirect:http://localhost:3000/stream/join?streamer="+spon.getStreamerNo()+"&userNo="+spon.getUserNo()+"&userNickname=user02&userProfile=default.jpg");
		return modelAndView;
 
	}

}
	
	
	