package com.zagle.web.user;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;

import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;

import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zagle.service.domain.User;
import com.zagle.service.user.UserService;



//==>ȸ������ RestController
@Controller
@RequestMapping("/user/*")

public class UserRestController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
    private RestTemplate restTemplate = new RestTemplate(); 
	
	public UserRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="getAccessToken",  produces="application/json",
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView getAccessToken(@RequestParam("code") String code, RedirectAttributes ra, HttpSession session) throws Exception {
		RestTemplate restTemplate = new RestTemplate();


					
					
					  final String RequestUrl = "https://kauth.kakao.com/oauth/token"; // Host
				        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
				        
				        
				        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
				        params.add("grant_type", "authorization_code");
				        params.add("client_id", "c3883a306a9faad67b127d7631568b29");
				        params.add("redirect_uri", "http://localhost:8080/user/kakaologin");
				        params.add("code", code);
				   
				        

				        // 서버로 요청할 Header
				        HttpHeaders headers = new HttpHeaders();
				        headers.add("Authorization","KakaoAK "+"afd426e1a2275871414bee8f57f4f304");
				        headers.add("Content-Type",MediaType.APPLICATION_FORM_URLENCODED_VALUE +";charset=UTF-8");
				        
				        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
				        Map response = restTemplate.postForObject(new URI(RequestUrl), request, Map.class);
				        
				        System.out.println(response.get("access_token"));
				        
				        session.setAttribute("response", response.get("access_token"));
				        
				        ModelAndView modelAndView = new ModelAndView();
				        modelAndView.addObject(response.get("access_token"));
				        modelAndView.setViewName("getKakaoUserInfo");
				        System.out.println("modelAndView 내용" +modelAndView);
				        return modelAndView;
		
				    }
				
	@RequestMapping(value="getKakaoUserInfo", produces="application/json",
			method= {RequestMethod.GET, RequestMethod.POST})
			public ModelAndView getKakaoUserInfo(HttpSession session, RedirectAttributes ra) throws Exception {
		
				String accessToken = (String) session.getAttribute("response");
				System.out.println(accessToken);
			
		
				System.out.println("getKakao 오는지 확인");



		        final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
		        final CloseableHttpClient client = HttpClientBuilder.create().build();
		        final HttpPost post = new HttpPost(RequestUrl);
		 
		        // add header
		        post.addHeader("Authorization", "Bearer " + accessToken);
		        
		        System.out.println(post+accessToken);
		        JsonNode returnNode = null;
		 
		        try {
		            final HttpResponse response = client.execute(post);
		            final int responseCode = response.getStatusLine().getStatusCode();
		 
		            System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
		            System.out.println("Response Code : " + responseCode);
		            
		  
		            
		            // JSON 형태 반환값 처리
		            ObjectMapper mapper = new ObjectMapper();
		            returnNode = mapper.readTree(response.getEntity().getContent());
		            
		            System.out.println(returnNode);
		 
		        } catch (ClientProtocolException e) {
		            e.printStackTrace();
		        } catch (IOException e) {
		            e.printStackTrace();
		        } finally {
		            // clear resources
		        }
		       
		       String snsNo = "K@"+returnNode.get("id");
		        System.out.println(snsNo);
		      
		       session.setAttribute("snsNo", snsNo);
		        
		        ModelAndView modelAndView = new ModelAndView();
		        modelAndView.addObject(snsNo);
		        System.out.println("modelAndView :"+modelAndView);
		        modelAndView.setViewName("checkDuplication");
		      
		        
		        return modelAndView;
		    }
		@RequestMapping(value="checkDuplication", 	method= {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView checkDuplication(HttpSession session, Model model) throws Exception {
			
			System.out.println("/user/checkDuplication :POST");
			
			String snsNo = (String) session.getAttribute("snsNo");
			
			System.out.println(snsNo);
			
			boolean result = userService.checkDuplication(snsNo);
			
			model.addAttribute("result", new Boolean(result));
			model.addAttribute("snsNo", snsNo);
			
			if(result==false) {
				ModelAndView modelAndView = new ModelAndView();
				modelAndView.addObject("result", new Boolean(result));
				modelAndView.addObject("snsNo", snsNo);
				modelAndView.setViewName("forward:/view/user/addUserView.jsp");
				return modelAndView;
				
			}else {
			
			ModelAndView modelAndView = new ModelAndView();
			User user = new User();
		
			user = userService.getUser(snsNo);
			
			
			session.setAttribute("user", user);
			
			modelAndView.addObject("result", new Boolean(result));
			modelAndView.addObject("user", user);
			modelAndView.setViewName("/view/user/model.jsp");
			
			return modelAndView;
		}
		
		}
		@RequestMapping(value="/logout/json" , method= {RequestMethod.GET, RequestMethod.POST}) 
		public ModelAndView logout(HttpSession session) throws Exception {
			
			
			System.out.println("여기왔나 확인해야합니다.");
			
			
			
			String accessToken = (String) session.getAttribute("response");
			System.out.println(accessToken);
			
			  final String RequestUrl = "https://kapi.kakao.com/v1/user/logout"; // Host
			  final CloseableHttpClient client = HttpClientBuilder.create().build();
		        final HttpPost post = new HttpPost(RequestUrl);
	
		        
		        
		        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		
		        params.add("Authorization", accessToken);
		   
		        // add header
		        post.addHeader("Authorization", "Bearer " + accessToken);

		        System.out.println(post+accessToken);
		        JsonNode logoutID = null;
		 
		        try {
		            final HttpResponse response = client.execute(post);
		            final int responseCode = response.getStatusLine().getStatusCode();
		 
		            System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
		            System.out.println("Response Code : " + responseCode);
		            
		            
		            // JSON 형태 반환값 처리
		            ObjectMapper mapper = new ObjectMapper();
		            logoutID = mapper.readTree(response.getEntity().getContent());
		           
		            logoutID.get("id");
		            System.out.println(logoutID);
		            
		            session.invalidate();
		            
		        } catch (ClientProtocolException e) {
		            e.printStackTrace();
		        } catch (IOException e) {
		            e.printStackTrace();
		        } finally {
		            // clear resources
		        }
		        
		        
			
		        ModelAndView modelAndView = new ModelAndView();
		        modelAndView.setViewName("/index.jsp");
		        
		        return modelAndView;
		        
		}
		@RequestMapping(value = "getNaverInfo")
		public ModelAndView getNaverInfo(@RequestParam("code") String code, RedirectAttributes ra, HttpSession session) throws Exception {
		        
				
				String Ncode = (String) session.getAttribute("Ncode");
				
				System.out.println("get네이버정보 token값"+Ncode);
			
		        String header = "Bearer " + Ncode; // Bearer 다음에 공백 추가
		        
		        System.out.println("getnaverinfo에서 코드 확인"+code);
		        
		        System.out.println("헤더 확인"+header);
		        
		        try {
		            String apiURL = "https://openapi.naver.com/v1/nid/me";
		            URL url = new URL(apiURL);
		            HttpURLConnection con = (HttpURLConnection)url.openConnection();
		            con.setRequestMethod("GET");
		            con.setRequestProperty("Authorization", header);
		            int responseCode = con.getResponseCode();
		            BufferedReader br;
		            if(responseCode==200) { // 정상 호출
		                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		            } else {  // 에러 발생
		                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		            }
		            System.out.println("responseCode :"+responseCode);
		            
		            String inputLine;
		            StringBuffer response = new StringBuffer();
		            while ((inputLine = br.readLine()) != null) {
		                response.append(inputLine);
		            }
		            br.close();
		            System.out.println(response.toString());
		            
		            
		    	    JSONParser parser = new JSONParser();
		    	    Object obj = parser.parse(response.toString());
		    	    JSONObject jsonObj = (JSONObject) obj;
		    	    
		    	    Object Naverid =jsonObj.get("response");
		    	    
		    	    
		    	    JSONParser parser1 = new JSONParser();
		    	    Object obj1 = parser1.parse(Naverid.toString());
		    	    JSONObject jsonObj1 = (JSONObject) obj1;
		    	    
		    	    String NaverNo = "N@"+(String) jsonObj1.get("id");
		    	    System.out.println("네이버확인 : "+NaverNo);
		    	 
		    	    
		    	    session.setAttribute("snsNo", NaverNo);
		    	    
		            
		            
		    	    ModelAndView modelAndView = new ModelAndView();
			        modelAndView.addObject(NaverNo);
			        System.out.println("modelAndView :"+modelAndView);
			        modelAndView.setViewName("checkDuplication");
			        return modelAndView;
		    	
		        } catch (Exception e) {
		            System.out.println(e);
		        }
		        
		        
		    	
		    	return null;
		}
			
	

}
	

	
	
