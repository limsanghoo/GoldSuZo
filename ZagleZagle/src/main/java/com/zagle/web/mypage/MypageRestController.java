package com.zagle.web.mypage;

import java.net.URI;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.http.NameValuePair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(value="confirmName",  produces="application/json", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView confirmName() throws Exception {
		
		final String RequestURL ="https://testapi.open-platform.or.kr/inquiry/real_name";
	    final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		final String accessToken = "5a965cd7-0ec3-4312-a7aa-dc8da4838e18";
	    
	    
	    MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	   
	    HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer "+accessToken);
	    
	    params.add("bank_code_std", "097");
        params.add("account_num", "0001230000678");
        params.add("account_holder_info", "8801012");
        params.add("tran_dtime", "20160310101921");
   
       
        //headers.add("Content-Type",MediaType.APPLICATION_FORM_URLENCODED_VALUE +";charset=UTF-8");
        
        
        
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        Map response = restTemplate.postForObject(new URI(RequestURL), request, Map.class);
        
        System.out.println(response);
        
        
		return null;
	}
}
