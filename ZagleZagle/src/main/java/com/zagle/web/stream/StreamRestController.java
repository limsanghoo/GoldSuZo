package com.zagle.web.stream;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;


import com.zagle.service.domain.Refund;
import com.zagle.service.domain.Spon;
import com.zagle.service.domain.Stream;
import com.zagle.service.domain.User;
import com.zagle.service.stream.StreamService;
import com.zagle.service.stream.impl.StreamServiceImpl;
import com.zagle.service.user.UserService;

@Controller
@RequestMapping("/stream/*") 
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
	
	@RequestMapping(value = "json/start2", method = RequestMethod.GET)
	public String  startStream2(@RequestParam("price")String price,@RequestParam("streamerNo")String streamerNo,@RequestParam("userNo")String userNo,HttpSession session) throws Exception{

		System.out.println("get startstream2");
		System.out.println("price가 찍히니..??"+price+streamerNo+userNo);
		// System.out.println(body);
		User streamer = new User();
		User user = new User();
		streamer = userService.getUser2(streamerNo);
		user = userService.getUser2(userNo);
		Spon spon = new Spon();
		spon.setPrice(Integer.parseInt(price));
		spon.setStreamerNo(streamerNo);
		spon.setUserNo(userNo);
		spon.setPaymentNo("0"); 
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
		    params.add("approval_url","http://192.168.0.16:8080/stream/json/kakaoOkStream");
		    params.add("cancel_url","http://192.168.0.16:8080");
		    params.add("fail_url","http://192.168.0.16:8080");

		    // 서버로 요청할 Header 
		    HttpHeaders headers = new HttpHeaders();
		    headers.add("Authorization","KakaoAK "+"afd426e1a2275871414bee8f57f4f304");
		    headers.add("Content-Type",MediaType.APPLICATION_FORM_URLENCODED_VALUE +";charset=UTF-8");

		    HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		    Map response = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), request, Map.class);
		    System.out.println(response.get("next_redirect_pc_url"));
		    session.setAttribute("tid", response.get("tid"));
		    session.setAttribute("spon",spon);
		    session.setAttribute("user",user);
		    session.setAttribute("streamer",streamer);
		    session.setAttribute("price",price);
			System.out.println("session저장확인"+session.getAttribute("tid")+session.getAttribute("spon"));
				 
			return "redirect:"+response.get("next_redirect_pc_url");
		
	}
	
	/*@RequestMapping(value = "json/start", method = RequestMethod.POST)
	@ResponseBody 
	public Map startStream(@RequestBody Spon spon,HttpSession session) throws Exception{
			System.out.println("start메소드입니다..............");
		System.out.println(spon); 
			spon.setPaymentNo("0");
		// System.out.println(body);
	      RestTemplate restTemplate = new RestTemplate();
	      
		    // 서버로 요청할 Body
		    MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		    params.add("cid","TC0ONETIME");
		    params.add("partner_order_id",spon.getUserNo());
		    params.add("partner_user_id",spon.getUserNo());
		    params.add("item_name","스트리밍후원");
		    params.add("quantity","1");
		    params.add("total_amount",spon.getPrice()+"");
		    params.add("tax_free_amount","0");
		    params.add("approval_url","http://192.168.0.16:8080/stream/json/kakaoOkStream?");
		    params.add("cancel_url","http://192.168.0.16:8080");
		    params.add("fail_url","http://192.168.0.16:8080");

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
		//   ModelAndView modelAndView = new ModelAndView();
		 //  modelAndView.setViewName("jsonView");  
		   String url =(String) response.get("next_redirect_pc_url");
		 // modelAndView.addObject("purchase",purchase);
		 //  modelAndView.addObject("url", response.get("next_redirect_pc_url"));
		  // return modelAndView;
		  //  return "redirect:"+response.get("next_redirect_pc_url");
		   return response;
				} */
	 
	@RequestMapping(value="json/addStream",method=RequestMethod.GET)
	public ModelAndView addStream(@RequestParam("userNo")String userNo) throws Exception{
		
	User user = userService.getUser(userNo);
	Stream stream = new Stream();
	stream.setUser(user);
	System.out.println("addStream[stream]="+stream);
	streamService.addStream(stream);
	
	ModelAndView view = new ModelAndView("redirect:https://192.168.0.16:443/streamer="+user.getUserNo()+"&userName="+user.getUserNickname());
	return view;	
	}
	
	 
