package org.project.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

import org.project.service.MyPageService;
import org.project.vo.CouponVO;
import org.project.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/shoppingmall/mypage/*")
public class MyPageController {
	@Autowired
	private MyPageService service;
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwEncoder;
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("mypage")
	public void goMyPage(Model model,Principal principal) {
		log.info("go mypage page... ");
		String u_id = principal.getName();
		
		model.addAttribute("u_id",u_id);
		model.addAttribute("myPageList",service.getPayedMyPageLists(u_id));
	}
	
	@GetMapping("updateuser")
	   public void goUpdateUser(Model model,Principal principal) {
	      log.info("go update page... ");
	      String u_id = principal.getName();
	      UserVO vo = service.readUserForUpdate(u_id);
	      
	      String pid1 = vo.getU_pid().split("-")[0];
	      String pid2 = vo.getU_pid().split("-")[1];
	      vo.setPid1(pid1);
	      vo.setPid2(pid2);
	      
	      model.addAttribute("u_id",u_id);
	      model.addAttribute("user",vo);
	   }
	   
	   @PostMapping("updateuser")
	   public String doUpdateUser(Model model,Principal principal, UserVO vo) {
	      log.info("go update page... ");
	      String u_id = principal.getName();
	      model.addAttribute("u_id",u_id);
	      
	      String pid1 = vo.getPid1();
	      String pid2 = vo.getPid2();
	      
	      vo.setU_pid(pid1+"-"+pid2);
	      
	      if(vo.getU_pw().equals("")) {
	         service.MyPageUpdateUserNoPw(vo);
	      }else {
	         vo.setU_pw(pwEncoder.encode(vo.getU_pw()));
	         service.MyPageUpdateUser(vo);
	      }
	      return "/shoppingmall/mypage/updateComplete";
	   }
	
	@GetMapping("mycoupon")
	public void goRegisterCoupon(Model model,Principal principal) {
		log.info("go register coupon page... ");
		String u_id = principal.getName();
		model.addAttribute("u_id",u_id);
		
		
		model.addAttribute("couponList",service.getMyCoupon(u_id));
	}
	
	@GetMapping("userout")
	public void goUserOut(Model model,Principal principal) {
		log.info("go user out page... ");
		String u_id = principal.getName();
		model.addAttribute("u_id",u_id);
	}
	
	@PostMapping("userout")
	public String doUserOut(RedirectAttributes rttr,Principal principal) {
		log.info("do user out page... ");
		String u_id = principal.getName();
		service.deleteUser(u_id);
		
		return "/shoppingmall/mypage/deleteComplete";
	}
	
	
}