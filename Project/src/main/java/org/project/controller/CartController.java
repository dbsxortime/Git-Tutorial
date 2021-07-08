package org.project.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.project.service.CartService;
import org.project.service.MyPageService;
import org.project.service.ProductService;
import org.project.vo.CartVO;
import org.project.vo.OptionVO;
import org.project.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/shoppingmall/cart/*")
public class CartController {
	@Autowired
	private CartService service;
	@Autowired
	private ProductService pService;
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("cart")
	public void goMyCart(Model model, Principal principal) {
		String u_id = principal.getName();
		model.addAttribute("u_id",u_id);
		
		log.info("go my cart page... id : "+u_id);
		List<CartVO> cart = service.getCartById(u_id);
		model.addAttribute("cart",cart);
//		model.addAttribute("option",service.readOptionWithPNum(p_num));
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("removeonecart")
	public String removeCart(RedirectAttributes rttr, 
			@RequestParam("c_num")int c_num, Principal principal) {
		String u_id = principal.getName();
		rttr.addFlashAttribute("u_id",u_id);
		
		log.info("delete cart : "+c_num);
		service.deleteCart(c_num);
		return "/shoppingmall/cart/removecart";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("removecart")
	public String removeAllCartLists(Model model, Principal principal) {
		String u_id = principal.getName();
		service.deleteAllCart(u_id);
		return "/shoppingmall/cart/removecart";
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("insertcart")
	@ResponseBody
	public String checkCart(RedirectAttributes rttr, Principal principal,
			@RequestParam String p_num,
			@RequestParam String c_quantity,
			@RequestParam String c_size
			) {
		String u_id = principal.getName();
		rttr.addFlashAttribute("u_id",u_id);
		
		log.info("insert to cart... no: " + p_num);
		int num= Integer.parseInt(p_num);
		int quan= Integer.parseInt(c_quantity);
		
		log.info(num);
		log.info(quan);
		
		MethodClass mc = new MethodClass();
		CartVO cVO = pService.readProductForCart(num);
		cVO.setU_id(u_id);
		cVO.setC_quantity(quan);
		cVO.setC_size(c_size);
		cVO.setTotal_price(cVO.getP_price()*cVO.getC_quantity());
		cVO.setSave(mc.calcSave(cVO.getTotal_price()));
		
		int check=service.isCartRepeated(cVO);
		log.info("check : " + check);
		
		if(check == 0) {
			service.insertCart(cVO);
			log.info("result = 0");
			return "0";
		}else {
			log.info("result = 1");
			return "1";
		}
	}

	@PreAuthorize("isAuthenticated()")	//주고받는 데이터 정리
	@ResponseBody
	@PostMapping("cartupdater")
	public String cartUpdater(RedirectAttributes rttr, Principal principal, 
			@RequestParam String p_num,
			@RequestParam String c_quantity,
			@RequestParam String c_size) {
		String u_id = principal.getName();
		log.info("update cart ... ");
		CartVO vo = new CartVO();
		vo.setP_num(Integer.parseInt(p_num));
		vo.setC_quantity(Integer.parseInt(c_quantity));
		vo.setC_size(c_size);
		vo.setU_id(u_id);
		service.CartUpdater(vo);
		return "success";
	}
	
	@PreAuthorize("isAuthenticated()")	//주고받는 데이터 정리
	@ResponseBody
	@PostMapping("updateoption")
	public String updateAmount(RedirectAttributes rttr, Principal principal, 
			@RequestParam String c_num,
			@RequestParam String changeamount,
			@RequestParam String changeoption,
			@RequestParam String p_num) {
		String u_id = principal.getName();
		
		log.info("update amount ... ");
		
		CartVO vo = new CartVO();
		vo.setC_num(Integer.parseInt(c_num));
		vo.setChangeamount(Integer.parseInt(changeamount));
		vo.setChangeoption(changeoption);
		vo.setU_id(u_id);
		vo.setP_num(Integer.parseInt(p_num));
		log.info(vo);
		service.updateAmount(vo);
		MethodClass mc = new MethodClass();
		vo.setSave(mc.calcSave(vo.getTotal_price()));
		return "success";
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/getOption", produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<OptionVO>> getAttachList(int c_num) {
		log.info("get option list : " + c_num);
		
		return new ResponseEntity<>(pService.readOptionWithPNum(service.getPnum(c_num)),HttpStatus.OK);
	}
	
}