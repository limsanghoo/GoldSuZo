package com.zagle.web.stream;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zagle.service.domain.Stream;
import com.zagle.service.domain.User;
import com.zagle.service.stream.StreamService;
import com.zagle.service.user.UserService;

@Controller
@RequestMapping("/stream/json/")
public class StreamRestController {

	@Autowired
	@Qualifier("streamServiceImpl")
	private StreamService streamService;
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
	
	@RequestMapping(value="payStream",method=RequestMethod.POST)
	public ModelAndView payStream(@RequestBody String httpParam) throws Exception{
		System.out.println("payStream====");
 ModelAndView modelandview = new ModelAndView();

        JSONParser jsonParser = new JSONParser();

        JSONArray insertParam = (JSONArray) jsonParser.parse(httpParam);

        for(int i=0; i<insertParam.size(); i++){

            //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
            JSONObject insertData = (JSONObject) insertParam.get(i);
            	System.out.println(insertData);
                modelandview.addObject("result", insertData);
	}

		return modelandview;
        
	}
}
	
	
	