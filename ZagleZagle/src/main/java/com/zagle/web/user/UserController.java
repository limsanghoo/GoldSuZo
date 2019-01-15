package com.zagle.web.user;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.io.JsonStringEncoder;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.springframework.http.HttpEntity;

import com.zagle.service.domain.User;
import com.zagle.service.user.UserService;

//==> 회원관리 Controller
@Controller
@RequestMapping("/user/*")
public class UserController {
	
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public UserController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="addUser", method=RequestMethod.GET)
	public ModelAndView addUser() throws Exception {
		
		System.out.println("::==>/addUserView() start");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/user/addUserView.jsp");
		
		return modelAndView;
		
	}
	@RequestMapping(value="addUser", method=RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute("user") User user)throws Exception {
		
		System.out.println("/user/addUser : POST");
		
		userService.addUser(user);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(user);
		modelAndView.setViewName("/view/user/model.jsp");
		
		return modelAndView;
		
	}
 	
	
	@RequestMapping(value="getUser", method=RequestMethod.GET)
	public ModelAndView getUser(@RequestParam("snsNo") String snsNo) throws Exception {
		
		System.out.println("getUser Start!!!!!!!!");
		
		User user = userService.getUser(snsNo);
		System.out.println("user"+user);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(user);
		modelAndView.setViewName("/user/getUser.jsp");
		
		return modelAndView;
		
	}
	
	@RequestMapping(value="getUser2", method=RequestMethod.GET)
	public ModelAndView getUser2(@RequestParam("userNo") String userNo) throws Exception {
		
		System.out.println("getUser2(userNo) Start!!!!!!!!");
		
		User user = userService.getUser2(userNo);
		System.out.println("user"+user);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(user);
		modelAndView.setViewName("/view/user/getUser.jsp");
		
		return modelAndView;
		
	}
	
	
	@RequestMapping(value="updateUser", method=RequestMethod.GET)
	public ModelAndView updateUser(@RequestParam("userNo") String userNo) throws Exception {
		
		System.out.println(":==>/updateUserView.start");
		
		User user = userService.getUser2(userNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(user);
		modelAndView.setViewName("/view/user/updateUserView.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value="updateUser", method=RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute("user") User user, @RequestParam("snsNo") String snsNo,
															@RequestParam("userNo") String userNo,Model model, HttpSession session) throws Exception {
		
		System.out.println("/user/updateUser : POST");
		System.out.println(user);
		
		user.setSnsNo(snsNo);
		user.setUserNo(userNo);
		
		//Business Logic 
		userService.updateUser(user);
		/*
		String sessionId=((User)session.getAttribute("user")).getUserNo();
		if(sessionId.equals(user.getUserNo())) {
			session.setAttribute("user", user);
		}
		*/
		System.out.println("updateUser확인" +user);
		System.out.println(user.getUserNo());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(user);
		modelAndView.setViewName("redirect:/user/getUser2?userNo="+user.getUserNo());
		
		return modelAndView;
	}
	@RequestMapping(value="snsLogin/{userNo}", method=RequestMethod.POST)
	public ModelAndView snsLogin(@PathVariable String userNo, HttpSession session) throws Exception {
		
		User dbUser = userService.getUser(userNo);
		
		session.setAttribute("user", dbUser);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(dbUser);
		modelAndView.setViewName("redircet:/main.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="kakaologin", produces="application/json", 
				method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView kakaoCallBack(@RequestParam("code") String code, RedirectAttributes ra, 
								HttpSession session, HttpServletResponse response) throws Exception{
	
	System.out.println("code: "+code);
	
	ModelAndView modelAndView = new ModelAndView();
	modelAndView.addObject("code", code);
	modelAndView.setViewName("getAccessToken");

	return modelAndView;
	
	}
	
	@RequestMapping(value = "naverCallback")
	public ModelAndView navLogin(@RequestParam("code") String code, RedirectAttributes ra,  HttpServletResponse response, 
																																					HttpSession session,	HttpServletRequest request) throws Exception {	
		System.out.println("naverCallback 오는지 확인");
		
		String clientId = "ICC6WpwdQLzHUQn5KfEC";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "NggQgvQjib";//애플리케이션 클라이언트 시크릿값";
	    //String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://localhost:8080/user/naverCallback", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
	    System.out.println("apiURL="+apiURL);
	    
	    JsonNode NaverToken = null;
	    
	    
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      System.out.println("responseCode="+responseCode);
	     
	  
	    
	 
          
          System.out.println(NaverToken);
	      
	      if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }
	      br.close();
	      if(responseCode==200) {
	        System.out.println(res.toString());
	        
	        

	    JSONParser parser = new JSONParser();
	    Object obj = parser.parse(res.toString());
	    JSONObject jsonObj = (JSONObject) obj;

	    String Ncode = (String) jsonObj.get("access_token");
	    System.out.println("Ncode 값 "+Ncode);
	    
	    session.setAttribute("Ncode", Ncode);
	    
	    ModelAndView modelAndView = new ModelAndView();
	    modelAndView.addObject(Ncode);
	    modelAndView.setViewName("getNaverInfo");
	    
	    return modelAndView;
	      }
	    } catch (Exception e) {
	      System.out.println(e);
	    }
	    
	  
	    
	    
	    return null;
		
	}	
	
	

}
