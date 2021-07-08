package org.project.controller;

import java.security.Principal;

import org.project.service.SearchService;
import org.project.vo.QandAVO;
import org.project.vo.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
@RequestMapping("/shoppingmall/search/*")
public class SearchController {
	@Autowired
	private SearchService service;
	
	
	@GetMapping("searchProduct")
	public void searchProducts(Model model, SearchVO vo, Principal principal) {
		MethodClass mc = new MethodClass();
		String u_id=mc.checkUser(principal);
		model.addAttribute("u_id",u_id);
		
		log.info("search products... : ");
		model.addAttribute("result",service.searchProductWithPrice(vo));
		model.addAttribute("keyword",vo.getKeyword());
	}
	
	@GetMapping("searchNotice")
	public void searchNotices(Model model, SearchVO vo, Principal principal) {
		MethodClass mc = new MethodClass();
		String u_id=mc.checkUser(principal);
		model.addAttribute("u_id",u_id);
		
		log.info("search notices ... : search by : " + vo.getKeyword());
		if(vo.getOption().equals("title")) {
			model.addAttribute("result",service.searchNoticeWithTitle(vo.getKeyword()));
		}else {
			model.addAttribute("result",service.searchNoticeWithContext(vo.getKeyword()));
		}
		
		model.addAttribute("search",vo);
	}
	
	@GetMapping("searchQandA")
	public void SearchQandA(Model model, SearchVO vo, Principal principal) {
		 
	     MethodClass mc = new MethodClass();
		 String u_id = mc.checkUser(principal);
		 model.addAttribute("u_id",u_id);
		 
		 log.info("search : " + vo.getKeyword());
		 
		 if(vo.getOption().equals("u_id")) {
			 model.addAttribute("result",service.searchQandAWithid(vo.getKeyword()));
		 }else if(vo.getOption().equals("q_title")) {
			 model.addAttribute("result",service.searchQandAWithTitle(vo.getKeyword()));
		 }else if(vo.getOption().equals("q_content")) {
			 model.addAttribute("result",service.searchQandAWithContext(vo.getKeyword()));
		 }
		 
		 model.addAttribute("search",vo);
	}
	
}