@RequestMapping(value="json/kakaoOkStream",produces = "application/text; charset=utf-8; pageEncoding=UTF-8; ")
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
		   streamService.addSpon(spon);
		  	ModelAndView modelAndView = new ModelAndView();
			//modelAndView.setViewName("redirect:https://192.168.0.12:443/stream/join?streamer="+spon.getStreamerNo()+"&userNo="+spon.getUserNo()+"&userNickname=user02&userProfile=default.jpg");
		  //	modelAndView.setViewName("/stream/Close");
		  	System.out.println("close.jsp로 갑니다");
		  	User user = (User) session.getAttribute("user");
		  	User streamer = (User) session.getAttribute("streamer");
		  	System.out.println("user닉네임===================="+user.getUserNickname());
		  //	String url  = "https://192.168.0.47/stream/sponSpeech2?streamer="+streamer.getUserNo()+"&userNo="+user.getUserNo()+"&userNickname="+user.getUserNickname()+"&userProfile=default.jpg&price="+session.getAttribute("price");
		  //	String encodeResult = URLEncoder.encode(url, "UTF-8");
//System.out.println(encodeResult);
		String encode =  	URLEncoder.encode(user.getUserNickname(),"UTF-8");
		System.out.println("인코딩 한 후 닉네임================"+encode);
		 	//ModelAndView view = new ModelAndView("redirect:"+url); 
		 	ModelAndView view = new ModelAndView("redirect:https://192.168.0.16:443/stream/sponSpeech2?streamer="+streamer.getUserNo()+"&userNo="+user.getUserNo()+"&userNickname="+encode+"&userProfile=default.jpg&price="+session.getAttribute("price"));
		//	ModelAndView view = new ModelAndView("redirect:http://192.168.0.12:8080/stream/));
			//modelAndView.setViewName("forward:/view/stream/close.jsp");	
		  	return view; 
	}
	 
	/*
	@RequestMapping(value="json/kakaoOkStream")
	public ModelAndView kakaoOkStream(@RequestParam("pg_token") String pg_token,HttpSession session) throws Exception{
		System.out.println("add/kakao=================");
			Spon spon = (Spon) session.getAttribute("spon");
			String tid = String.valueOf(session.getAttribute("tid"));
			System.out.println("pg_token===="+pg_token);
			String aa = String.valueOf(session.getAttribute("아니"));
			System.out.println(aa);
			System.out.println(tid);
			//System.out.println(spon);
		  	User user = (User) session.getAttribute("user");
		  	User streamer = (User) session.getAttribute("streamer");
		
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
		    headers.add("Authorization","KakaoAK "+"afd426e1a2275874747bee8f57f4f304");
		    headers.add("Content-Type",MediaType.APPLICATION_FORM_URLENCODED +";charset=UTF-8");

		    HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		    Map response = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), request, Map.class);
		   streamService.addSpon(spon);
		  	ModelAndView modelAndView = new ModelAndView();
			//modelAndView.setViewName("redirect:https://192.168.0.12:443/stream/join?streamer="+spon.getStreamerNo()+"&userNo="+spon.getUserNo()+"&userNickname=user02&userProfile=default.jpg");
		  //	modelAndView.setViewName("/stream/Close");
		  	try {
	            String apiURL = "https://192.168.0.12/stream/sponSpeech?streamer="+streamer.getUserNo()+"&userNo="+user.getUserNo()+"&userNickname="+user.getUserNickname()+"&userProfile=default.jpg&price="+session.getAttribute("price");
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            System.out.println("responseCode :"+responseCode);
	            
	            String inputLine;
	            StringBuffer response2 = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	            	response2.append(inputLine);
	            }
	        	   br.close();}
		  	catch (Exception e) {
		            System.out.println(e);
		        }
	         
	            System.out.println(response.toString());
		  	
		  	System.out.println("close.jsp로 갑니다");
		  	
		  	
		  	//ModelAndView view = new ModelAndView("redirect:https://192.168.0.12/stream/sponSpeech?streamer="+streamer.getUserNo()+"&userNo="+user.getUserNo()+"&userNickname="+user.getUserNickname()+"&userProfile=default.jpg&price="+session.getAttribute("price"));
		//	ModelAndView view = new ModelAndView("redirect:http://192.168.0.12:8080/stream/));
			modelAndView.setViewName("forward:/view/stream/close.jsp");	
		  	return modelAndView;
	} */
	
	
	@RequestMapping(value="json/inicisStream", method = RequestMethod.POST)   
	@ResponseBody 
	public Map<String,Object> inicisStream(@RequestBody Spon spon,HttpSession session) throws Exception{
		System.out.println("inicisStream==== ");
		System.out.println("inicisStream==== spon =>"+spon);
		String userNo = spon.getUserNo();
		String streamerNo = spon.getStreamerNo();
		User user = userService.getUser2(userNo);
		User streamer = userService.getUser2(streamerNo);
		Refund refund = new Refund();
		refund.setAccount(streamer.getAccount());
		refund.setBankname(streamer.getBankName());
		refund.setPrice(spon.getPrice()); 
		refund.setStreamerNickname(user.getUserNickname());
	 	//ModelAndView modelAndView = new ModelAndView(); 
		Map<String,Object> map = new HashMap<String,Object>();
		String encode =  	URLEncoder.encode(user.getUserNickname(),"UTF-8");
		System.out.println("인코딩 한 후 닉네임================"+encode);
		map.put("userNo","https://192.168.0.16:443/stream/sponSpeech2?streamer="+streamer.getUserNo()+"&userNo="+user.getUserNo()+"&userNickname="+encode+"&userProfile=default.jpg&price="+spon.getPrice());
		System.out.println("map결과"+map);
		return map; 
 
	}
	
	@RequestMapping(value="json/listSpon", method = RequestMethod.GET)   
	@ResponseBody 
	public Map<String,Object>listSpon(HttpSession session) throws Exception{
	
		User user = (User)session.getAttribute("user");
	//	User user = new User();
		//user.setUserNo("US10001");
		Map<String,Object> map= new HashMap();
		List<String>list = streamService.listSpon(user.getUserNo());
		System.out.println(list); 
		//int price = Integer.parseInt(list.get(2));
		//int realprice = (int) (price * 0.3);
		//System.out.println(realprice); 
		int price=0;
	
	 
		map.put("list",list);
	 	ModelAndView modelAndView = new ModelAndView(); 
		modelAndView.addObject("list", list);
		 
		return map;
 
	}
	
	
	@RequestMapping(value="json/updateRefund", method = RequestMethod.GET)
	@ResponseBody
	public String updateRefund(@RequestParam("check")String check,@RequestParam("refundNo")String refundNo) throws Exception{

		System.out.println("@PathVariable===>"+check);
		Map<String,Object>map = new HashMap(); 
		
		map.put("check",check);
		map.put("refundNo",refundNo);
		streamService.updateRefund(map);
		//ModelAndView modelAndView = new ModelAndView(); 
		// modelAndView.setViewName("jsonView");  
	
		if(check.equals("0")) {
			//modelAndView.addObject("check",1);
			return "1";
		}else {
		//	modelAndView.addObject("check",2);
			return "0"; 
		}
				
	}
	

	@RequestMapping(value="json/checkBan", method = RequestMethod.GET)
	@ResponseBody
	public String checkBan(@RequestParam("userNo")String userNo,@RequestParam("streamer")String streamer) throws Exception{

		System.out.println("@PathVariable===>"+userNo+streamer);
		Map<String,Object>map = new HashMap(); 
		map.put("userNo",userNo);
		map.put("streamer",streamer);
		int result = (int) streamService.checkBan(map);
		String string = String.valueOf(result);
		//ModelAndView modelAndView = new ModelAndView(); 
		// modelAndView.setViewName("jsonView");  
	return string; 
	}
	
	@RequestMapping(value="json/addRefund",method=RequestMethod.POST)
	@ResponseBody
	public String addRefund(@RequestBody Map<String,Object> map ) throws Exception{
		System.out.println("JSON....  addRefund=========");
		System.out.println(map);
		String test = String.valueOf(map.get("price"));
		System.out.println(test);
		float test2 = Float.parseFloat(test);
		System.out.println(test2);
		int result2 = (int) (test2/10*10); 
		System.out.println(test2); 
	//	User user = userService.getUser2((String)map.get("streamerNo"));
		User user = userService.getUser2((String)map.get("streamerNo"));
		System.out.println("getUser됏니?"+user);
		Refund refund = new Refund();
		refund.setStreamerNo(user.getUserNo());
		refund.setStreamerNickname(user.getUserNickname());
		System.out.println("refund 도메인111"+refund);
		refund.setPrice(result2);  
		refund.setAccount(user.getAccount());
		refund.setBankname(user.getBankName());
		System.out.println("refund 도메인22"+refund);
		streamService.addRefund(refund);
		System.out.println(refund);
		String result = "성공";
		return result;
	}
	

	
	
}
	
	
	