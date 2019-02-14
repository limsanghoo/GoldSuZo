package com.zagle.web.mypage;

import java.io.BufferedReader;

import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.http.NameValuePair;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;

import org.json.simple.JSONObject;

import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;

import org.springframework.http.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.zagle.service.board.BoardService;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.Mypage;
import com.zagle.service.domain.SearchMypage;
import com.zagle.service.domain.User;
import com.zagle.service.mypage.MypageService;
import com.zagle.service.user.UserService;

@RestController
@RequestMapping("/mypage/*")
public class MypageRestController {
	
	
	@Autowired
	@Qualifier("mypageServiceImpl")
	private MypageService mypageService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	private RestTemplate restTemplate = new RestTemplate();
	
	
	public MypageRestController() {
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value="getBankCode", produces="application/json")
	public ModelAndView getBankCode(@RequestParam("account") String account, @RequestParam("bankName") int bankName, 
																								HttpSession session) throws Exception {
		
		
		System.out.println("account :"+account);
		System.out.println("인증 코드 요청 시작");
		System.out.println("은행 이름 확인 :"+bankName);
		
		//HttpClient httpClient = new DefaultHttpClient();
		final String RequestUrl = "https://testapi.open-platform.or.kr/oauth/2.0/token";
		final String client_id ="l7xx60c67b59db9e4130aad0b4d113a9e890";
		final  String client_secret="1efe286e56a94d85a44d7c0d7d19a144";
		 final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		
		    MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		    
		    params.add("grant_type", "client_credentials");
	        params.add("client_id", client_id);
	        params.add("client_secret", client_secret);
	        params.add("scope", "oob");
		

			HttpPost httpPost = new HttpPost(RequestUrl);
			//httpPost.setHeader("Accept", "application/json");
			//httpPost.setHeader("Content-Type", "application/json");
	
		httpPost.addHeader("Content-Type", "x-www-form-urlencoded; charset=UTF-8");
	       HttpHeaders headers = new HttpHeaders();
	       headers.add("Accept", "application/json");
	       //headers.add("Content-Type",MediaType.APPLICATION_FORM_URLENCODED_VALUE +";charset=UTF-8");
	    
	       HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
	        Map response1 = restTemplate.postForObject(new URI(RequestUrl), request, Map.class);
	        
	       System.out.println("response :"+response1);
	       System.out.println(response1.get("access_token"));
	       
	       session.setAttribute("BankAccessToken", response1.get("access_token"));
	       
	       
	        ModelAndView modelAndView = new ModelAndView();
	        modelAndView.addObject("bankName", bankName);
	        modelAndView.addObject("account", account);
	        modelAndView.setViewName("confirmName");
	        
	        return modelAndView;
	       
	}
	
	
	
	@RequestMapping(value="bankCallback")
	public ModelAndView bankCallBack(@RequestParam("code") String code,  HttpSession session) throws Exception {
		System.out.println("=============은행공동권 콜백 처리=============");
		System.out.println("코드값 :"+code);
		
	final String RequestURL = "https://testapi.open-platform.or.kr/oauth/2.0/token";
	 final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
	 
	final String client_id ="l7xx60c67b59db9e4130aad0b4d113a9e890";
	final String callBackURL ="http://192.168.0.35:8080/mypage/bankCallback";
	
	  HttpHeaders headers = new HttpHeaders();
	headers.add("Accept", "application/json");
	
	 
	   MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
       params.add("grant_type", "authorization_code");
       params.add("client_id", client_id);
       params.add("client_secret", "1efe286e56a94d85a44d7c0d7d19a144");
       params.add("redirect_uri", "http://192.168.0.35:8080/mypage/bankCallback");
       params.add("code", code);
  
       

		HttpGet httpGet = new HttpGet(RequestURL);
	
       
       HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
       Map response = restTemplate.postForObject(new URI(RequestURL), request, Map.class);
       
       System.out.println(response);
       String token = (String) response.get("access_token");
    
      session.setAttribute("token", token);
	
	ModelAndView modelAndView = new ModelAndView();
	modelAndView.setViewName("confirmName");
	
	return modelAndView;
	
	}
	
