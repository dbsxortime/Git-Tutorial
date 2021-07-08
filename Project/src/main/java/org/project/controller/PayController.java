package org.project.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.project.service.CartService;
import org.project.service.CouponService;
import org.project.service.MyPageService;
import org.project.service.OrderService;
import org.project.service.PayService;
import org.project.vo.CartVO;
import org.project.vo.CouponVO;
import org.project.vo.OptionVO;
import org.project.vo.OrderVO;
import org.project.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/shoppingmall/pay/*")
public class PayController {
	@Autowired
	private PayService service;
	@Autowired
	private CartService cService;
	@Autowired
	private OrderService oService;
	@Autowired
	private MyPageService mService;
	@Autowired
	private CouponService cpService;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("pay")
	public void goPayPage(Model model,Principal principal
			,@RequestParam List<Integer> checkedList
			){
		String u_id = principal.getName();
		model.addAttribute("u_id",u_id);
		log.info("go pay page... id :"+u_id);
		
		UserVO vo = service.readUserForOrder(u_id);
		OrderVO oVO = new OrderVO();
		MethodClass mc = new MethodClass();
		
		oVO.setU_id(vo.getU_id());
		oVO.setO_name(vo.getU_name());
		oVO.setO_phone(vo.getU_phone());
		oVO.setO_addr(vo.getU_addr());
		oVO.setO_email(vo.getU_email());
		oVO.setO_pay(cService.getAllPriceById(u_id));
		oVO.setTotal_save(cService.getAllSaveById(u_id));
		oVO.setDelievery_fee(mc.calcDelieveryFee(oVO.getO_pay()));
		
		model.addAttribute("save",vo.getSave());
		
		List<CartVO> cartList = cService.getCartById(u_id);
		
		List<CartVO> cartRepackList = new ArrayList<CartVO>();
		
		for(int i=0; i<cartList.size();i++) {
			for(int j=0; j<checkedList.size(); j++) {
				if(cartList.get(i).getC_num() == checkedList.get(j)) {
					cartRepackList.add(cartList.get(i));
				}
			}
		}
		
		int pay =0;
		for(int i=0; i<cartRepackList.size();i++) {
			pay +=cartRepackList.get(i).getP_price() *cartRepackList.get(i).getC_quantity() ;
		}
		
		model.addAttribute("pay",pay);
		model.addAttribute("user",oVO);
		model.addAttribute("cart",cartRepackList);
		model.addAttribute("couponList",mService.getMyCoupon(u_id));
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("doorder")
	public void doOrder(Model model, Principal principal,
			OrderVO vo, int cpu_num, @RequestParam List<Integer> c_num
			) {
		String u_id = principal.getName();
		model.addAttribute("u_id",u_id);
		log.info("go order... : " + vo);
		
		//update order table
		vo.setU_id(u_id);
		oService.insertOrder(vo);
		
		//update cart table
		vo.setO_num(oService.getONum());
		log.info("go order... id : " + vo.getU_id() + " o_num : " + vo.getO_num());
		for(int i=0; i<c_num.size();i++) {
			vo.setInputNum(c_num.get(i));
			oService.oNumToCart(vo);
		}
		
		//update coupon_user table
		if(cpu_num != 0) {
			CouponVO cVO = new CouponVO();
			cVO.setIsused(vo.getO_num());
			cVO.setCpu_num(cpu_num);
			cVO.setU_id(u_id);
			cpService.updateUsedCoupon(cVO);
			log.info("insert used number to coupon(isused), num: " + cVO.getIsused());
			log.info("used coupon number is " + cVO.getCpu_num());
			log.info("user is '" + cVO.getU_id()+"'");
		}else {
			log.info("no coupon used");
		}
		
		//update save in user table and 
		//update quantity in option table
		oService.updateSave(vo);
		log.info("insert save "+vo.getSaved()+" to "+u_id);
		
		oService.updateQuantity(vo);
		log.info(" update quantity -"+vo.getOp_quantity()+
				" for p_num :"+vo.getP_num()+" and op_size : "+vo.getOp_size());
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("ordercomplete")
	public void ordercomplete(Model model, Principal principal) {
		String u_id = principal.getName();
		model.addAttribute("u_id",u_id);
		log.info("go complete page ... ");
		
		model.addAttribute("cart",oService.getLastestCart(u_id));
		model.addAttribute("order",oService.getLastestOrder(u_id));
	}
	
	@ResponseBody
	@PostMapping("checkcoupon")
	public String checkCoupon(RedirectAttributes rttr, Principal principal,
			@RequestParam String cpu_num) {
		String u_id = principal.getName();
		rttr.addAttribute("u_id",u_id);
		log.info("check coupon ... ");
		if(cpu_num.equals("cancel")) {
			log.info("coupon canceled");
			return "0";
		}
		
		CouponVO vo = new CouponVO();
		vo.setU_id(u_id);
		vo.setCpu_num(Integer.parseInt(cpu_num));
		CouponVO cpVO = cpService.checkCoupon(vo);
		
		String discount = Integer.toString(cpVO.getCp_discount());
		
		rttr.addAttribute("discount",discount);
		log.info("discount : "+discount);
		return discount;
		
		//쿠폰 일자 체크, 기간 지났을 시 삭제처리 (isused=-1) 
		// > 서비스에 연산처리 후, 컨트롤러에서 쿠폰 조회시마다 사용하기
		//상품금액 <= CP_POSSIBLE 일때만 가능, 안넘을 시 return "0";
	}
	
	
	
	
	
	
}