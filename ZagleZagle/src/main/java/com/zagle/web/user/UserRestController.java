package com.zagle.web.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zagle.service.user.UserService;

import sun.net.www.http.HttpClient;

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
		            
		 
		        } catch (ClientProtocolException e) {
		            e.printStackTrace();
		        } catch (IOException e) {
		            e.printStackTrace();
		        } finally {
		            // clear resources
		        }
		       
		      
		        
		        ModelAndView modelAndView = new ModelAndView();
		        modelAndView.addObject(returnNode);
		        modelAndView.setViewName("/view/user/model.jsp");
		        
		        return modelAndView;
		    }
		//이거 signUp 구현해야함.
		//@RequestMapping(value="SignUpKakao")
	}

	
	
