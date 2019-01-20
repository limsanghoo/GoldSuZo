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
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.zagle.service.mypage.MypageService;
import com.zagle.service.user.UserService;

@Controller
@RequestMapping("/mypage/*")
public class MypageRestController {
	
	
	@Autowired
	@Qualifier("mypageServiceImpl")
	private MypageService mypageService;
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	private RestTemplate restTemplate = new RestTemplate();
	
	
	public MypageRestController() {
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value="getBankCode", produces="application/json")
	public ModelAndView getBankCode(HttpSession session) throws Exception {
		
		System.out.println("인증 코드 요청 시작");
		
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
	final String callBackURL ="http://localhost:8080/mypage/bankCallback";
	
	  HttpHeaders headers = new HttpHeaders();
	headers.add("Accept", "application/json");
	
	 
	   MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
       params.add("grant_type", "authorization_code");
       params.add("client_id", client_id);
       params.add("client_secret", "1efe286e56a94d85a44d7c0d7d19a144");
       params.add("redirect_uri", "http://localhost:8080/mypage/bankCallback");
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
	public ModelAndView confrimName(HttpSession session) throws Exception {
		
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
       
       
       
      JSONObject json = new JSONObject();
       json.put("bank_code_std", "097");
       json.put("account_num", "110406555105");
       json.put("account_holder_info", "911205 ");
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
       
       
       //modelAndView.addObject("realName", realName);
       modelAndView.setViewName("checkAccount?userName="+userName);
     
       return modelAndView;
 	}
	

	
	/*
	@RequestMapping(value="getBankToken",  produces="application/json", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView getBankToken() throws Exception {
		
		final String RequestURL = "https://testapi.open-platform.or.kr/oauth/2.0/token";
			
	*/
	}
	
	
	
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

