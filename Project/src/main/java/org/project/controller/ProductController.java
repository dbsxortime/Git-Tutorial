package org.project.controller;

import java.security.Principal;

import org.project.service.ProductService;
import org.project.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/shoppingmall/product/*")
public class ProductController {
	@Autowired
	private ProductService service;
	
	@GetMapping("product")
	public void goMyPage(Model model,@ModelAttribute("p_num")int p_num, Principal principal) {
		MethodClass mc = new MethodClass();
		String u_id=mc.checkUser(principal);

		log.info("get detail product... ");
		ProductVO vo = service.readProduct(p_num);
		
		model.addAttribute("u_id",u_id);
		model.addAttribute("product",vo);
		model.addAttribute("option",service.readOptionWithPNum(p_num));
		model.addAttribute("money",mc.calcSave(vo.getP_price()));
	}

}