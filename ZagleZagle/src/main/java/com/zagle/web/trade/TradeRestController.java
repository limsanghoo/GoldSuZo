package com.zagle.web.trade;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.zagle.common.Search;
import com.zagle.service.trade.TradeService;
import com.zagle.service.user.UserService;

@Controller
@RequestMapping("/trade/json/*")
public class TradeRestController {
	public TradeRestController() {
		
	}
	@Autowired
	@Qualifier("tradeServiceImpl")
	private TradeService tradeService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	

	@RequestMapping(value="listTrade", method=RequestMethod.GET)
	public Map<String,Object> listTrade(@ModelAttribute("search") Search search) throws Exception{
		
		Map<String , Object> map=tradeService.listTrade(search);

	
		return map;
	}
	
}
