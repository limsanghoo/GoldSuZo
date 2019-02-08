package com.zagle.web.trade;

import java.util.List;
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
import com.zagle.service.domain.Buy;
import com.zagle.service.domain.CompanyList;
import com.zagle.service.domain.Sell;
import com.zagle.service.domain.User;
import com.zagle.service.trade.TradeService;
import com.zagle.service.user.UserService;

@Controller
@RequestMapping("/trade/*")
public class TradeController {
	
	@Autowired
	@Qualifier("tradeServiceImpl")
	private TradeService tradeService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
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
		
		String[] photo=sell.getSellPhoto1().split(",");//이미지 링크 파싱
		
		if(photo.length==1) {
			sell.setSellPhoto1(photo[0]);
	    }else if(photo.length==2) {
	    	sell.setSellPhoto1(photo[0]);
	    	sell.setSellPhoto2(photo[1]);
	    }else if(photo.length==3) {
	        sell.setSellPhoto1(photo[0]);
	        sell.setSellPhoto2(photo[1]);
	        sell.setSellPhoto3(photo[2]);
	    }
		
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
	public ModelAndView listBuy(HttpSession session, @ModelAttribute("search") Search search) throws Exception{
		
		User user = (User)session.getAttribute("user");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map = tradeService.listBuy(search, user.getUserNo());
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize );
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/view/trade/listBuy.jsp");
		modelAndView.addObject("list",map.get("list"));
		modelAndView.addObject("resultPage",resultPage);
		modelAndView.addObject("search",search);
		
		return modelAndView;
	}
	
	@RequestMapping(value="updateSell", method=RequestMethod.GET)
	public ModelAndView updateSell(HttpSession session, @ModelAttribute("sellNo") String sellNo) throws Exception{
		
		Sell sell = tradeService.getSell(sellNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/view/trade/updateSell.jsp");
		modelAndView.addObject("sell",sell);
		
		return modelAndView;
	}
	
	@RequestMapping(value="updateSell", method=RequestMethod.POST)
	public ModelAndView updateSell(@ModelAttribute("sell") Sell sell) throws Exception{
		
		tradeService.updateSell(sell);
	
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("redirect:/trade/getSell?sellNo="+sell.getSellNo());
		
		return modelAndView;
	}
	
	@RequestMapping(value="updateSellState")
	public ModelAndView updateSellState(@ModelAttribute("sellNo") String sellNo, @ModelAttribute("sellState") int sellState) throws Exception{
		Sell sell = new Sell();
		sell.setSellNo(sellNo);
		sell.setSellState(sellState);
		
		tradeService.updateSellState(sell);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/trade/listTrade");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addBuy", method=RequestMethod.GET)
	public ModelAndView addBuy(@ModelAttribute("sellNo") String sellNo, HttpSession session) throws Exception{
		Sell sell = new Sell();
		sell.setSellNo(sellNo);
		int sellState = 20;
		sell.setSellState(sellState);
		
		User user = (User)session.getAttribute("user");
		
		Buy buy = new Buy();
		buy.setBuyer(user);
		buy.setSellProd(sell);
		
		tradeService.updateSellState(sell);
		tradeService.addBuy(buy);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("sell",sell);
		modelAndView.setViewName("redirect:/trade/listBuy");
		
		return modelAndView;
	}
	
	@RequestMapping(value="testUser")
	public String testUser(HttpSession session) throws Exception{
		
		User testUser = new User();
	
		//상아
		testUser=userService.getUser2("US10003");
		
		//인호
		//testUser=userService.getUser2("US10023");
		
		//주현
		//testUser=userService.getUser2("US10027");	
		
		session.setAttribute("user", testUser);
		
		return "redirect:/trade/listTrade";
	}
	
	@RequestMapping(value="payBuy", method=RequestMethod.GET)
	public ModelAndView payBuy(@ModelAttribute("buyNo") String buyNo) throws Exception{
		
		Buy buy = new Buy();
		
		buy = tradeService.getBuy(buyNo);
		buy.setSellProd(tradeService.getSell(buy.getSellProd().getSellNo()));
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("buy",buy);
		modelAndView.setViewName("forward:/view/trade/payBuy.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="payBuy", method=RequestMethod.POST)
	public ModelAndView payBuy(@ModelAttribute("buy") Buy buy, @ModelAttribute("sellNo") String sellNo ) throws Exception{
		
		Sell sell = new Sell();
		sell.setSellNo(sellNo);
		int sellState = 50;
		sell.setSellState(sellState);
		
		tradeService.payBuy(buy);
		tradeService.updateSellState(sell);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/trade/listBuy");
		 
		return modelAndView;
	}
	
	@RequestMapping(value="addTracking", method=RequestMethod.GET)
	public ModelAndView addTracking(@ModelAttribute("sellNo") String sellNo) throws Exception{
		
		Buy buy = new Buy();
		buy = tradeService.getBuyNo(sellNo);
		 
		buy = tradeService.getBuy(buy.getBuyNo());
		buy.setSellProd(tradeService.getSell(buy.getSellProd().getSellNo()));
		
		List<CompanyList> company = tradeService.getCompany();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("buy",buy);
		modelAndView.addObject("company",company);
		modelAndView.setViewName("forward:/view/trade/addTracking.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addTracking", method=RequestMethod.POST)
	public ModelAndView addTracking(@ModelAttribute("buy") Buy buy, @ModelAttribute("sellNo") String sellNo) throws Exception{

		System.out.println(buy);
		
		tradeService.addTracking(buy);
		
		Sell sell = new Sell();
		sell.setSellNo(sellNo);
		sell.setSellState(60);
		
		tradeService.updateSellState(sell);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/trade/listSell");
		
		return modelAndView;
	}
	
	@RequestMapping(value="selectTracking", method=RequestMethod.GET)
	public ModelAndView selectTracking(@ModelAttribute("buyNo") String buyNo) throws Exception{
		
		Buy buy = new Buy();
		buy = tradeService.getBuy(buyNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("buy",buy);
		modelAndView.setViewName("forward:/view/trade/selectTracking.jsp");
		
		return modelAndView;
	}
}