	@RequestMapping(value="confirmName")
	public ModelAndView confrimName(HttpSession session, HttpServletRequest req) throws Exception {
		
		System.out.println("===================제발 되라 시바===============");
		
	    
		final String RequestURL ="https://testapi.open-platform.or.kr/inquiry/real_name";
		
		final String accessToken = (String) session.getAttribute("BankAccessToken");
		
		URL url = new URL(RequestURL);
       HttpURLConnection conn = (HttpURLConnection) url.openConnection();
       conn.setDoOutput(true);
       conn.setRequestMethod("POST");
       conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
       conn.setRequestProperty("Authorization", "Bearer "+accessToken);
       
       OutputStreamWriter osw = new OutputStreamWriter(conn.getOutputStream());
       
       String account = (String) req.getAttribute("account");
       System.out.println(account);
       
       
       int bankName = (int) req.getAttribute("bankName");
       
       User user = new User();
       
       user = (User) session.getAttribute("user");
       user.getUserBirth();
       
       
       
      JSONObject json = new JSONObject();
       json.put("bank_code_std", bankName);
       json.put("account_num", account);
       json.put("account_holder_info",  user.getUserBirth());
       json.put("tran_dtime", "20190118191633");
       
       
       System.out.println("json.toString() :"+json.toString());
       
       osw.write(json.toString());
       osw.flush();
       
       
       
       BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
       
       JSONObject json1 = (JSONObject)new JSONParser().parse(br);
       
       System.out.println("br 값"+br);
       System.out.println("parse값 확인 :"+json1);
       Object userName = json1.get("account_holder_name");
       
       System.out.println(userName);
       
       String inputLine;
       while((inputLine = br.readLine()) != null) {
    	   
    	   System.out.println("inputLine :"+inputLine);
       }
       osw.close();
       br.close();
       
  
       
      
       ModelAndView modelAndView = new ModelAndView();
       
       
       modelAndView.addObject("account", account);

       modelAndView.addObject("bankName", bankName);
       modelAndView.setViewName("checkAccount?userName="+userName);
     
       return modelAndView;
 	}
	
	
	@RequestMapping(value="json/listMyBoard/{userNo}",method=RequestMethod.GET)
	public Map<String,Object> listMyBoard(@PathVariable String userNo,HttpSession session) throws Exception {
		System.out.println("listMyBoard 도착===="+userNo);
		
	/*	if(session.getAttribute("user") != null) {
			
			User user = (User) session.getAttribute("user");
			
			String mUser = user.getUserNo();
			search.setMyUserNo(mUser);
			
			
		}else if(session.getAttribute("user")==null) {
			search.setMyUserNo(null);
		}
		SearchMypage search = new SearchMypage();
		User user = userService.getUser2(userNo);
		
		search.setMyUserNo(user.getUserNo()); 
		search.setCurrentPage(1);
		Map<String, Object> map = mypageService.listMyBoard(search);
		
			
		
		System.out.println(map);
		
		
		ArrayList list = (ArrayList) map.get("list");
		System.out.println(list);
		List<Board> bdList = new ArrayList<Board>();
		for (int i = 0; i < list.size(); i++) {
		
			Mypage mp = (Mypage)list.get(i);
			String bdNo = mp.getBoard().getBoardNo();
			
			Board bd = boardService.getBoard(bdNo);
			bdList.add(bd);
		}
		
		map.put("bdList", bdList);
		
		System.out.println(map);
		return map;*/
	//User user = (User) session.getAttribute("user");
User user = userService.getUser2(userNo);
	
	SearchMypage search = new SearchMypage();
	search.setMyUser(user);
		
		
		System.out.println();
		
//		if(search.getCurrentPage()==0) {
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
		
		
		Map<String, Object> map = mypageService.listMyBoard(search);
//		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println(resultPage);
//		
		
		System.out.println(map);
		
		ArrayList list = (ArrayList) map.get("list");
		System.out.println(list);
		List<Board> bdList = new ArrayList<Board>();
		for (int i = 0; i < list.size(); i++) {
		
			Mypage mp = (Mypage)list.get(i);
			String bdNo = mp.getBoard().getBoardNo();
			
			Board bd = boardService.getBoard(bdNo);
			bdList.add(bd);
		}
		map.put("bdList", bdList);
		return map;
	}
	@RequestMapping(value="json/listComment", method=RequestMethod.POST)
	public Map<String, Object> listComment (@RequestBody SearchMypage search,  HttpSession session) throws Exception {
	
		if(session.getAttribute("user") != null) {
			
			User user = (User) session.getAttribute("user");
			
			String mUser = user.getUserNo();
			search.setMyUserNo(mUser);
			
			
		}else if(session.getAttribute("user")==null) {
			search.setMyUserNo(null);
		}
		
		Map<String, Object> map = mypageService.listComment(search);
		
			
		
		System.out.println(map);
		
		
		ArrayList list = (ArrayList) map.get("list");
		System.out.println(list);
		List<Board> bdList = new ArrayList<Board>();
		for (int i = 0; i < list.size(); i++) {
		
			Mypage mp = (Mypage)list.get(i);
			String bdNo = mp.getBoard().getBoardNo();
			
			Board bd = boardService.getBoard(bdNo);
			bdList.add(bd);
		}
		
		map.put("bdList", bdList);
		
		System.out.println(map);
		return map;
	}
	@RequestMapping(value="json/listLike")
	public Map<String, Object> listLike(@RequestBody SearchMypage search,  HttpSession session) throws Exception {
	
	
	if(session.getAttribute("user") != null) {
			
			User user = (User) session.getAttribute("user");
			
			String mUser = user.getUserNo();
			search.setMyUserNo(mUser);
			
			
		}else if(session.getAttribute("user")==null) {
			search.setMyUserNo(null);
		}
		
		Map<String, Object> map = mypageService.listLike(search);
		
			
		
		System.out.println(map);
		
		
		ArrayList list = (ArrayList) map.get("list");
		System.out.println(list);
		List<Board> bdList = new ArrayList<Board>();
		for (int i = 0; i < list.size(); i++) {
		
			Mypage mp = (Mypage)list.get(i);
			String bdNo = mp.getBoard().getBoardNo();
			
			Board bd = boardService.getBoard(bdNo);
			bdList.add(bd);
		}
		
		map.put("bdList", bdList);
		
		System.out.println(map);
		return map;
	
	
	
	}
	
	
	

