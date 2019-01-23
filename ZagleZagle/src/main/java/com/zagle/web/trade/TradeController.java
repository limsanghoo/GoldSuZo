package com.zagle.web.trade;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.zagle.service.domain.Sell;
import com.zagle.service.domain.User;
import com.zagle.service.trade.TradeService;

@Controller
@RequestMapping("/trade/*")
public class TradeController {
	
	@Autowired
	@Qualifier("tradeServiceImpl")
	private TradeService tradeService;
	
	public TradeController() {
	}
	
	@RequestMapping(value="addSell", method=RequestMethod.POST)
	public ModelAndView addSell(@ModelAttribute("sell") Sell sell, HttpSession session) throws Exception{
		
		User user =(User) session.getAttribute("user");
		System.out.println("이고"+sell);
		
		sell.setUserNo(user.getUserNo());
		
		System.out.println("이거는?"+sell);
		
		tradeService.addSell(sell);
	
		return null;
		
	}
	
}
