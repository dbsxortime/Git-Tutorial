package org.project.controller;

import java.security.Principal;
import java.util.List;

import org.project.service.CouponService;
import org.project.service.MyPageService;
import org.project.vo.CouponVO;
import org.project.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
@RequestMapping("/shoppingmall/popup/*")
public class PopUpController {
	@Autowired
	private MyPageService mService;
	@Autowired
	private CouponService cService;

	 @PreAuthorize("isAuthenticated()") 
	@GetMapping("order")
	public void goOrderWindow(Model model,Principal principal,
			@RequestParam("o_num")int o_num) {
		String u_id = principal.getName();
		log.info("go Order popup... user, number : "+u_id+", "+o_num);

		model.addAttribute("u_id",u_id);
		model.addAttribute("order",mService.getListsOrderPopUp(o_num));
		model.addAttribute("product",mService.getPNameLists(o_num));
	}

	 @PreAuthorize("isAuthenticated()") 
	@GetMapping("registercoupon")
	public void goRegisterCoupon(Model model,Principal principal) {
		String u_id = principal.getName();
		log.info("go reg coupon popup... user: " + u_id);
	}
	 
	@PreAuthorize("isAuthenticated()") 
	@PostMapping("registercoupon")
	@ResponseBody
	public String doRegisterCoupon(RedirectAttributes rttr,Principal principal,
			@RequestParam String serial) {
		String u_id = principal.getName();
		rttr.addAttribute("u_id",u_id);
		
		log.info("do reg coupon popup... user: " + u_id);
		
		//serial로 쿠폰 select 후 couponvo객체에 정보 담기
		CouponVO cpVO = cService.checkKeys(serial);
		
		CouponVO vo = new CouponVO();
		
		//쿠폰 입력을 위한 유저,쿠폰정보
		vo.setU_id(u_id);
		vo.setCp_num(cpVO.getCp_num());
		vo.setCp_expire(cpVO.getCp_expire());
		
		cService.insertCoupon(vo);
		
		log.info("coupon : " + vo);
		return "success";

		/* return "redirect:/shoppingmall/mypage/mycoupon"; */
	}

}