	@RequestMapping(value="json/listScrap/{userNo}" ,method=RequestMethod.GET)
	public Map<String, Object> listScrap(@PathVariable String userNo,HttpSession session) throws Exception {
	
/*	
	if(session.getAttribute("user") != null) {
			
			User user = (User) session.getAttribute("user");
			
			String mUser = user.getUserNo();
			search.setMyUserNo(mUser);
			
			
		}else if(session.getAttribute("user")==null) {
			search.setMyUserNo(null);
		}
	*/
		System.out.println("리스트 스크랩============"+userNo);
		SearchMypage search = new SearchMypage();
		User user = userService.getUser2(userNo);
		search.setMyUserNo(user.getUserNo());
		
		Map<String, Object> map = mypageService.listScrap(search);

		
		System.out.println(map);
	
		
		ArrayList list = (ArrayList) map.get("list");
		System.out.println(list);
		List<Board> bdList = new ArrayList<Board>();
		for (int i = 0; i < list.size(); i++) {
		
			Mypage mp = (Mypage)list.get(i);
			String bdNo = mp.getBoard().getBoardNo();
			
			Board bd = boardService.getBoard(bdNo);
			bdList.add(bd);
		}
		
		map.put("bdList", bdList);
		
		System.out.println(map);
		return map;
	
	
	
	}
	
	/////////////////////////////수정 필요///////////////////////////////////
	@RequestMapping(value="json/addAccount", method=RequestMethod.POST)
	public User addAccount(@RequestBody User user, HttpSession session) throws Exception  {
		
	 mypageService.addAccount(user);
	 
	 return null;
	
	}
	////////////////////////////////////////////////////////////////////////////

	
	
	/*
	@RequestMapping(value="getBankToken",  produces="application/json", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView getBankToken() throws Exception {
		
		final String RequestURL = "https://testapi.open-platform.or.kr/oauth/2.0/token";
			
	*/
	
	
	
	
	/*
	@RequestMapping(value="confirmName",  produces="application/json", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView confirmName() throws Exception {
		
		final String RequestURL ="https://testapi.open-platform.or.kr/inquiry/real_name";
	    final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		final String accessToken = "08e28d74-664a-4cd8-91da-4a1b38a9aaea";
				
	    MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	    
	    params.add("bank_code_std", "097");
        params.add("account_num", "110406555105");
        params.add("account_holder_info", "911205 ");
        params.add("tran_dtime", "20190118101709415");
        
	    
	    
	    HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer "+accessToken);
        headers.add("Content-Type", "application/json; charset=UTF-8");
        HttpEntity<String> entity = new HttpEntity<String>(headers);
        //HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        //Map response = restTemplate.postForObject(new URI(RequestURL), request, Map.class);
        
        
        
        ResponseEntity<String> response = null;
        response = restTemplate.exchange(RequestURL, HttpMethod.POST, entity, String.class, params);
      
        System.out.println(params);
        
        //headers.add("Content-Type",MediaType.APPLICATION_FORM_URLENCODED_VALUE +";charset=UTF-8");
        
        
        
        //HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        //Map response = restTemplate.postForObject(new URI(RequestURL), request, Map.class);
        
        System.out.println(response);
        
        
		return null;
	}
	*/
}
