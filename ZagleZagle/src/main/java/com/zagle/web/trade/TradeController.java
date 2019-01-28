package com.zagle.web.trade;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zagle.common.Page;
import com.zagle.common.Search;
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
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="listTrade", method=RequestMethod.GET)
	public ModelAndView listTrade(@ModelAttribute("search") Search search) throws Exception{
		
		Map<String , Object> map=tradeService.listTrade(search);

		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("tradeList", map.get("tradeList"));//게시물 리스트
		modelAndView.setViewName("forward:/view/trade/listTrade.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addSell", method=RequestMethod.POST)
	public ModelAndView addSell(@ModelAttribute("sell") Sell sell, HttpSession session) throws Exception{
		
		User user =(User)session.getAttribute("user");
		sell.setSeller(user);
		tradeService.addSell(sell);
	
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/trade/listTrade");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addSell", method=RequestMethod.GET)
	public ModelAndView addSell() throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/view/trade/addSell.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="getSell")
	public ModelAndView getSell(@RequestParam("sellNo") String sellNo) throws Exception{
		
		Sell sell = tradeService.getSell(sellNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/view/trade/getSell.jsp");
		modelAndView.addObject("sell",sell);
		
		return modelAndView;
	}
	
	@RequestMapping(value="listSell", method=RequestMethod.GET)
	public ModelAndView listSell(HttpSession session, @ModelAttribute("search") Search search) throws Exception{
		
		User user = (User)session.getAttribute("user");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map = tradeService.listSell(search, user.getUserNo());
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize );
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/view/trade/listSell.jsp");
		modelAndView.addObject("list",map.get("list"));
		modelAndView.addObject("resultPage",resultPage);
		modelAndView.addObject("search",search);
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="listBuy")
	public ModelAndView listBuy(@RequestParam("userNo") String userNo) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		return modelAndView;
	}
	
}
